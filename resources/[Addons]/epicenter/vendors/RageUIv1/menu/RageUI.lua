---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Dylan Malandain.
--- DateTime: 21/04/2019 21:20
---


---round
---@param num number
---@param numDecimalPlaces number
---@return number
---@public
function math.round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

---starts
---@param String string
---@param Start number
---@return number
---@public
function string.starts(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

---@type table
RageUIv1.Menus = setmetatable({}, RageUIv1.Menus)

---@type table
---@return boolean
RageUIv1.Menus.__call = function()
    return true
end

---@type table
RageUIv1.Menus.__index = RageUIv1.Menus

---@type table
RageUIv1.CurrentMenu = nil

---@type table
RageUIv1.NextMenu = nil

---@type number
RageUIv1.Options = 0

---@type number
RageUIv1.ItemOffset = 0

---@type number
RageUIv1.StatisticPanelCount = 0

---@type table
RageUIv1.UI = {
    Current = "RageUIv1",
    Style = {
        RageUIv1 = {
            Width = 0
        },
        NativeUI = {
            Width = 0
        }
    }
}

---@type table
RageUIv1.Settings = {
    Debug = false,
    Controls = {
        Up = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 172 },
                { 1, 172 },
                { 2, 172 },
                { 0, 241 },
                { 1, 241 },
                { 2, 241 },
            },
        },
        Down = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 173 },
                { 1, 173 },
                { 2, 173 },
                { 0, 242 },
                { 1, 242 },
                { 2, 242 },
            },
        },
        Left = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 174 },
                { 1, 174 },
                { 2, 174 },
            },
        },
        Right = {
            Enabled = true,
            Pressed = false,
            Active = false,
            Keys = {
                { 0, 175 },
                { 1, 175 },
                { 2, 175 },
            },
        },
        SliderLeft = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 174 },
                { 1, 174 },
                { 2, 174 },
            },
        },
        SliderRight = {
            Enabled = true,
            Pressed = false,
            Active = false,
            Keys = {
                { 0, 175 },
                { 1, 175 },
                { 2, 175 },
            },
        },
        Select = {
            Enabled = true,
            Pressed = false,
            Active = false,
            Keys = {
                { 0, 201 },
                { 1, 201 },
                { 2, 201 },
            },
        },
        Back = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 177 },
                { 1, 177 },
                { 2, 177 },
                { 0, 199 },
                { 1, 199 },
                { 2, 199 },
            },
        },
        Click = {
            Enabled = true,
            Active = false,
            Pressed = false,
            Keys = {
                { 0, 24 },
            },
        },
        Enabled = {
            Controller = {
                { 0, 2 }, -- Look Up and Down
                { 0, 1 }, -- Look Left and Right
                { 0, 25 }, -- Aim
                { 0, 24 }, -- Attack
            },
            Keyboard = {
                { 0, 201 }, -- Select
                { 0, 195 }, -- X axis
                { 0, 196 }, -- Y axis
                { 0, 187 }, -- Down
                { 0, 188 }, -- Up
                { 0, 189 }, -- Left
                { 0, 190 }, -- Right
                { 0, 202 }, -- Back
                { 0, 217 }, -- Select
                { 0, 242 }, -- Scroll down
                { 0, 241 }, -- Scroll up
                { 0, 239 }, -- Cursor X
                { 0, 240 }, -- Cursor Y
                { 0, 31 }, -- Move Up and Down
                { 0, 30 }, -- Move Left and Right
                { 0, 21 }, -- Sprint
                { 0, 22 }, -- Jump
                { 0, 23 }, -- Enter
                { 0, 75 }, -- Exit Vehicle
                { 0, 71 }, -- Accelerate Vehicle
                { 0, 72 }, -- Vehicle Brake
                { 0, 59 }, -- Move Vehicle Left and Right
                { 0, 89 }, -- Fly Yaw Left
                { 0, 9 }, -- Fly Left and Right
                { 0, 8 }, -- Fly Up and Down
                { 0, 90 }, -- Fly Yaw Right
                { 0, 76 }, -- Vehicle Handbrake
            },
        },
    },
    Audio = {
        Id = nil,
        Use = "RageUIv1",
        RageUIv1 = {
            UpDown = {
                audioName = "HUD_FREEMODE_SOUNDSET",
                audioRef = "NAV_UP_DOWN",
            },
            LeftRight = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "NAV_LEFT_RIGHT",
            },
            Select = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "SELECT",
            },
            Back = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "BACK",
            },
            Error = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "ERROR",
            },
            Slider = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "CONTINUOUS_SLIDER",
                Id = nil
            },
        },
        NativeUI = {
            UpDown = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "NAV_UP_DOWN",
            },
            LeftRight = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "NAV_LEFT_RIGHT",
            },
            Select = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "SELECT",
            },
            Back = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "BACK",
            },
            Error = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "ERROR",
            },
            Slider = {
                audioName = "HUD_FRONTEND_DEFAULT_SOUNDSET",
                audioRef = "CONTINUOUS_SLIDER",
                Id = nil
            },
        }
    },
    Items = {
        Title = {
            Background = { Width = 491, Height = 107 },
            Text = { X = 215, Y = 13, Scale = 1.15 },
        },
        Subtitle = {
            Background = { Width = 491, Height = 37 },
            Text = { X = 15, Y = 11, Scale = 0.25 },
            PreText = { X = 481, Y = 6, Scale = 0.26 },
        },
        Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 0, Width = 491 },
        Navigation = {
            Rectangle = { Width = 490, Height = 0 },
            Offset = 5,
            Arrows = { Dictionary = "commonmenu", Texture = "shop_arrows_upanddown", X = 210, Y = 2, Width = 0 , Height = 0 },
        },
        Description = {
            Bar = { Y = 40, Width = 490, Height = 4 },
            Background = { Dictionary = "commonmenu", Texture = "gradient_bgd", Y = 4, Width = 491, Height = 30 },
            Text = { X = 8, Y = 7.5, Scale = 0.21 },
        },
    },
    Panels = {
        Grid = {
            Background = { Dictionary = "commonmenu.ytd", Texture = "gradient_bgd", Y = 4, Width = 431, Height = 275 },
            Grid = { Dictionary = "pause_menu_pages_char_mom_dad", Texture = "nose_grid", X = 115.5, Y = 47.5, Width = 200, Height = 200 },
            Circle = { Dictionary = "mpinventory", Texture = "in_world_circle", X = 115.5, Y = 47.5, Width = 20, Height = 20 },
            Text = {
                Top = { X = 215.5, Y = 15, Scale = 0.35 },
                Bottom = { X = 215.5, Y = 250, Scale = 0.35 },
                Left = { X = 57.75, Y = 130, Scale = 0.35 },
                Right = { X = 373.25, Y = 130, Scale = 0.35 },
            },
        },
        Percentage = {
            Background = { Dictionary = "commonmenu.ytd", Texture = "gradient_bgd", Y = 4, Width = 431, Height = 76 },
            Bar = { X = 9, Y = 50, Width = 413, Height = 10 },
            Text = {
                Left = { X = 25, Y = 15, Scale = 0.35 },
                Middle = { X = 215.5, Y = 15, Scale = 0.35 },
                Right = { X = 398, Y = 15, Scale = 0.35 },
            },
        },
    },
}

function RageUIv1.SetScaleformParams(scaleform, data)
    data = data or {}
    for k, v in pairs(data) do
        PushScaleformMovieFunction(scaleform, v.name)
        if v.param then
            for _, par in pairs(v.param) do
                if math.type(par) == "integer" then
                    PushScaleformMovieFunctionParameterInt(par)
                elseif type(par) == "boolean" then
                    PushScaleformMovieFunctionParameterBool(par)
                elseif math.type(par) == "float" then
                    PushScaleformMovieFunctionParameterFloat(par)
                elseif type(par) == "string" then
                    PushScaleformMovieFunctionParameterString(par)
                end
            end
        end
        if v.func then
            v.func()
        end
        PopScaleformMovieFunctionVoid()
    end
end

---Visible
---@param Menu function
---@param Value boolean
---@return table
---@public
function RageUIv1.Visible(Menu, Value)
    if Menu ~= nil then
        if Menu() then
            if type(Value) == "boolean" then
                if Value then
                    if RageUIv1.CurrentMenu ~= nil then
                        RageUIv1.CurrentMenu.Closed()
                        RageUIv1.CurrentMenu.Open = not Value
                    end
                    Menu:UpdateInstructionalButtons(Value);
                    Menu:UpdateCursorStyle();
                    RageUIv1.CurrentMenu = Menu
                    menuOpen = true
                else
                    menuOpen = false
                    RageUIv1.CurrentMenu = nil
                end
                Menu.Open = Value
                RageUIv1.Options = 0
                RageUIv1.ItemOffset = 0
                RageUIv1.LastControl = false
            else
                return Menu.Open
            end
        end
    end
end 

function RageUIv1.CloseAll()
    menuOpen = false

    if RageUIv1.CurrentMenu ~= nil then
        local parent = RageUIv1.CurrentMenu.Parent
        while parent ~= nil do
            parent.Index = 1
            parent.Pagination.Minimum = 1
            parent.Pagination.Maximum = 10
            parent = parent.Parent
        end
        RageUIv1.CurrentMenu.Index = 1
        RageUIv1.CurrentMenu.Pagination.Minimum = 1
        RageUIv1.CurrentMenu.Pagination.Maximum = 10
        RageUIv1.CurrentMenu.Open = false
        RageUIv1.CurrentMenu = nil
    end
    RageUIv1.Options = 0
    RageUIv1.ItemOffset = 0
    ResetScriptGfxAlign()
end

---Banner
---@return nil
---@public
---@param Enabled boolean
function RageUIv1.Banner(Enabled, Glare)
    if type(Enabled) == "boolean" then
        if Enabled == true then


            if RageUIv1.CurrentMenu ~= nil then
                if RageUIv1.CurrentMenu() then


                    RageUIv1.ItemsSafeZone(RageUIv1.CurrentMenu)

                    if RageUIv1.CurrentMenu.Sprite then
                        RenderSprite(RageUIv1.CurrentMenu.Sprite.Dictionary, RageUIv1.CurrentMenu.Sprite.Texture, RageUIv1.CurrentMenu.X, RageUIv1.CurrentMenu.Y, RageUIv1.Settings.Items.Title.Background.Width + RageUIv1.CurrentMenu.WidthOffset, RageUIv1.Settings.Items.Title.Background.Height, nil)
                    else
                        RenderRectangle(RageUIv1.CurrentMenu.X, RageUIv1.CurrentMenu.Y, RageUIv1.Settings.Items.Title.Background.Width + RageUIv1.CurrentMenu.WidthOffset, RageUIv1.Settings.Items.Title.Background.Height, RageUIv1.CurrentMenu.Rectangle.R, RageUIv1.CurrentMenu.Rectangle.G, RageUIv1.CurrentMenu.Rectangle.B, RageUIv1.CurrentMenu.Rectangle.A)
                    end

                    RenderText(RageUIv1.CurrentMenu.Title, RageUIv1.CurrentMenu.X + RageUIv1.Settings.Items.Title.Text.X + (RageUIv1.CurrentMenu.WidthOffset / 2), RageUIv1.CurrentMenu.Y + RageUIv1.Settings.Items.Title.Text.Y, 4, RageUIv1.Settings.Items.Title.Text.Scale, 255, 255, 255, 255, 1)
                    RageUIv1.ItemOffset = RageUIv1.ItemOffset + RageUIv1.Settings.Items.Title.Background.Height
                end
            end
        end
    else
        error("Enabled is not boolean")
    end
end

---CloseAll -- TODO 
---@return nil
---@public
-- function RageUIv1:CloseAll()
--     RageUIv1.PlaySound(RageUIv1.Settings.Audio.Library, RageUIv1.Settings.Audio.Back)
--     RageUIv1.NextMenu = nil
--     RageUIv1.Visible(RageUIv1.CurrentMenu, false)
-- end

---Subtitle
---@return nil
---@public
function RageUIv1.Subtitle()
    if RageUIv1.CurrentMenu ~= nil then
        if RageUIv1.CurrentMenu() then
            RageUIv1.ItemsSafeZone(RageUIv1.CurrentMenu)
            if RageUIv1.CurrentMenu.Subtitle ~= "" then
                --RenderRectangle(RageUIv1.CurrentMenu.X, RageUIv1.CurrentMenu.Y + RageUIv1.ItemOffset, RageUIv1.Settings.Items.Subtitle.Background.Width + RageUIv1.CurrentMenu.WidthOffset, RageUIv1.Settings.Items.Subtitle.Background.Height + RageUIv1.CurrentMenu.SubtitleHeight, 0, 0, 0, 255)
                RenderRectangle(RageUIv1.CurrentMenu.X, RageUIv1.CurrentMenu.Y + RageUIv1.ItemOffset, RageUIv1.Settings.Items.Subtitle.Background.Width - 1 + RageUIv1.CurrentMenu.WidthOffset, RageUIv1.Settings.Items.Subtitle.Background.Height + RageUIv1.CurrentMenu.SubtitleHeight, 12, 16, 21, 255)
                --RenderText(RageUIv1.CurrentMenu.Subtitle, RageUIv1.CurrentMenu.X + RageUIv1.Settings.Items.Subtitle.Text.X, RageUIv1.CurrentMenu.Y + RageUIv1.Settings.Items.Subtitle.Text.Y + RageUIv1.ItemOffset, 0, RageUIv1.Settings.Items.Subtitle.Text.Scale, 245, 245, 245, 255, nil, false, false, RageUIv1.Settings.Items.Subtitle.Background.Width + RageUIv1.CurrentMenu.WidthOffset)
                RenderText(RageUIv1.CurrentMenu.PageCounterColour .. RageUIv1.CurrentMenu.Subtitle, RageUIv1.CurrentMenu.X + RageUIv1.Settings.Items.Subtitle.Text.X, RageUIv1.CurrentMenu.Y + -6 + RageUIv1.Settings.Items.Subtitle.Text.Y + RageUIv1.ItemOffset, 0, RageUIv1.Settings.Items.Subtitle.Text.Scale, 245, 245, 245, 255, nil, false, false, RageUIv1.Settings.Items.Subtitle.Background.Width + RageUIv1.CurrentMenu.WidthOffset)
                if RageUIv1.CurrentMenu.Index > RageUIv1.CurrentMenu.Options or RageUIv1.CurrentMenu.Index < 0 then
                    RageUIv1.CurrentMenu.Index = 1
                end
                RageUIv1.RefreshPagination()
                if RageUIv1.CurrentMenu.PageCounter == nil then
                    --RenderText(RageUIv1.CurrentMenu.PageCounterColour .. RageUIv1.CurrentMenu.Index .. " / " .. RageUIv1.CurrentMenu.Options, RageUIv1.CurrentMenu.X + RageUIv1.Settings.Items.Subtitle.PreText.X + RageUIv1.CurrentMenu.WidthOffset, RageUIv1.CurrentMenu.Y + RageUIv1.Settings.Items.Subtitle.PreText.Y + RageUIv1.ItemOffset, 0, RageUIv1.Settings.Items.Subtitle.PreText.Scale, 245, 245, 245, 255, 2)
                    RenderText(RageUIv1.CurrentMenu.PageCounterColour .. RageUIv1.CurrentMenu.Index .. " / " ..RageUIv1.CurrentMenu.Options, RageUIv1.CurrentMenu.X + RageUIv1.Settings.Items.Subtitle.PreText.X + RageUIv1.CurrentMenu.WidthOffset, RageUIv1.CurrentMenu.Y + 0 + RageUIv1.Settings.Items.Subtitle.PreText.Y + RageUIv1.ItemOffset, 0, RageUIv1.Settings.Items.Subtitle.PreText.Scale, 245, 245, 245, 255, 2)
                else
                    --RenderText(RageUIv1.CurrentMenu.PageCounter, RageUIv1.CurrentMenu.X + RageUIv1.Settings.Items.Subtitle.PreText.X + RageUIv1.CurrentMenu.WidthOffset, RageUIv1.CurrentMenu.Y + RageUIv1.Settings.Items.Subtitle.PreText.Y + RageUIv1.ItemOffset, 0, RageUIv1.Settings.Items.Subtitle.PreText.Scale, 245, 245, 245, 255, 2)
                    RenderText(RageUIv1.CurrentMenu.PageCounter, CurrentMenu.X + RageUI.Settings.Items.Subtitle.PreText.X + CurrentMenu.WidthOffset, CurrentMenu.Y + RageUI.Settings.Items.Subtitle.PreText.Y + RageUI.ItemOffset, 0, RageUI.Settings.Items.Subtitle.PreText.Scale, 245, 245, 245, 255, 2)
                end
                RageUIv1.ItemOffset = RageUIv1.ItemOffset + RageUIv1.Settings.Items.Subtitle.Background.Height
            end
        end
    end
end

---Background
---@return nil
---@public
function RageUIv1.Background()
    if RageUIv1.CurrentMenu ~= nil then
        if RageUIv1.CurrentMenu() then
            RageUIv1.ItemsSafeZone(RageUIv1.CurrentMenu)
            -- SetScriptGfxDrawOrder(0)
            -- RenderSprite(RageUIv1.Settings.Items.Background.Dictionary, RageUIv1.Settings.Items.Background.Texture, RageUIv1.CurrentMenu.X, RageUIv1.CurrentMenu.Y + RageUIv1.Settings.Items.Background.Y + RageUIv1.CurrentMenu.SubtitleHeight, RageUIv1.Settings.Items.Background.Width + RageUIv1.CurrentMenu.WidthOffset, RageUIv1.ItemOffset, 255, 255, 255)
            -- SetScriptGfxDrawOrder(1)
            SetScriptGfxDrawOrder(0)
            RenderRectangle(RageUIv1.CurrentMenu.X, RageUIv1.CurrentMenu.Y + RageUIv1.Settings.Items.Background.Y + 10 + RageUIv1.CurrentMenu.SubtitleHeight, RageUIv1.Settings.Items.Background.Width - 1 + RageUIv1.CurrentMenu.WidthOffset, RageUIv1.ItemOffset, 12, 16, 21, 255)
            SetScriptGfxDrawOrder(1)
        end
    end
end

---Description
---@return nil
---@public
function RageUIv1.Description()
    if RageUIv1.CurrentMenu ~= nil and RageUIv1.CurrentMenu.Description ~= nil then
        if RageUIv1.CurrentMenu() then
            RageUIv1.ItemsSafeZone(RageUIv1.CurrentMenu)
            RenderRectangle(RageUIv1.CurrentMenu.X, RageUIv1.CurrentMenu.Y + RageUIv1.Settings.Items.Description.Bar.Y + RageUIv1.CurrentMenu.SubtitleHeight + RageUIv1.ItemOffset, RageUIv1.Settings.Items.Description.Bar.Width + RageUIv1.CurrentMenu.WidthOffset, RageUIv1.Settings.Items.Description.Bar.Height, 255, 255, 255)
            RenderSprite(RageUIv1.Settings.Items.Description.Background.Dictionary, RageUIv1.Settings.Items.Description.Background.Texture, RageUIv1.CurrentMenu.X, RageUIv1.CurrentMenu.Y + RageUIv1.Settings.Items.Description.Background.Y + RageUIv1.CurrentMenu.SubtitleHeight + RageUIv1.ItemOffset, RageUIv1.Settings.Items.Description.Background.Width + RageUIv1.CurrentMenu.WidthOffset, RageUIv1.CurrentMenu.DescriptionHeight, 255, 255, 255)
            RenderText(RageUIv1.CurrentMenu.Description, RageUIv1.CurrentMenu.X + RageUIv1.Settings.Items.Description.Text.X, RageUIv1.CurrentMenu.Y + RageUIv1.Settings.Items.Description.Text.Y + RageUIv1.CurrentMenu.SubtitleHeight + RageUIv1.ItemOffset, 0, RageUIv1.Settings.Items.Description.Text.Scale, 255, 255, 255, 255, nil, false, false, RageUIv1.Settings.Items.Description.Background.Width + RageUIv1.CurrentMenu.WidthOffset - 8.0)
            RageUIv1.ItemOffset = RageUIv1.ItemOffset + RageUIv1.CurrentMenu.DescriptionHeight + RageUIv1.Settings.Items.Description.Bar.Y
        end
    end
end

---Render
---@param instructionalButton boolean
---@return nil
---@public
function RageUIv1.Render(instructionalButton)
    if RageUIv1.CurrentMenu ~= nil then
        if RageUIv1.CurrentMenu() then
            if RageUIv1.CurrentMenu.Safezone then
                ResetScriptGfxAlign()
            end
            if (instructionalButton) then
                DrawScaleformMovieFullscreen(RageUIv1.CurrentMenu.InstructionalScaleform, 255, 255, 255, 255, 0)
            end
            RageUIv1.CurrentMenu.Options = RageUIv1.Options
            RageUIv1.CurrentMenu.SafeZoneSize = nil
            RageUIv1.Controls()
            RageUIv1.Options = 0
            RageUIv1.StatisticPanelCount = 0
            RageUIv1.ItemOffset = 0
            if RageUIv1.CurrentMenu.Controls.Back.Enabled and RageUIv1.CurrentMenu.Closable then
                if RageUIv1.CurrentMenu.Controls.Back.Pressed then
                    RageUIv1.CurrentMenu.Controls.Back.Pressed = false
                    local Audio = RageUIv1.Settings.Audio
                    RageUIv1.PlaySound(Audio[Audio.Use].Back.audioName, Audio[Audio.Use].Back.audioRef)
                    if RageUIv1.CurrentMenu.Closed ~= nil then
                        collectgarbage()
                        RageUIv1.CurrentMenu.Closed()
                    end
                    if RageUIv1.CurrentMenu.Parent ~= nil then
                        if RageUIv1.CurrentMenu.Parent() then
                            RageUIv1.NextMenu = RageUIv1.CurrentMenu.Parent
                            RageUIv1.CurrentMenu:UpdateCursorStyle()
                        else
                            --print('xxx') Debug print
                            RageUIv1.NextMenu = nil
                            RageUIv1.Visible(RageUIv1.CurrentMenu, false)
                        end
                    else
                        --print('zz') Debug print
                        RageUIv1.NextMenu = nil
                        RageUIv1.Visible(RageUIv1.CurrentMenu, false)
                    end
                end
            end
            if RageUIv1.NextMenu ~= nil then
                if RageUIv1.NextMenu() then
                    RageUIv1.Visible(RageUIv1.CurrentMenu, false)
                    RageUIv1.Visible(RageUIv1.NextMenu, true)
                    RageUIv1.CurrentMenu.Controls.Select.Active = false
                    RageUIv1.NextMenu = nil
                    RageUIv1.LastControl = false
                end
            end
        end
    end
end

---ItemsDescription
---@param CurrentMenu table
---@param Description string
---@param Selected boolean
---@return nil
---@public
function RageUIv1.ItemsDescription(CurrentMenu, Description, Selected)
    ---@type table
    if Description ~= "" or Description ~= nil then
        local SettingsDescription = RageUIv1.Settings.Items.Description;
        if Selected and CurrentMenu.Description ~= Description then
            CurrentMenu.Description = Description or nil
            ---@type number
            local DescriptionLineCount = GetLineCount(CurrentMenu.Description, CurrentMenu.X + SettingsDescription.Text.X, CurrentMenu.Y + SettingsDescription.Text.Y + CurrentMenu.SubtitleHeight + RageUIv1.ItemOffset, 0, SettingsDescription.Text.Scale, 255, 255, 255, 255, nil, false, false, SettingsDescription.Background.Width + (CurrentMenu.WidthOffset - 5.0))
            if DescriptionLineCount > 1 then
                CurrentMenu.DescriptionHeight = SettingsDescription.Background.Height * DescriptionLineCount
            else
                CurrentMenu.DescriptionHeight = SettingsDescription.Background.Height + 7
            end
        end
    end
end

---MouseBounds
---@param CurrentMenu table
---@param Selected boolean
---@param Option number
---@param SettingsButton table
---@return boolean
---@public
function RageUIv1.ItemsMouseBounds(CurrentMenu, Selected, Option, SettingsButton)
    ---@type boolean
    local Hovered = false
    Hovered = RageUIv1.IsMouseInBounds(CurrentMenu.X + CurrentMenu.SafeZoneSize.X, CurrentMenu.Y + SettingsButton.Rectangle.Y + CurrentMenu.SafeZoneSize.Y + CurrentMenu.SubtitleHeight + RageUIv1.ItemOffset, SettingsButton.Rectangle.Width + CurrentMenu.WidthOffset, SettingsButton.Rectangle.Height)
    if Hovered and not Selected then
        RenderRectangle(CurrentMenu.X, CurrentMenu.Y + SettingsButton.Rectangle.Y + CurrentMenu.SubtitleHeight + RageUIv1.ItemOffset, SettingsButton.Rectangle.Width + CurrentMenu.WidthOffset, SettingsButton.Rectangle.Height, 255, 255, 255, 20)
        if CurrentMenu.Controls.Click.Active then
            CurrentMenu.Index = Option
            local Audio = RageUIv1.Settings.Audio
            RageUIv1.PlaySound(Audio[Audio.Use].Error.audioName, Audio[Audio.Use].Error.audioRef)
        end
    end
    return Hovered;
end

---ItemsSafeZone
---@param CurrentMenu table
---@return nil
---@public
function RageUIv1.ItemsSafeZone(CurrentMenu)
    if not CurrentMenu.SafeZoneSize then
        CurrentMenu.SafeZoneSize = { X = 0, Y = 0 }
        if CurrentMenu.Safezone then
            CurrentMenu.SafeZoneSize = RageUIv1.GetSafeZoneBounds()
            SetScriptGfxAlign(76, 84)
            SetScriptGfxAlignParams(0, 0, 0, 0)
        end
    end
end

function RageUIv1.CurrentIsEqualTo(Current, To, Style, DefaultStyle)
    if (Current == To) then
        return Style;
    else
        return DefaultStyle or {};
    end
end

function RageUIv1.RefreshPagination()
    if (RageUIv1.CurrentMenu ~= nil) then
        if (RageUIv1.CurrentMenu.Index > 10) then
            local offset = RageUIv1.CurrentMenu.Index - 10
            RageUIv1.CurrentMenu.Pagination.Minimum = 1 + offset
            RageUIv1.CurrentMenu.Pagination.Maximum = 10 + offset
        else
            RageUIv1.CurrentMenu.Pagination.Minimum = 1
            RageUIv1.CurrentMenu.Pagination.Maximum = 10
        end
    end
end

function RageUIv1.IsVisible(menu, header, glare, instructional, items, panels)
    if (RageUIv1.Visible(menu)) then
        if (header == true) then
            RageUIv1.Banner(true, glare or false)
        end
        RageUIv1.Subtitle()
        if (items ~= nil) then
            items()
        end
        RageUIv1.Background();
        RageUIv1.Navigation();
        RageUIv1.Description();
        if (panels ~= nil) then
            panels()
        end
        RageUIv1.Render(instructional or false)
    end
end


---CreateWhile
---@param wait number
---@param menu table
---@param key number
---@param closure function
---@return void
---@public
function RageUIv1.CreateWhile(wait, menu, key, closure)
    Citizen.CreateThread(function()
        while (true) do
            Citizen.Wait(wait or 0.1)

            if (key ~= nil) then
                if IsControlJustPressed(1, key) then
                    RageUIv1.Visible(menu, not RageUIv1.Visible(menu))
                end
            end

            closure()
        end
    end)
end

---SetStyleAudio
---@param StyleAudio string
---@return void
---@public
function RageUIv1.SetStyleAudio(StyleAudio)
    RageUIv1.Settings.Audio.Use = StyleAudio or "RageUIv1"
end

function RageUIv1.GetStyleAudio()
    return RageUIv1.Settings.Audio.Use or "RageUIv1"
end

