-- Companion information panel for the Nenyoo edition of Ultimate Menu.
-- The menu adapter publishes text on the script thread. Draw only the
-- published strings here; overlay.on_draw runs on Nenyoo's render thread.
return function(compat)
    local scroll_by_page = {}
    local last_page

    local function clamp(value, low, high)
        return math.max(low, math.min(high, value))
    end

    local function wrap_paragraph(value, max_width, output, heading, color)
        local line = ""
        for word in value:gmatch("%S+") do
            local candidate = line == "" and word or line .. " " .. word
            if line ~= "" and text.width(font.small, candidate) > max_width then
                output[#output + 1] = {text = line, heading = heading, color = color}
                line = word
            else
                line = candidate
            end
        end
        if line ~= "" then output[#output + 1] = {text = line, heading = heading, color = color} end
    end

    local function make_lines(rows, max_width)
        local lines = {}
        for _, row in ipairs(rows) do
            local value = tostring(row.text or ""):gsub("\r", "")
            if value == "" then
                lines[#lines + 1] = {gap = 8}
            else
                local compact = value:gsub("%s+", " "):match("^%s*(.-)%s*$")
                local heading = #compact <= 38 and (compact:sub(-1) == ":" or compact == "Preps")
                for paragraph in (value .. "\n"):gmatch("(.-)\n") do
                    if paragraph:match("%S") then wrap_paragraph(paragraph, max_width, lines, heading, row.color)
                    else lines[#lines + 1] = {gap = 8} end
                end
                lines[#lines + 1] = {gap = heading and 7 or 11}
            end
            if row.tooltip then
                wrap_paragraph(row.tooltip:gsub("%s+", " "), max_width, lines, false, nil)
                lines[#lines + 1] = {gap = 11}
            end
        end
        while #lines > 0 and lines[#lines].gap do lines[#lines] = nil end
        return lines
    end

    overlay.on_draw("ultimate_menu_information", function()
        if not menu.is_visible() then return end
        local id = menu.page_id()
        local info = compat.info_for_page(id)
        if not info or #info.rows == 0 then return end
        local sw, sh = ctx.screen_w(), ctx.screen_h()
        local bx, by, bw = menu.bounds()
        if not bw or bw <= 0 then return end

        local gap, pad, header_h = 14, 14, 36
        local width = math.min(420, math.max(280, sw * 0.30))
        local side = bx + bw + gap + width <= sw - 8 or bx - gap - width >= 8
        if not side then width = math.min(600, sw - 16) end
        local x
        if side and bx + bw + gap + width <= sw - 8 then x = bx + bw + gap
        elseif side then x = bx - gap - width
        else x = clamp(bx + (bw - width) * 0.5, 8, sw - width - 8) end

        local lines = make_lines(info.rows, width - pad * 2)
        if #lines == 0 then return end
        local line_h = text.height(font.small) + 4
        local content_h = 0
        for _, line in ipairs(lines) do content_h = content_h + (line.gap or line_h) end
        local desired_h = header_h + pad * 2 + content_h
        local height = math.min(desired_h, sh - 16, 650)
        local y = clamp(by, 8, sh - height - 8)
        if not side then
            local _, content_y, _, content_height = menu.content_rect()
            local below = content_y + content_height + 56
            local space_below = sh - below - 8
            if content_height > 0 and space_below >= 170 then
                y = below
                height = math.min(height, space_below)
            elseif by >= 180 then
                height = math.min(height, by - 16)
                y = by - height - 8
            end
        end
        local viewport_h = height - header_h - pad * 2
        if viewport_h <= line_h then return end

        if last_page ~= id then scroll_by_page[id] = 0; last_page = id end
        local max_scroll = math.max(0, content_h - viewport_h)
        local scroll = clamp(scroll_by_page[id] or 0, 0, max_scroll)
        local mx, my = input.mouse_x(), input.mouse_y()
        if mx >= x and mx <= x + width and my >= y and my <= y + height then
            scroll = clamp(scroll - input.mouse_wheel() * line_h * 3, 0, max_scroll)
        end
        scroll_by_page[id] = scroll

        local ar, ag, ab = theme.accent()
        draw.rect(x, y, x + width, y + height, 12, 15, 22, 232, 7)
        draw.rect(x, y, x + width, y + header_h, 24, 32, 44, 245, 7)
        draw.rect(x, y + header_h - 2, x + width, y + header_h, ar, ag, ab, 255)
        draw.rect_outline(x, y, x + width, y + height, ar, ag, ab, 125, 7)
        text.draw_ellipsis(font.item, x + pad, y + (header_h - text.height(font.item)) * 0.5,
            240, 245, 250, 255, info.title, width - pad * 2)

        local top = y + header_h + pad
        draw.push_clip(x + pad, top, x + width - pad, top + viewport_h)
        local cursor = top - scroll
        for _, line in ipairs(lines) do
            if line.gap then cursor = cursor + line.gap
            else
                if cursor + line_h >= top and cursor <= top + viewport_h then
                    local r, g, b = 220, 228, 238
                    if line.heading then r, g, b = ar, ag, ab end
                    if line.color then
                        local function channel(value)
                            value = value or 1
                            return clamp(math.floor((value <= 1 and value * 255 or value) + 0.5), 0, 255)
                        end
                        r, g, b = channel(line.color[1]), channel(line.color[2]), channel(line.color[3])
                    end
                    text.draw(font.small, x + pad, cursor, r, g, b, 245, line.text)
                end
                cursor = cursor + line_h
            end
        end
        draw.pop_clip()
        if max_scroll > 0 then
            local track_top, track_height = top, viewport_h
            local thumb_h = math.max(22, track_height * viewport_h / content_h)
            local thumb_y = track_top + (track_height - thumb_h) * scroll / max_scroll
            draw.rect(x + width - 5, thumb_y, x + width - 2, thumb_y + thumb_h,
                ar, ag, ab, 190, 2)
        end
    end)
end
