-- Iris-X

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local LP = Players.LocalPlayer
local PG = LP:WaitForChild("PlayerGui")

local ICON = {
    BLANK_SQUARE            = "rbxassetid://83265623867126",
    RIGHT_POINTING_TRIANGLE = "rbxassetid://105541346271951",
    DOWN_POINTING_TRIANGLE  = "rbxassetid://95465797476827",
    MULTIPLICATION_SIGN     = "rbxassetid://133890060015237",
    BOTTOM_RIGHT_CORNER     = "rbxassetid://125737344915000",
    CHECKMARK               = "rbxassetid://109638815494221",
}

local THEMES = {
    dark = {
        TextColor = Color3.fromRGB(255, 255, 255),
        TextTransparency = 0,
        TextDisabledColor = Color3.fromRGB(128, 128, 128),
        BorderColor = Color3.fromRGB(110, 110, 125),
        BorderTransparency = 0.5,
        WindowBgColor = Color3.fromRGB(15, 15, 15),
        WindowBgTransparency = 0.06,
        PopupBgColor = Color3.fromRGB(20, 20, 20),
        PopupBgTransparency = 0.06,
        ScrollbarGrabColor = Color3.fromRGB(79, 79, 79),
        ScrollbarGrabTransparency = 0,
        TitleBgActiveColor = Color3.fromRGB(41, 74, 122),
        TitleBgActiveTransparency = 0,
        FrameBgColor = Color3.fromRGB(41, 74, 122),
        FrameBgTransparency = 0.46,
        FrameBgHoveredColor = Color3.fromRGB(66, 150, 250),
        FrameBgHoveredTransparency = 0.46,
        FrameBgActiveColor = Color3.fromRGB(66, 150, 250),
        FrameBgActiveTransparency = 0.33,
        ButtonColor = Color3.fromRGB(66, 150, 250),
        ButtonTransparency = 0.6,
        ButtonHoveredColor = Color3.fromRGB(66, 150, 250),
        ButtonHoveredTransparency = 0,
        ButtonActiveColor = Color3.fromRGB(15, 135, 250),
        ButtonActiveTransparency = 0,
        SliderGrabColor = Color3.fromRGB(66, 150, 250),
        SliderGrabTransparency = 0,
        SliderGrabActiveColor = Color3.fromRGB(66, 150, 250),
        SliderGrabActiveTransparency = 0,
        HeaderColor = Color3.fromRGB(66, 150, 250),
        HeaderTransparency = 0.69,
        HeaderHoveredColor = Color3.fromRGB(66, 150, 250),
        HeaderHoveredTransparency = 0.2,
        HeaderActiveColor = Color3.fromRGB(66, 150, 250),
        HeaderActiveTransparency = 0,
        TabColor = Color3.fromRGB(46, 89, 148),
        TabTransparency = 0.14,
        TabHoveredColor = Color3.fromRGB(66, 150, 250),
        TabHoveredTransparency = 0.2,
        TabActiveColor = Color3.fromRGB(51, 105, 173),
        TabActiveTransparency = 0,
        SeparatorColor = Color3.fromRGB(110, 110, 128),
        SeparatorTransparency = 0.5,
        CheckMarkColor = Color3.fromRGB(66, 150, 250),
        CheckMarkTransparency = 0,
        ResizeGripColor = Color3.fromRGB(66, 150, 250),
        ResizeGripTransparency = 0.8,
        ResizeGripHoveredColor = Color3.fromRGB(66, 150, 250),
        ResizeGripHoveredTransparency = 0.33,
        ResizeGripActiveColor = Color3.fromRGB(66, 150, 250),
        ResizeGripActiveTransparency = 0.05,
    },
    light = {
        TextColor = Color3.fromRGB(0, 0, 0),
        TextTransparency = 0,
        TextDisabledColor = Color3.fromRGB(153, 153, 153),
        BorderColor = Color3.fromRGB(64, 64, 64),
        BorderTransparency = 0.5,
        WindowBgColor = Color3.fromRGB(240, 240, 240),
        WindowBgTransparency = 0,
        PopupBgColor = Color3.fromRGB(255, 255, 255),
        PopupBgTransparency = 0.02,
        ScrollbarGrabColor = Color3.fromRGB(176, 176, 176),
        ScrollbarGrabTransparency = 0.2,
        TitleBgActiveColor = Color3.fromRGB(209, 209, 209),
        TitleBgActiveTransparency = 0,
        FrameBgColor = Color3.fromRGB(255, 255, 255),
        FrameBgTransparency = 0.6,
        FrameBgHoveredColor = Color3.fromRGB(66, 150, 250),
        FrameBgHoveredTransparency = 0.6,
        FrameBgActiveColor = Color3.fromRGB(66, 150, 250),
        FrameBgActiveTransparency = 0.33,
        ButtonColor = Color3.fromRGB(66, 150, 250),
        ButtonTransparency = 0.6,
        ButtonHoveredColor = Color3.fromRGB(66, 150, 250),
        ButtonHoveredTransparency = 0,
        ButtonActiveColor = Color3.fromRGB(15, 135, 250),
        ButtonActiveTransparency = 0,
        SliderGrabColor = Color3.fromRGB(41, 74, 122),
        SliderGrabTransparency = 0,
        SliderGrabActiveColor = Color3.fromRGB(15, 135, 250),
        SliderGrabActiveTransparency = 0,
        HeaderColor = Color3.fromRGB(66, 150, 250),
        HeaderTransparency = 0.31,
        HeaderHoveredColor = Color3.fromRGB(66, 150, 250),
        HeaderHoveredTransparency = 0.2,
        HeaderActiveColor = Color3.fromRGB(66, 150, 250),
        HeaderActiveTransparency = 0,
        TabColor = Color3.fromRGB(195, 203, 213),
        TabTransparency = 0.07,
        TabHoveredColor = Color3.fromRGB(66, 150, 250),
        TabHoveredTransparency = 0.2,
        TabActiveColor = Color3.fromRGB(152, 186, 255),
        TabActiveTransparency = 0,
        SeparatorColor = Color3.fromRGB(99, 99, 99),
        SeparatorTransparency = 0.38,
        CheckMarkColor = Color3.fromRGB(66, 150, 250),
        CheckMarkTransparency = 0,
        ResizeGripColor = Color3.fromRGB(89, 89, 89),
        ResizeGripTransparency = 0.83,
        ResizeGripHoveredColor = Color3.fromRGB(66, 150, 250),
        ResizeGripHoveredTransparency = 0.33,
        ResizeGripActiveColor = Color3.fromRGB(66, 150, 250),
        ResizeGripActiveTransparency = 0.05,
    },
}

local NOTIFY_TEXT_COLORS = {
    info    = Color3.fromRGB(230, 230, 230),
    success = Color3.fromRGB(150, 230, 170),
    warning = Color3.fromRGB(240, 200, 120),
    error   = Color3.fromRGB(240, 130, 130),
}

local NOTIFY_PREFIX = {
    info    = "[info]",
    success = "[ok]",
    warning = "[warn]",
    error   = "[error]",
}

local NOTIFY_POSITIONS = {
    TopLeft = { anchor = Vector2.new(0, 0), dir = Vector2.new(0, 1), offset = UDim2.new(0, 10, 0, 10) },
    TopRight = { anchor = Vector2.new(1, 0), dir = Vector2.new(0, 1), offset = UDim2.new(1, -10, 0, 10) },
    TopCenter = { anchor = Vector2.new(0.5, 0), dir = Vector2.new(0, 1), offset = UDim2.new(0.5, 0, 0, 10) },
    BottomLeft = { anchor = Vector2.new(0, 1), dir = Vector2.new(0, -1), offset = UDim2.new(0, 10, 1, -10) },
    BottomRight = { anchor = Vector2.new(1, 1), dir = Vector2.new(0, -1), offset = UDim2.new(1, -10, 1, -10) },
    BottomCenter = { anchor = Vector2.new(0.5, 1), dir = Vector2.new(0, -1), offset = UDim2.new(0.5, 0, 1, -10) },
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props or {}) do o[k] = v end
    if parent then o.Parent = parent end
    return o
end

local function UIStroke(parent, thickness, color, transparency)
    return new("UIStroke", {
        Thickness = thickness, Color = color, Transparency = transparency,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        LineJoinMode = Enum.LineJoinMode.Round,
    }, parent)
end

local function UIPadding(parent, px)
    return new("UIPadding", {
        PaddingLeft   = UDim.new(0, px.X),
        PaddingRight  = UDim.new(0, px.X),
        PaddingTop    = UDim.new(0, px.Y),
        PaddingBottom = UDim.new(0, px.Y),
    }, parent)
end

local function UIListLayout(parent, fill, padding)
    return new("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        FillDirection = fill,
        Padding = padding,
    }, parent)
end

local function UICorner(parent, px)
    return new("UICorner", { CornerRadius = UDim.new(px and 0 or 1, px or 0) }, parent)
end

local IrisX = {}
IrisX.ICON = ICON
IrisX.THEMES = THEMES
IrisX.NOTIFY_TEXT_COLORS = NOTIFY_TEXT_COLORS
IrisX.NOTIFY_PREFIX = NOTIFY_PREFIX
IrisX.NOTIFY_POSITIONS = NOTIFY_POSITIONS

for _, gui in ipairs(PG:GetChildren()) do
    if gui:IsA("ScreenGui") and (gui.Name == "IrisX" or gui.Name == "IrisX_Popups" or gui.Name == "IrisX_Notify") then
        gui:Destroy()
    end
end

local RootGui = new("ScreenGui", {
    Name = "IrisX",
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    IgnoreGuiInset = false,
}, PG)

local PopupGui = new("ScreenGui", {
    Name = "IrisX_Popups",
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    DisplayOrder = 999,
    IgnoreGuiInset = false,
}, PG)

local NotifyGui = new("ScreenGui", {
    Name = "IrisX_Notify",
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    DisplayOrder = 9999,
    IgnoreGuiInset = false,
}, PG)

local function getMouse()
    return UserInputService:GetMouseLocation() - GuiService:GetGuiInset()
end

local OpenPopups = {}

local function closeAllPopups(except)
    for popup in pairs(OpenPopups) do
        if popup ~= except then popup.Close() end
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1
       or input.UserInputType == Enum.UserInputType.Touch then
        closeAllPopups()
    end
end)

local ActiveNotifications = {}
local ActiveByKey = {}
local DefaultNotifyPosition = "TopRight"

local function repositionNotifications(position)
    local cfg = NOTIFY_POSITIONS[position] or NOTIFY_POSITIONS.TopRight
    local index = 0
    for _, notif in ipairs(ActiveNotifications) do
        if notif.position == position and notif.instance.Parent then
            local gap = 2
            local notch = notif.instance.AbsoluteSize.Y + gap
            local stackOffset = index * notch
            local finalPos
            if cfg.anchor.X == 0.5 then
                finalPos = UDim2.new(0.5, 0, cfg.offset.Y.Scale, cfg.offset.Y.Offset + (cfg.dir.Y > 0 and stackOffset or -stackOffset))
            elseif cfg.anchor.X == 1 then
                finalPos = UDim2.new(1, -10, cfg.offset.Y.Scale, cfg.offset.Y.Offset + (cfg.dir.Y > 0 and stackOffset or -stackOffset))
            else
                finalPos = UDim2.new(0, 10, cfg.offset.Y.Scale, cfg.offset.Y.Offset + (cfg.dir.Y > 0 and stackOffset or -stackOffset))
            end
            notif.instance.Position = finalPos
            index = index + 1
        end
    end
end

local function removeNotification(notif)
    local idx = table.find(ActiveNotifications, notif)
    if idx then table.remove(ActiveNotifications, idx) end
    if notif.key then ActiveByKey[notif.key] = nil end
    if notif.instance then notif.instance:Destroy() end
    repositionNotifications(notif.position)
end

local function createNotification(text, opts)
    opts = opts or {}
    local ntype = opts.Type or "info"
    local duration = opts.Duration or 3
    local position = opts.Position or DefaultNotifyPosition
    local title = opts.Title or "Iris-X"
    local key = opts.Key
    local themeName = opts.Theme or "dark"
    local th = THEMES[themeName] or THEMES.dark

    if not NOTIFY_TEXT_COLORS[ntype] then ntype = "info" end
    if not NOTIFY_POSITIONS[position] then position = "TopRight" end

    if key and ActiveByKey[key] then
        local existing = ActiveByKey[key]
        if existing.text == text then
            existing.remaining = duration
            existing.startTime = tick()
            return existing
        else
            removeNotification(existing)
        end
    end

    if #ActiveNotifications >= 5 then
        removeNotification(ActiveNotifications[1])
    end

    local cfg = NOTIFY_POSITIONS[position]

    local notifFrame = new("Frame", {
        Size = UDim2.fromOffset(260, 58),
        Position = cfg.offset,
        AnchorPoint = cfg.anchor,
        BackgroundColor3 = th.WindowBgColor,
        BackgroundTransparency = th.WindowBgTransparency,
        BorderSizePixel = 0,
    }, NotifyGui)
    UIStroke(notifFrame, 1, th.BorderColor, th.BorderTransparency)

    local titleBar = new("Frame", {
        Size = UDim2.new(1, 0, 0, 19),
        BackgroundColor3 = th.TitleBgActiveColor,
        BackgroundTransparency = th.TitleBgActiveTransparency,
        BorderSizePixel = 0,
    }, notifFrame)

    new("TextLabel", {
        Size = UDim2.new(1, -8, 1, 0),
        Position = UDim2.new(0, 4, 0, 0),
        BackgroundTransparency = 1,
        Text = title,
        TextColor3 = th.TextColor,
        TextSize = 13,
        Font = Enum.Font.Code,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        AutoLocalize = false,
    }, titleBar)

    local body = new("Frame", {
        Size = UDim2.new(1, 0, 1, -19),
        Position = UDim2.new(0, 0, 0, 19),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
    }, notifFrame)

    new("TextLabel", {
        Size = UDim2.new(1, -16, 1, 0),
        Position = UDim2.new(0, 8, 0, 0),
        BackgroundTransparency = 1,
        Text = NOTIFY_PREFIX[ntype] .. " " .. text,
        TextColor3 = NOTIFY_TEXT_COLORS[ntype],
        TextSize = 13,
        Font = Enum.Font.Code,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        TextWrapped = true,
        AutoLocalize = false,
    }, body)

    local notif = {
        instance = notifFrame,
        text = text,
        type = ntype,
        position = position,
        duration = duration,
        startTime = tick(),
        remaining = duration,
        key = key,
    }

    table.insert(ActiveNotifications, notif)
    if key then ActiveByKey[key] = notif end

    repositionNotifications(position)

    return notif
end

local function tickNotifications()
    local now = tick()
    for i = #ActiveNotifications, 1, -1 do
        local notif = ActiveNotifications[i]
        if not notif.instance.Parent then
            table.remove(ActiveNotifications, i)
        elseif now - notif.startTime >= notif.remaining then
            removeNotification(notif)
        end
    end
end

RunService.Heartbeat:Connect(tickNotifications)

function IrisX:Notify(text, opts)
    return createNotification(text, opts)
end

function IrisX:SetNotifyPosition(pos)
    if NOTIFY_POSITIONS[pos] then DefaultNotifyPosition = pos end
end

function IrisX:GetNotifyPosition()
    return DefaultNotifyPosition
end

function IrisX:CreateWindow(opts)
    opts = opts or {}
    local TitleText = opts.Title or "Iris-X"
    local size = opts.Size or Vector2.new(320, 400)
    local position = opts.Position or Vector2.new(150, 150)
    local theme = opts.Theme or "dark"
    local MIN_SIZE = Vector2.new(260, 160)

    local CFG = {}
    for k, v in pairs(THEMES[theme]) do CFG[k] = v end
    CFG.TextFont = Font.fromEnum(Enum.Font.Code)
    CFG.TextSize = 13
    CFG.WindowPadding = Vector2.new(8, 8)
    CFG.FramePadding = Vector2.new(4, 3)
    CFG.ItemSpacing = Vector2.new(8, 4)
    CFG.ItemInnerSpacing = Vector2.new(4, 4)
    CFG.FrameBorderSize = 0
    CFG.FrameRounding = 0
    CFG.WindowBorderSize = 1
    CFG.WindowResizePadding = Vector2.new(6, 6)
    CFG.ScrollbarSize = 7
    CFG.GrabWidth = 8
    CFG.ContentWidth = UDim.new(0.65, 0)
    CFG.ItemWidth = UDim.new(1, 0)

    local themeTargets = {}
    local connections = {}
    local drawings = {}
    local rollbacks = {}
    local tabGroups = {}

    local function reg(inst, props)
        table.insert(themeTargets, { inst = inst, props = props })
    end

    local function track(conn)
        table.insert(connections, conn)
        return conn
    end

    local function trackDrawing(d)
        table.insert(drawings, d)
        return d
    end

    local function trackRollback(fn)
        table.insert(rollbacks, fn)
    end

    local function refreshTheme()
        for _, target in ipairs(themeTargets) do
            local p = target.props
            for i = 1, #p, 2 do
                local value = CFG[p[i + 1]]
                if value ~= nil then target.inst[p[i]] = value end
            end
        end
        for _, group in ipairs(tabGroups) do
            if group.Refresh then group.Refresh() end
        end
    end

    local function applyTextStyle(inst)
        inst.FontFace = CFG.TextFont
        inst.TextSize = CFG.TextSize
        inst.TextColor3 = CFG.TextColor
        inst.TextTransparency = CFG.TextTransparency
        inst.TextXAlignment = Enum.TextXAlignment.Left
        inst.TextYAlignment = Enum.TextYAlignment.Center
        inst.AutoLocalize = false
        reg(inst, { "TextColor3", "TextColor", "TextTransparency", "TextTransparency" })
    end

    local function applyFrameStyle(inst, noPadding)
        inst.BorderSizePixel = 0
        if CFG.FrameBorderSize > 0 then
            local s = UIStroke(inst, CFG.FrameBorderSize, CFG.BorderColor, CFG.BorderTransparency)
            reg(s, { "Color", "BorderColor", "Transparency", "BorderTransparency" })
        end
        if CFG.FrameRounding > 0 then UICorner(inst, CFG.FrameRounding) end
        if not noPadding then UIPadding(inst, CFG.FramePadding) end
    end

    local function setColor(inst, prop, value)
        if value ~= nil then inst[prop .. "Color3"] = value end
    end
    local function setTrans(inst, prop, value)
        if value ~= nil then inst[prop .. "Transparency"] = value end
    end

    local function bindInteraction(prop, button, highlightee, colorKeys)
        local exited = false
        track(button.MouseEnter:Connect(function()
            setColor(highlightee, prop, CFG[colorKeys.HoveredColor])
            setTrans(highlightee, prop, CFG[colorKeys.HoveredTransparency])
            exited = false
        end))
        track(button.MouseLeave:Connect(function()
            setColor(highlightee, prop, CFG[colorKeys.Color])
            setTrans(highlightee, prop, CFG[colorKeys.Transparency])
            exited = true
        end))
        track(button.InputBegan:Connect(function(input)
            if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
            setColor(highlightee, prop, CFG[colorKeys.ActiveColor])
            setTrans(highlightee, prop, CFG[colorKeys.ActiveTransparency])
        end))
        track(button.InputEnded:Connect(function(input)
            if input.UserInputType ~= Enum.UserInputType.MouseButton1 or exited then return end
            setColor(highlightee, prop, CFG[colorKeys.HoveredColor])
            setTrans(highlightee, prop, CFG[colorKeys.HoveredTransparency])
        end))
    end

    local Window = new("ScreenGui", {
        Name = "IrisX_Window",
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        DisplayOrder = 127,
        ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets,
        IgnoreGuiInset = false,
    }, RootGui)

    local state = {
        size = size, position = position,
        dragging = false, dragDelta = Vector2.zero,
        resizing = false, lastMouse = Vector2.zero,
        hidden = false,
    }

    local WindowButton = new("TextButton", {
        Name = "WindowButton",
        Size = UDim2.fromOffset(state.size.X, state.size.Y),
        Position = UDim2.fromOffset(state.position.X, state.position.Y),
        BackgroundTransparency = 1, BorderSizePixel = 0,
        Text = "", AutoButtonColor = false,
        ClipsDescendants = false, Selectable = false,
    }, Window)
    local WindowStroke = UIStroke(WindowButton, CFG.WindowBorderSize, CFG.BorderColor, CFG.BorderTransparency)
    reg(WindowStroke, { "Color", "BorderColor", "Transparency", "BorderTransparency" })

    local function clampPosition(pos)
        local vp = workspace.CurrentCamera.ViewportSize
        return Vector2.new(
            math.clamp(pos.X, 0, math.max(0, vp.X - state.size.X)),
            math.clamp(pos.Y, 0, math.max(0, vp.Y - state.size.Y))
        )
    end
    local function clampSize(s)
        local vp = workspace.CurrentCamera.ViewportSize
        return Vector2.new(
            math.clamp(s.X, MIN_SIZE.X, math.max(MIN_SIZE.X, vp.X - state.position.X)),
            math.clamp(s.Y, MIN_SIZE.Y, math.max(MIN_SIZE.Y, vp.Y - state.position.Y))
        )
    end
    local function applyWindow()
        WindowButton.Size = UDim2.fromOffset(state.size.X, state.size.Y)
        WindowButton.Position = UDim2.fromOffset(state.position.X, state.position.Y)
    end

    local Content = new("Frame", {
        Name = "Content",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1, ClipsDescendants = true,
    }, WindowButton)
    local contentLayout = UIListLayout(Content, Enum.FillDirection.Vertical, UDim.new(0, 0))
    contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    contentLayout.VerticalAlignment = Enum.VerticalAlignment.Top

    local ChildContainer = new("ScrollingFrame", {
        Name = "WindowContainer",
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = CFG.WindowBgColor,
        BackgroundTransparency = CFG.WindowBgTransparency,
        BorderSizePixel = 0,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollBarImageTransparency = CFG.ScrollbarGrabTransparency,
        ScrollBarImageColor3 = CFG.ScrollbarGrabColor,
        CanvasSize = UDim2.fromScale(0, 0),
        VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
        ScrollBarThickness = CFG.ScrollbarSize,
        TopImage = ICON.BLANK_SQUARE,
        MidImage = ICON.BLANK_SQUARE,
        BottomImage = ICON.BLANK_SQUARE,
        LayoutOrder = 0xFFFF, ClipsDescendants = true,
    }, Content)
    reg(ChildContainer, { "BackgroundColor3", "WindowBgColor", "BackgroundTransparency", "WindowBgTransparency" })
    reg(ChildContainer, { "ScrollBarImageColor3", "ScrollbarGrabColor", "ScrollBarImageTransparency", "ScrollbarGrabTransparency" })
    UIPadding(ChildContainer, CFG.WindowPadding)
    UIListLayout(ChildContainer, Enum.FillDirection.Vertical, UDim.new(0, CFG.ItemSpacing.Y))

    new("Frame", {
        Size = UDim2.fromOffset(0, CFG.WindowPadding.Y + CFG.FramePadding.Y),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 0x7FFFFFF0,
    }, ChildContainer)

    local TitleBar = new("Frame", {
        Name = "TitleBar",
        AutomaticSize = Enum.AutomaticSize.Y,
        Size = UDim2.fromScale(1, 0),
        BorderSizePixel = 0, ClipsDescendants = true,
        BackgroundColor3 = CFG.TitleBgActiveColor,
        BackgroundTransparency = CFG.TitleBgActiveTransparency,
    }, Content)
    reg(TitleBar, { "BackgroundColor3", "TitleBgActiveColor", "BackgroundTransparency", "TitleBgActiveTransparency" })
    UIPadding(TitleBar, Vector2.new(CFG.FramePadding.X))
    local titleLayout = UIListLayout(TitleBar, Enum.FillDirection.Horizontal, UDim.new(0, CFG.ItemInnerSpacing.X))
    titleLayout.VerticalAlignment = Enum.VerticalAlignment.Center

    local TitleButtonSize = CFG.TextSize + ((CFG.FramePadding.Y - 1) * 2)

    local CollapseButton = new("TextButton", {
        Name = "CollapseButton",
        AnchorPoint = Vector2.new(0, 0.5),
        Size = UDim2.fromOffset(TitleButtonSize, TitleButtonSize),
        Position = UDim2.fromScale(0, 0.5),
        BackgroundTransparency = 1, BorderSizePixel = 0,
        AutoButtonColor = false, Text = "",
    }, TitleBar)
    UICorner(CollapseButton)
    bindInteraction("Background", CollapseButton, CollapseButton, {
        Color = "ButtonColor", Transparency = 1,
        HoveredColor = "ButtonHoveredColor", HoveredTransparency = "ButtonHoveredTransparency",
        ActiveColor = "ButtonActiveColor", ActiveTransparency = "ButtonActiveTransparency",
    })

    local CollapseArrow = new("ImageLabel", {
        Name = "Arrow",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromOffset(math.floor(0.7 * TitleButtonSize), math.floor(0.7 * TitleButtonSize)),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundTransparency = 1, BorderSizePixel = 0,
        Image = ICON.DOWN_POINTING_TRIANGLE,
        ImageColor3 = CFG.TextColor,
        ImageTransparency = CFG.TextTransparency,
        ScaleType = Enum.ScaleType.Fit,
    }, CollapseButton)
    reg(CollapseArrow, { "ImageColor3", "TextColor", "ImageTransparency", "TextTransparency" })

    local TitleLabel = new("TextLabel", {
        Name = "Title",
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundTransparency = 1, BorderSizePixel = 0,
        LayoutOrder = 1, ClipsDescendants = true,
        Text = TitleText,
    }, TitleBar)
    UIPadding(TitleLabel, Vector2.new(0, CFG.FramePadding.Y))
    applyTextStyle(TitleLabel)
    local flex = new("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }, TitleLabel)
    flex.ItemLineAlignment = Enum.ItemLineAlignment.Center

    local HideButton = new("TextButton", {
        Name = "HideButton",
        AnchorPoint = Vector2.new(1, 0.5),
        Size = UDim2.fromOffset(TitleButtonSize, TitleButtonSize),
        Position = UDim2.new(1, -(TitleButtonSize + CFG.ItemInnerSpacing.X), 0.5, 0),
        BackgroundTransparency = 1, BorderSizePixel = 0,
        AutoButtonColor = false, Text = "", LayoutOrder = 1,
    }, TitleBar)
    UICorner(HideButton)
    bindInteraction("Background", HideButton, HideButton, {
        Color = "ButtonColor", Transparency = 1,
        HoveredColor = "ButtonHoveredColor", HoveredTransparency = "ButtonHoveredTransparency",
        ActiveColor = "ButtonActiveColor", ActiveTransparency = "ButtonActiveTransparency",
    })

    local HideIcon = new("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromOffset(math.floor(0.7 * TitleButtonSize), 2),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundColor3 = CFG.TextColor,
        BackgroundTransparency = CFG.TextTransparency,
        BorderSizePixel = 0,
    }, HideButton)
    reg(HideIcon, { "BackgroundColor3", "TextColor", "BackgroundTransparency", "TextTransparency" })

    local CloseButton = new("TextButton", {
        Name = "CloseButton",
        AnchorPoint = Vector2.new(1, 0.5),
        Size = UDim2.fromOffset(TitleButtonSize, TitleButtonSize),
        Position = UDim2.fromScale(1, 0.5),
        BackgroundTransparency = 1, BorderSizePixel = 0,
        AutoButtonColor = false, Text = "", LayoutOrder = 2,
    }, TitleBar)
    UICorner(CloseButton)
    bindInteraction("Background", CloseButton, CloseButton, {
        Color = "ButtonColor", Transparency = 1,
        HoveredColor = "ButtonHoveredColor", HoveredTransparency = "ButtonHoveredTransparency",
        ActiveColor = "ButtonActiveColor", ActiveTransparency = "ButtonActiveTransparency",
    })
    local CloseIcon = new("ImageLabel", {
        Name = "Icon",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromOffset(math.floor(0.7 * TitleButtonSize), math.floor(0.7 * TitleButtonSize)),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundTransparency = 1, BorderSizePixel = 0,
        Image = ICON.MULTIPLICATION_SIGN,
        ImageColor3 = CFG.TextColor,
        ImageTransparency = CFG.TextTransparency,
        ScaleType = Enum.ScaleType.Fit,
    }, CloseButton)
    reg(CloseIcon, { "ImageColor3", "TextColor", "ImageTransparency", "TextTransparency" })

    local ResizeButtonSize = CFG.TextSize + CFG.FramePadding.X

    local RightResizeGrip = new("ImageButton", {
        Name = "RightResizeGrip",
        AnchorPoint = Vector2.one,
        Position = UDim2.fromScale(1, 1),
        Size = UDim2.fromOffset(ResizeButtonSize, ResizeButtonSize),
        BackgroundTransparency = 1, BorderSizePixel = 0,
        Image = ICON.BOTTOM_RIGHT_CORNER,
        ImageColor3 = CFG.ResizeGripColor,
        ImageTransparency = CFG.ResizeGripTransparency,
        Rotation = 90, AutoButtonColor = false, ZIndex = 3,
    }, WindowButton)
    reg(RightResizeGrip, { "ImageColor3", "ResizeGripColor", "ImageTransparency", "ResizeGripTransparency" })
    bindInteraction("Image", RightResizeGrip, RightResizeGrip, {
        Color = "ResizeGripColor", Transparency = "ResizeGripTransparency",
        HoveredColor = "ResizeGripHoveredColor", HoveredTransparency = "ResizeGripHoveredTransparency",
        ActiveColor = "ResizeGripActiveColor", ActiveTransparency = "ResizeGripActiveTransparency",
    })

    local RightBorder = new("ImageButton", {
        Name = "RightResizeBorder",
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(1, 0.5),
        Size = UDim2.new(0, CFG.WindowResizePadding.X, 1, 0),
        BackgroundTransparency = 1, ImageTransparency = 1,
        AutoButtonColor = false, ZIndex = 4,
    }, WindowButton)
    local BottomBorder = new("ImageButton", {
        Name = "BottomResizeBorder",
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.new(1, 0, 0, CFG.WindowResizePadding.Y),
        BackgroundTransparency = 1, ImageTransparency = 1,
        AutoButtonColor = false, ZIndex = 4,
    }, WindowButton)

    local function startResize()
        state.resizing = true
        state.lastMouse = getMouse()
    end
    for _, el in ipairs({ RightResizeGrip, RightBorder, BottomBorder }) do
        track(el.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
               or input.UserInputType == Enum.UserInputType.Touch then startResize() end
        end))
    end

    track(TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
           or input.UserInputType == Enum.UserInputType.Touch then
            state.dragging = true
            state.dragDelta = getMouse() - state.position
        end
    end))

    track(UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType ~= Enum.UserInputType.MouseMovement
           and input.UserInputType ~= Enum.UserInputType.Touch then return end
        if state.dragging then
            state.position = clampPosition(getMouse() - state.dragDelta)
            applyWindow()
        end
        if state.resizing then
            local mouse = getMouse()
            local delta = mouse - state.lastMouse
            state.lastMouse = mouse
            state.size = clampSize(Vector2.new(state.size.X + delta.X, state.size.Y + delta.Y))
            applyWindow()
        end
    end))

    track(UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
           or input.UserInputType == Enum.UserInputType.Touch then
            state.dragging = false
            state.resizing = false
        end
    end))

    local Win = {}
    Win._gui = Window
    Win._container = ChildContainer
    Win._track = track
    Win._trackDrawing = trackDrawing
    Win._trackRollback = trackRollback
    Win._theme = theme

    function Win:Text(str, parent, opts)
        opts = opts or {}
        local t = new("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundTransparency = 1, BorderSizePixel = 0,
            Text = str,
            TextWrapped = opts.Wrapped or false,
        }, parent or ChildContainer)
        applyTextStyle(t)
        if opts.Color then t.TextColor3 = opts.Color end
        return t
    end

    function Win:Separator(parent)
        local s = new("Frame", {
            Size = UDim2.new(1, 0, 0, 1),
            BackgroundColor3 = CFG.SeparatorColor,
            BackgroundTransparency = CFG.SeparatorTransparency,
            BorderSizePixel = 0,
        }, parent or ChildContainer)
        reg(s, { "BackgroundColor3", "SeparatorColor", "BackgroundTransparency", "SeparatorTransparency" })
        return s
    end

    function Win:SeparatorText(text, parent)
        local container = parent or ChildContainer
        local frameHeight = CFG.TextSize + 2 * CFG.FramePadding.Y
        local Sep = new("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.new(1, 0, 0, frameHeight),
            BackgroundTransparency = 1, BorderSizePixel = 0,
            ClipsDescendants = true,
        }, container)
        UIPadding(Sep, Vector2.new(0, 3))
        local l = UIListLayout(Sep, Enum.FillDirection.Horizontal, UDim.new(0, CFG.ItemSpacing.X))
        l.VerticalAlignment = Enum.VerticalAlignment.Center

        local Label = new("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundTransparency = 1, BorderSizePixel = 0,
            Text = text, LayoutOrder = 1,
        }, Sep)
        applyTextStyle(Label)

        local Left = new("Frame", {
            AnchorPoint = Vector2.new(1, 0.5),
            Size = UDim2.fromOffset(20, 1),
            BackgroundColor3 = CFG.SeparatorColor,
            BackgroundTransparency = CFG.SeparatorTransparency,
            BorderSizePixel = 0,
        }, Sep)

        local Right = new("Frame", {
            AnchorPoint = Vector2.new(1, 0.5),
            Size = UDim2.new(1, 0, 0, 1),
            BackgroundColor3 = CFG.SeparatorColor,
            BackgroundTransparency = CFG.SeparatorTransparency,
            BorderSizePixel = 0, LayoutOrder = 2,
        }, Sep)

        reg(Left, { "BackgroundColor3", "SeparatorColor", "BackgroundTransparency", "SeparatorTransparency" })
        reg(Right, { "BackgroundColor3", "SeparatorColor", "BackgroundTransparency", "SeparatorTransparency" })
        return Sep
    end

    function Win:Button(text, callback, parent)
        local b = new("TextButton", {
            AutomaticSize = Enum.AutomaticSize.XY,
            Size = UDim2.fromOffset(0, 0),
            BackgroundColor3 = CFG.ButtonColor,
            BackgroundTransparency = CFG.ButtonTransparency,
            BorderSizePixel = 0, Text = text, AutoButtonColor = false,
        }, parent or ChildContainer)
        applyTextStyle(b)
        b.TextXAlignment = Enum.TextXAlignment.Center
        applyFrameStyle(b)
        reg(b, { "BackgroundColor3", "ButtonColor", "BackgroundTransparency", "ButtonTransparency" })
        bindInteraction("Background", b, b, {
            Color = "ButtonColor", Transparency = "ButtonTransparency",
            HoveredColor = "ButtonHoveredColor", HoveredTransparency = "ButtonHoveredTransparency",
            ActiveColor = "ButtonActiveColor", ActiveTransparency = "ButtonActiveTransparency",
        })
        if callback then track(b.MouseButton1Click:Connect(function() callback(b) end)) end
        return b
    end

    function Win:Toggle(text, default, callback, parent)
        local isChecked = default or false
        local container = parent or ChildContainer
        local Checkbox = new("TextButton", {
            AutomaticSize = Enum.AutomaticSize.XY,
            Size = UDim2.fromOffset(0, 0),
            BackgroundTransparency = 1, BorderSizePixel = 0,
            Text = "", AutoButtonColor = false,
        }, container)
        local l = UIListLayout(Checkbox, Enum.FillDirection.Horizontal, UDim.new(0, CFG.ItemInnerSpacing.X))
        l.VerticalAlignment = Enum.VerticalAlignment.Center

        local checkboxSize = CFG.TextSize + 2 * CFG.FramePadding.Y
        local Box = new("Frame", {
            Size = UDim2.fromOffset(checkboxSize, checkboxSize),
            BackgroundColor3 = CFG.FrameBgColor,
            BackgroundTransparency = CFG.FrameBgTransparency,
            BorderSizePixel = 0,
        }, Checkbox)
        applyFrameStyle(Box, true)
        reg(Box, { "BackgroundColor3", "FrameBgColor", "BackgroundTransparency", "FrameBgTransparency" })
        UIPadding(Box, Vector2.new(math.floor(checkboxSize / 10), math.floor(checkboxSize / 10)))

        bindInteraction("Background", Checkbox, Box, {
            Color = "FrameBgColor", Transparency = "FrameBgTransparency",
            HoveredColor = "FrameBgHoveredColor", HoveredTransparency = "FrameBgHoveredTransparency",
            ActiveColor = "FrameBgActiveColor", ActiveTransparency = "FrameBgActiveTransparency",
        })

        local Checkmark = new("ImageLabel", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            Image = ICON.CHECKMARK,
            ImageColor3 = CFG.CheckMarkColor,
            ImageTransparency = isChecked and CFG.CheckMarkTransparency or 1,
            ScaleType = Enum.ScaleType.Fit,
        }, Box)
        reg(Checkmark, { "ImageColor3", "CheckMarkColor", "ImageTransparency", "CheckMarkTransparency" })

        track(Checkbox.MouseButton1Click:Connect(function()
            isChecked = not isChecked
            Checkmark.ImageTransparency = isChecked and CFG.CheckMarkTransparency or 1
            if callback then callback(isChecked) end
        end))

        local TextLabel = new("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundTransparency = 1, BorderSizePixel = 0,
            LayoutOrder = 1, Text = text,
        }, Checkbox)
        applyTextStyle(TextLabel)

        return {
            Instance = Checkbox,
            Get = function() return isChecked end,
            Set = function(v)
                isChecked = v
                Checkmark.ImageTransparency = isChecked and CFG.CheckMarkTransparency or 1
                if callback then callback(isChecked) end
            end,
        }
    end

    function Win:Radio(text, default, callback, parent)
        local isSelected = default or false
        local container = parent or ChildContainer
        local Radio = new("TextButton", {
            AutomaticSize = Enum.AutomaticSize.XY,
            Size = UDim2.fromOffset(0, 0),
            BackgroundTransparency = 1, BorderSizePixel = 0,
            Text = "", AutoButtonColor = false,
        }, container)
        local l = UIListLayout(Radio, Enum.FillDirection.Horizontal, UDim.new(0, CFG.ItemInnerSpacing.X))
        l.VerticalAlignment = Enum.VerticalAlignment.Center

        local buttonSize = CFG.TextSize + 2 * (CFG.FramePadding.Y - 1)
        local Button = new("Frame", {
            Size = UDim2.fromOffset(buttonSize, buttonSize),
            BackgroundColor3 = CFG.FrameBgColor,
            BackgroundTransparency = CFG.FrameBgTransparency,
            BorderSizePixel = 0,
        }, Radio)
        UICorner(Button)
        UIPadding(Button, Vector2.new(math.max(1, math.floor(buttonSize / 5)), math.max(1, math.floor(buttonSize / 5))))
        reg(Button, { "BackgroundColor3", "FrameBgColor", "BackgroundTransparency", "FrameBgTransparency" })

        local Circle = new("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = CFG.CheckMarkColor,
            BackgroundTransparency = isSelected and CFG.CheckMarkTransparency or 1,
            BorderSizePixel = 0,
        }, Button)
        UICorner(Circle)
        reg(Circle, { "BackgroundColor3", "CheckMarkColor" })

        bindInteraction("Background", Radio, Button, {
            Color = "FrameBgColor", Transparency = "FrameBgTransparency",
            HoveredColor = "FrameBgHoveredColor", HoveredTransparency = "FrameBgHoveredTransparency",
            ActiveColor = "FrameBgActiveColor", ActiveTransparency = "FrameBgActiveTransparency",
        })

        track(Radio.MouseButton1Click:Connect(function()
            isSelected = true
            Circle.BackgroundTransparency = CFG.CheckMarkTransparency
            if callback then callback(isSelected) end
        end))

        local TextLabel = new("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundTransparency = 1, BorderSizePixel = 0,
            LayoutOrder = 1, Text = text,
        }, Radio)
        applyTextStyle(TextLabel)

        return {
            Instance = Radio,
            Get = function() return isSelected end,
            Set = function(v)
                isSelected = v
                Circle.BackgroundTransparency = isSelected and CFG.CheckMarkTransparency or 1
            end,
        }
    end

    function Win:Slider(text, min, max, default, callback, parent)
        min = min or 0
        max = max or 100
        default = default or min
        local container = parent or ChildContainer

        local Slider = new("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.new(CFG.ItemWidth, UDim.new(0, 0)),
            BackgroundTransparency = 1, BorderSizePixel = 0,
        }, container)
        local l = UIListLayout(Slider, Enum.FillDirection.Horizontal, UDim.new(0, CFG.ItemInnerSpacing.X))
        l.VerticalAlignment = Enum.VerticalAlignment.Center

        local SliderField = new("TextButton", {
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.new(CFG.ContentWidth, UDim.new(0, 0)),
            BackgroundColor3 = CFG.FrameBgColor,
            BackgroundTransparency = CFG.FrameBgTransparency,
            Text = "", AutoButtonColor = false,
            ClipsDescendants = true,
        }, Slider)
        applyFrameStyle(SliderField)
        reg(SliderField, { "BackgroundColor3", "FrameBgColor", "BackgroundTransparency", "FrameBgTransparency" })

        local OverlayText = new("TextLabel", {
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1, BorderSizePixel = 0,
            ZIndex = 10, ClipsDescendants = true,
            Text = string.format("%.2f", default),
        }, SliderField)
        applyTextStyle(OverlayText)
        OverlayText.TextXAlignment = Enum.TextXAlignment.Center

        bindInteraction("Background", SliderField, SliderField, {
            Color = "FrameBgColor", Transparency = "FrameBgTransparency",
            HoveredColor = "FrameBgHoveredColor", HoveredTransparency = "FrameBgHoveredTransparency",
            ActiveColor = "FrameBgActiveColor", ActiveTransparency = "FrameBgActiveTransparency",
        })

        local grabWidth = CFG.GrabWidth
        local GrabBar = new("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new(0, 0, 0.5, 0),
            Size = UDim2.new(0, grabWidth, 1, 0),
            BackgroundColor3 = CFG.SliderGrabColor,
            BackgroundTransparency = CFG.SliderGrabTransparency,
            BorderSizePixel = 0, ZIndex = 5,
        }, SliderField)
        reg(GrabBar, { "BackgroundColor3", "SliderGrabColor", "BackgroundTransparency", "SliderGrabTransparency" })

        bindInteraction("Background", SliderField, GrabBar, {
            Color = "SliderGrabColor", Transparency = "SliderGrabTransparency",
            HoveredColor = "SliderGrabColor", HoveredTransparency = "SliderGrabTransparency",
            ActiveColor = "SliderGrabActiveColor", ActiveTransparency = "SliderGrabActiveTransparency",
        })

        local TextLabel = new("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundTransparency = 1, BorderSizePixel = 0,
            LayoutOrder = 5, Text = text,
        }, Slider)
        applyTextStyle(TextLabel)

        local value = default
        local dragging = false

        local function reposition()
            local w = SliderField.AbsoluteSize.X
            local grabW = GrabBar.AbsoluteSize.X
            local paddedW = w - grabW
            if paddedW <= 0 or (max - min) == 0 then return end
            local ratio = (value - min) / (max - min)
            local paddedRatio = ((paddedW / w) * ratio) + ((1 - (paddedW / w)) / 2)
            GrabBar.Position = UDim2.fromScale(paddedRatio, 0.5)
        end

        local function updateFromMouse(mouseX)
            local abs = SliderField.AbsolutePosition.X
            local w = SliderField.AbsoluteSize.X
            local grabW = GrabBar.AbsoluteSize.X
            local paddedW = w - grabW
            if paddedW <= 0 then return end
            local offset = mouseX - (abs + grabW / 2)
            local ratio = math.clamp(offset / paddedW, 0, 1)
            value = min + (max - min) * ratio
            local paddedRatio = ((paddedW / w) * ratio) + ((1 - (paddedW / w)) / 2)
            GrabBar.Position = UDim2.fromScale(paddedRatio, 0.5)
            OverlayText.Text = string.format("%.2f", value)
            if callback then callback(value) end
        end

        track(SliderField:GetPropertyChangedSignal("AbsoluteSize"):Connect(reposition))

        track(SliderField.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
               or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                updateFromMouse(input.Position.X)
            end
        end))

        track(UserInputService.InputChanged:Connect(function(input)
            if not dragging then return end
            if input.UserInputType == Enum.UserInputType.MouseMovement
               or input.UserInputType == Enum.UserInputType.Touch then
                updateFromMouse(input.Position.X)
            end
        end))

        track(UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
               or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end))

        return {
            Instance = Slider,
            Get = function() return value end,
            Set = function(v)
                value = math.clamp(v, min, max)
                local ratio = (value - min) / (max - min)
                local w = SliderField.AbsoluteSize.X
                local grabW = GrabBar.AbsoluteSize.X
                local paddedW = w - grabW
                if paddedW > 0 then
                    local paddedRatio = ((paddedW / w) * ratio) + ((1 - (paddedW / w)) / 2)
                    GrabBar.Position = UDim2.fromScale(paddedRatio, 0.5)
                end
                OverlayText.Text = string.format("%.2f", value)
                if callback then callback(value) end
            end,
        }
    end

    function Win:Input(text, placeholder, callback, parent)
        local container = parent or ChildContainer

        local Row = new("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.new(CFG.ItemWidth, UDim.new(0, 0)),
            BackgroundTransparency = 1, BorderSizePixel = 0,
        }, container)
        local l = UIListLayout(Row, Enum.FillDirection.Horizontal, UDim.new(0, CFG.ItemInnerSpacing.X))
        l.VerticalAlignment = Enum.VerticalAlignment.Center

        local Field = new("TextBox", {
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.new(CFG.ContentWidth, UDim.new(0, 0)),
            BackgroundColor3 = CFG.FrameBgColor,
            BackgroundTransparency = CFG.FrameBgTransparency,
            BorderSizePixel = 0,
            Text = "",
            PlaceholderText = placeholder or "",
            PlaceholderColor3 = CFG.TextDisabledColor,
            ClearTextOnFocus = false,
            TextTruncate = Enum.TextTruncate.AtEnd,
        }, Row)
        applyFrameStyle(Field)
        applyTextStyle(Field)
        reg(Field, { "BackgroundColor3", "FrameBgColor", "BackgroundTransparency", "FrameBgTransparency" })
        reg(Field, { "PlaceholderColor3", "TextDisabledColor" })
        bindInteraction("Background", Field, Field, {
            Color = "FrameBgColor", Transparency = "FrameBgTransparency",
            HoveredColor = "FrameBgHoveredColor", HoveredTransparency = "FrameBgHoveredTransparency",
            ActiveColor = "FrameBgActiveColor", ActiveTransparency = "FrameBgActiveTransparency",
        })

        track(Field.FocusLost:Connect(function()
            if callback then callback(Field.Text) end
        end))

        local TextLabel = new("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundTransparency = 1, BorderSizePixel = 0,
            LayoutOrder = 1, Text = text,
        }, Row)
        applyTextStyle(TextLabel)

        return {
            Instance = Row,
            Get = function() return Field.Text end,
            Set = function(v) Field.Text = tostring(v) end,
        }
    end

    function Win:Keybind(text, default, callback, parent)
        local currentKey = default or Enum.KeyCode.Unknown
        local listening = false
        local container = parent or ChildContainer

        local b = new("TextButton", {
            AutomaticSize = Enum.AutomaticSize.XY,
            Size = UDim2.fromOffset(0, 0),
            BackgroundColor3 = CFG.ButtonColor,
            BackgroundTransparency = CFG.ButtonTransparency,
            BorderSizePixel = 0, Text = text .. ": " .. currentKey.Name,
            AutoButtonColor = false,
        }, container)
        applyTextStyle(b)
        b.TextXAlignment = Enum.TextXAlignment.Center
        applyFrameStyle(b)
        reg(b, { "BackgroundColor3", "ButtonColor", "BackgroundTransparency", "ButtonTransparency" })
        bindInteraction("Background", b, b, {
            Color = "ButtonColor", Transparency = "ButtonTransparency",
            HoveredColor = "ButtonHoveredColor", HoveredTransparency = "ButtonHoveredTransparency",
            ActiveColor = "ButtonActiveColor", ActiveTransparency = "ButtonActiveTransparency",
        })

        track(b.MouseButton1Click:Connect(function()
            listening = true
            b.Text = text .. ": ..."
        end))

        track(UserInputService.InputBegan:Connect(function(input, gpe)
            if not listening or gpe then return end
            if input.UserInputType == Enum.UserInputType.Keyboard then
                currentKey = input.KeyCode
                b.Text = text .. ": " .. currentKey.Name
                listening = false
                if callback then callback(currentKey) end
            end
        end))

        return {
            Instance = b,
            Get = function() return currentKey end,
        }
    end

    function Win:Combo(text, options, default, callback, parent)
        options = options or {}
        local container = parent or ChildContainer
        local selected = default or options[1]
        local isOpen = false

        local frameHeight = CFG.TextSize + 2 * CFG.FramePadding.Y
        local Combo = new("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.new(CFG.ItemWidth, UDim.new(0, 0)),
            BackgroundTransparency = 1, BorderSizePixel = 0,
        }, container)
        local l = UIListLayout(Combo, Enum.FillDirection.Horizontal, UDim.new(0, CFG.ItemInnerSpacing.X))
        l.VerticalAlignment = Enum.VerticalAlignment.Center

        local Preview = new("TextButton", {
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.new(CFG.ContentWidth, UDim.new(0, 0)),
            BackgroundColor3 = CFG.FrameBgColor,
            BackgroundTransparency = CFG.FrameBgTransparency,
            BorderSizePixel = 0, Text = "", AutoButtonColor = false,
            ClipsDescendants = true, ZIndex = 2,
        }, Combo)
        applyFrameStyle(Preview)
        reg(Preview, { "BackgroundColor3", "FrameBgColor", "BackgroundTransparency", "FrameBgTransparency" })

        bindInteraction("Background", Preview, Preview, {
            Color = "FrameBgColor", Transparency = "FrameBgTransparency",
            HoveredColor = "FrameBgHoveredColor", HoveredTransparency = "FrameBgHoveredTransparency",
            ActiveColor = "FrameBgActiveColor", ActiveTransparency = "FrameBgActiveTransparency",
        })

        local PreviewText = new("TextLabel", {
            Size = UDim2.new(1, -frameHeight, 1, 0),
            BackgroundTransparency = 1, BorderSizePixel = 0,
            Text = tostring(selected),
        }, Preview)
        applyTextStyle(PreviewText)
        UIPadding(PreviewText, CFG.FramePadding)

        local ArrowBox = new("Frame", {
            Size = UDim2.new(0, frameHeight, 1, 0),
            Position = UDim2.new(1, -frameHeight, 0, 0),
            BackgroundColor3 = CFG.ButtonColor,
            BackgroundTransparency = CFG.ButtonTransparency,
            BorderSizePixel = 0,
        }, Preview)
        reg(ArrowBox, { "BackgroundColor3", "ButtonColor", "BackgroundTransparency", "ButtonTransparency" })

        local Arrow = new("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromOffset(math.floor(frameHeight * 0.6), math.floor(frameHeight * 0.6)),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundTransparency = 1, BorderSizePixel = 0,
            Image = ICON.DOWN_POINTING_TRIANGLE,
            ImageColor3 = CFG.TextColor,
            ImageTransparency = CFG.TextTransparency,
            ScaleType = Enum.ScaleType.Fit,
        }, ArrowBox)
        reg(Arrow, { "ImageColor3", "TextColor", "ImageTransparency", "TextTransparency" })

        local TextLabel = new("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundTransparency = 1, BorderSizePixel = 0,
            LayoutOrder = 1, Text = text,
        }, Combo)
        applyTextStyle(TextLabel)

        local Popup = new("ScrollingFrame", {
            BackgroundColor3 = CFG.PopupBgColor,
            BackgroundTransparency = CFG.PopupBgTransparency,
            BorderSizePixel = 0,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ScrollBarImageTransparency = CFG.ScrollbarGrabTransparency,
            ScrollBarImageColor3 = CFG.ScrollbarGrabColor,
            ScrollBarThickness = CFG.ScrollbarSize,
            CanvasSize = UDim2.fromScale(0, 0),
            VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
            TopImage = ICON.BLANK_SQUARE,
            MidImage = ICON.BLANK_SQUARE,
            BottomImage = ICON.BLANK_SQUARE,
            ClipsDescendants = true,
            Visible = false,
            ZIndex = 500,
        }, PopupGui)
        UIStroke(Popup, CFG.WindowBorderSize, CFG.BorderColor, CFG.BorderTransparency)
        UIPadding(Popup, Vector2.new(2, CFG.WindowPadding.Y))
        local popupLayout = UIListLayout(Popup, Enum.FillDirection.Vertical, UDim.new(0, CFG.ItemSpacing.Y))
        popupLayout.VerticalAlignment = Enum.VerticalAlignment.Top
        reg(Popup, { "BackgroundColor3", "PopupBgColor", "BackgroundTransparency", "PopupBgTransparency" })
        reg(Popup, { "ScrollBarImageColor3", "ScrollbarGrabColor", "ScrollBarImageTransparency", "ScrollbarGrabTransparency" })

        local optionButtons = {}
        for _, opt in ipairs(options) do
            local ob = new("TextButton", {
                AutomaticSize = Enum.AutomaticSize.Y,
                Size = UDim2.new(1, 0, 0, frameHeight),
                BackgroundColor3 = CFG.FrameBgColor,
                BackgroundTransparency = 1,
                BorderSizePixel = 0, Text = tostring(opt), AutoButtonColor = false,
            }, Popup)
            applyTextStyle(ob)
            UIPadding(ob, CFG.FramePadding)
            bindInteraction("Background", ob, ob, {
                Color = "FrameBgColor", Transparency = 1,
                HoveredColor = "FrameBgHoveredColor", HoveredTransparency = "FrameBgHoveredTransparency",
                ActiveColor = "FrameBgActiveColor", ActiveTransparency = "FrameBgActiveTransparency",
            })
            table.insert(optionButtons, { instance = ob, value = opt })
        end

        local comboControl

        local function closePopup()
            if not isOpen then return end
            isOpen = false
            Popup.Visible = false
            OpenPopups[comboControl] = nil
        end

        local function openPopup()
            closeAllPopups()
            isOpen = true
            Popup.Visible = true
            OpenPopups[comboControl] = { Close = closePopup }

            local previewPos = Preview.AbsolutePosition - GuiService:GetGuiInset()
            local previewSize = Preview.AbsoluteSize
            local contentH = popupLayout.AbsoluteContentSize.Y + 2 * CFG.WindowPadding.Y
            local screenSize = workspace.CurrentCamera.ViewportSize

            local x = previewPos.X
            local y = previewPos.Y + previewSize.Y + 1
            if y + contentH > screenSize.Y then
                y = previewPos.Y - contentH - 1
            end

            Popup.Position = UDim2.fromOffset(x, y)
            Popup.Size = UDim2.fromOffset(previewSize.X, math.min(contentH, 200))
        end

        for _, entry in ipairs(optionButtons) do
            track(entry.instance.MouseButton1Click:Connect(function()
                selected = entry.value
                PreviewText.Text = tostring(selected)
                closePopup()
                if callback then callback(selected) end
            end))
        end

        track(Preview.MouseButton1Click:Connect(function()
            if isOpen then closePopup() else openPopup() end
        end))

        comboControl = {
            Instance = Combo,
            Popup = Popup,
            Get = function() return selected end,
            Set = function(v)
                selected = v
                PreviewText.Text = tostring(selected)
            end,
            Close = closePopup,
        }

        return comboControl
    end

    function Win:Tabs(parent)
        local container = parent or ChildContainer

        local TabBar = new("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.new(1, 0, 0, 0),
            BackgroundTransparency = 1, BorderSizePixel = 0,
        }, container)
        UIListLayout(TabBar, Enum.FillDirection.Vertical, UDim.new(0, 0))

        local Bar = new("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.new(1, 0, 0, 0),
            BackgroundTransparency = 1, BorderSizePixel = 0,
        }, TabBar)
        UIListLayout(Bar, Enum.FillDirection.Horizontal, UDim.new(0, CFG.ItemInnerSpacing.X))

        local Underline = new("Frame", {
            Size = UDim2.new(1, 0, 0, 1),
            BackgroundColor3 = CFG.TabActiveColor,
            BackgroundTransparency = CFG.TabActiveTransparency,
            BorderSizePixel = 0, LayoutOrder = 1,
        }, TabBar)
        reg(Underline, { "BackgroundColor3", "TabActiveColor", "BackgroundTransparency", "TabActiveTransparency" })

        local Body = new("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.new(1, 0, 0, 0),
            BackgroundTransparency = 1, BorderSizePixel = 0,
            LayoutOrder = 2, ClipsDescendants = true,
        }, TabBar)
        UIPadding(Body, Vector2.new(0, CFG.ItemSpacing.Y))
        UIListLayout(Body, Enum.FillDirection.Vertical, UDim.new(0, CFG.ItemSpacing.Y))

        local tabs = {}
        local current = nil
        local Group = {}

        local function updateTabColors()
            for _, t in ipairs(tabs) do
                if t == current then
                    t.Instance.BackgroundColor3 = CFG.TabActiveColor
                    t.Instance.BackgroundTransparency = CFG.TabActiveTransparency
                else
                    t.Instance.BackgroundColor3 = CFG.TabColor
                    t.Instance.BackgroundTransparency = CFG.TabTransparency
                end
            end
        end

        Group.Refresh = updateTabColors
        table.insert(tabGroups, Group)

        function Group:AddTab(title)
            local TabButton = new("TextButton", {
                AutomaticSize = Enum.AutomaticSize.XY,
                Size = UDim2.fromOffset(0, 0),
                BackgroundColor3 = CFG.TabColor,
                BackgroundTransparency = CFG.TabTransparency,
                BorderSizePixel = 0, Text = "", AutoButtonColor = false,
            }, Bar)
            UIPadding(TabButton, Vector2.new(CFG.FramePadding.X, 0))
            applyFrameStyle(TabButton, true)
            local tl = UIListLayout(TabButton, Enum.FillDirection.Horizontal, UDim.new(0, CFG.ItemInnerSpacing.X))
            tl.VerticalAlignment = Enum.VerticalAlignment.Center

            local TabLabel = new("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundTransparency = 1, BorderSizePixel = 0,
                Text = title,
            }, TabButton)
            applyTextStyle(TabLabel)
            UIPadding(TabLabel, Vector2.new(0, CFG.FramePadding.Y))

            local TabBody = new("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y,
                Size = UDim2.fromScale(1, 0),
                BackgroundTransparency = 1, BorderSizePixel = 0,
                Visible = false,
            }, Body)
            UIListLayout(TabBody, Enum.FillDirection.Vertical, UDim.new(0, CFG.ItemSpacing.Y))

            local entry = {
                Instance = TabButton,
                Body = TabBody,
                Title = title,
            }
            table.insert(tabs, entry)

            track(TabButton.MouseButton1Click:Connect(function()
                Group:SelectTab(entry)
            end))

            track(TabButton.MouseEnter:Connect(function()
                if current ~= entry then
                    TabButton.BackgroundColor3 = CFG.TabHoveredColor
                    TabButton.BackgroundTransparency = CFG.TabHoveredTransparency
                end
            end))
            track(TabButton.MouseLeave:Connect(function()
                if current ~= entry then
                    TabButton.BackgroundColor3 = CFG.TabColor
                    TabButton.BackgroundTransparency = CFG.TabTransparency
                end
            end))

            if current == nil then Group:SelectTab(entry) end

            return TabBody
        end

        function Group:SelectTab(entry)
            for _, t in ipairs(tabs) do
                if t == entry then
                    t.Body.Visible = true
                else
                    t.Body.Visible = false
                end
            end
            current = entry
            updateTabColors()
        end

        function Group:GetCurrent() return current end

        return Group
    end

    function Win:Section(title, parent)
        local container = parent or ChildContainer
        local Section = new("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.new(1, 0, 0, 0),
            BackgroundTransparency = 1, BorderSizePixel = 0,
        }, container)
        UIListLayout(Section, Enum.FillDirection.Vertical, UDim.new(0, CFG.ItemSpacing.Y))

        local Header = new("TextButton", {
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.fromScale(1, 0),
            BackgroundColor3 = CFG.HeaderColor,
            BackgroundTransparency = CFG.HeaderTransparency,
            BorderSizePixel = 0, Text = "", AutoButtonColor = false,
        }, Section)
        applyFrameStyle(Header)
        local hl = UIListLayout(Header, Enum.FillDirection.Horizontal, UDim.new(0, CFG.FramePadding.X))
        hl.VerticalAlignment = Enum.VerticalAlignment.Center
        reg(Header, { "BackgroundColor3", "HeaderColor", "BackgroundTransparency", "HeaderTransparency" })

        local Arrow = new("ImageLabel", {
            Size = UDim2.fromOffset(CFG.TextSize, math.ceil(CFG.TextSize * 0.8)),
            BackgroundTransparency = 1, BorderSizePixel = 0,
            Image = ICON.RIGHT_POINTING_TRIANGLE,
            ImageColor3 = CFG.TextColor,
            ImageTransparency = CFG.TextTransparency,
            ScaleType = Enum.ScaleType.Fit,
        }, Header)
        reg(Arrow, { "ImageColor3", "TextColor", "ImageTransparency", "TextTransparency" })

        local Label = new("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundTransparency = 1, BorderSizePixel = 0,
            Text = title,
        }, Header)
        applyTextStyle(Label)

        local Body = new("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y,
            Size = UDim2.fromScale(1, 0),
            BackgroundTransparency = 1, BorderSizePixel = 0,
            Visible = false,
        }, Section)
        UIPadding(Body, Vector2.new(CFG.ItemInnerSpacing.X + 4, 0))
        UIListLayout(Body, Enum.FillDirection.Vertical, UDim.new(0, CFG.ItemSpacing.Y))

        local isOpen = false
        track(Header.MouseEnter:Connect(function()
            Header.BackgroundColor3 = CFG.HeaderHoveredColor
            Header.BackgroundTransparency = CFG.HeaderHoveredTransparency
        end))
        track(Header.MouseLeave:Connect(function()
            Header.BackgroundColor3 = CFG.HeaderColor
            Header.BackgroundTransparency = CFG.HeaderTransparency
        end))
        track(Header.MouseButton1Click:Connect(function()
            isOpen = not isOpen
            Body.Visible = isOpen
            Arrow.Image = isOpen and ICON.DOWN_POINTING_TRIANGLE or ICON.RIGHT_POINTING_TRIANGLE
        end))

        return Body
    end

    function Win:SetTheme(name)
        if not THEMES[name] then return end
        theme = name
        for k, v in pairs(THEMES[name]) do CFG[k] = v end
        refreshTheme()
    end

    function Win:GetTheme() return theme end

    function Win:ToggleTheme()
        if theme == "dark" then self:SetTheme("light") else self:SetTheme("dark") end
        return theme
    end

    function Win:AddThemeButton(parent)
        local btn
        btn = Win:Button("Theme: " .. (theme == "dark" and "Dark" or "Light"), function()
            if theme == "dark" then
                Win:SetTheme("light")
                btn.Text = "Theme: Light"
            else
                Win:SetTheme("dark")
                btn.Text = "Theme: Dark"
            end
        end, parent)
        return btn
    end

    function Win:AddHideButton(bind, parent)
        bind = bind or Enum.KeyCode.Insert
        if bind ~= Enum.KeyCode.Insert then
            track(UserInputService.InputBegan:Connect(function(input, gpe)
                if gpe then return end
                if input.KeyCode == bind then
                    state.hidden = not state.hidden
                    WindowButton.Visible = not state.hidden
                end
            end))
        end
        return Win:Button("Hide UI (" .. bind.Name .. ")", function()
            state.hidden = true
            WindowButton.Visible = false
            IrisX:Notify("UI hidden. Press " .. bind.Name .. " to show.", {Type = "info", Duration = 2, Theme = theme})
        end, parent)
    end

    function Win:AddUnloadButton(parent)
        return Win:Button("Unload Script", function() Win:Destroy() end, parent)
    end

    function Win:Destroy()
        for _, group in ipairs(tabGroups) do
            local idx = table.find(tabGroups, group)
            if idx then table.remove(tabGroups, idx) end
        end

        for _, conn in ipairs(connections) do
            pcall(function() conn:Disconnect() end)
        end
        connections = {}

        for _, d in ipairs(drawings) do
            pcall(function() d:Remove() end)
        end
        drawings = {}

        for _, fn in ipairs(rollbacks) do
            pcall(fn)
        end
        rollbacks = {}

        for _, target in ipairs(themeTargets) do
            if target.inst and target.inst.Parent then
                target.inst:Destroy()
            end
        end
        themeTargets = {}

        if Window then Window:Destroy() end
    end

    track(CloseButton.MouseButton1Click:Connect(function() Win:Destroy() end))

    track(HideButton.MouseButton1Click:Connect(function()
        state.hidden = not state.hidden
        WindowButton.Visible = not state.hidden
        IrisX:Notify(state.hidden and "UI hidden" or "UI shown", {Type = "info", Duration = 2, Theme = theme})
    end))

    local isOpen = true
    track(CollapseButton.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        ChildContainer.Visible = isOpen
        CollapseArrow.Image = isOpen and ICON.DOWN_POINTING_TRIANGLE or ICON.RIGHT_POINTING_TRIANGLE
        if isOpen then
            state.size = size
        else
            state.size = Vector2.new(state.size.X, TitleBar.AbsoluteSize.Y)
        end
        applyWindow()
    end))

    track(UserInputService.InputBegan:Connect(function(input, gpe)
        if gpe then return end
        if input.KeyCode == Enum.KeyCode.Insert then
            state.hidden = not state.hidden
            WindowButton.Visible = not state.hidden
        end
    end))

    return Win
end

return IrisX
