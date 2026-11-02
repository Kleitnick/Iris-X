local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local G = (typeof(getgenv) == "function" and getgenv()) or _G
if typeof(G.__IRISX_RUNTIME) == "table" and typeof(G.__IRISX_RUNTIME.Shutdown) == "function" then
	pcall(G.__IRISX_RUNTIME.Shutdown)
end

local Icons = {
	Scroll = "rbxassetid://83265623867126",
	Down = "rbxassetid://95465797476827",
	Right = "rbxassetid://105541346271951",
	Close = "rbxassetid://133890060015237",
	Check = "rbxassetid://109638815494221",
	Grip = "rbxassetid://125737344915000",
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
		SliderGrabActiveColor = Color3.fromRGB(15, 135, 250),
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

local Style = {}
local ThemeName = "dark"
local IrisX = {}
IrisX.Version = "4.0.0"
IrisX.Icons = Icons
IrisX.Style = Style

local function new(class, props, parent)
	local inst = Instance.new(class)
	if props then
		for k, v in pairs(props) do
			inst[k] = v
		end
	end
	if parent then
		inst.Parent = parent
	end
	return inst
end

local function UIStroke(parent, thickness, color, transparency)
	return new("UIStroke", {
		Thickness = thickness,
		Color = color,
		Transparency = transparency,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		LineJoinMode = Enum.LineJoinMode.Round,
	}, parent)
end

local function UIPadding(parent, pad)
	return new("UIPadding", {
		PaddingLeft = UDim.new(0, pad.X),
		PaddingRight = UDim.new(0, pad.X),
		PaddingTop = UDim.new(0, pad.Y),
		PaddingBottom = UDim.new(0, pad.Y),
	}, parent)
end

local function UIListLayout(parent, fill, pad)
	return new("UIListLayout", {
		FillDirection = fill,
		Padding = pad,
		SortOrder = Enum.SortOrder.LayoutOrder,
	}, parent)
end

local function UICorner(parent, scale)
	return new("UICorner", { CornerRadius = UDim.new(scale or 0, 0) }, parent)
end

local StateClass = {}
StateClass.__index = StateClass
local AllStates = {}

local function State(initial)
	local s = setmetatable({ _value = initial, _subs = {}, _changed = false }, StateClass)
	AllStates[#AllStates + 1] = s
	return s
end

function StateClass:Get()
	return self._value
end

function StateClass:Set(v)
	if v ~= self._value then
		self._value = v
		self._changed = true
		for _, fn in ipairs(self._subs) do
			task.spawn(fn, v)
		end
	end
end

function StateClass:IsChanged()
	return self._changed
end

function StateClass:Connect(fn)
	table.insert(self._subs, fn)
end

IrisX.State = State

local function isState(v)
	return type(v) == "table" and getmetatable(v) == StateClass
end

local function readVal(v, fallback)
	if isState(v) then
		return v:Get()
	end
	if v == nil then
		return fallback
	end
	return v
end

local function writeVal(target, v)
	if isState(target) then
		target:Set(v)
	end
	return v
end

local Runtime = {
	running = false,
	frame = 0,
	callback = nil,
	conn = nil,
	connections = {},
	keyCapture = false,
	toggleKey = Enum.KeyCode.Insert,
	lastError = nil,
}

local Records = {}
local WidgetStates = {}
local maxZ = 100
local RootGui, PopupGui, NotifyGui = nil, nil, nil

local function widgetState(id, init)
	local s = WidgetStates[id]
	if not s then
		s = init
		WidgetStates[id] = s
	end
	return s
end

local function getMouse()
	return UserInputService:GetMouseLocation() - GuiService:GetGuiInset()
end

local function getViewport()
	local cam = workspace.CurrentCamera
	return cam and cam.ViewportSize or Vector2.new(1920, 1080)
end

local function inBounds(pt, inst)
	if not inst or not inst.Visible then
		return false
	end
	local p = inst.AbsolutePosition
	local s = inst.AbsoluteSize
	return pt.X >= p.X and pt.X <= p.X + s.X and pt.Y >= p.Y and pt.Y <= p.Y + s.Y
end

local function connect(r, signal, fn)
	local c = signal:Connect(fn)
	r.connections[#r.connections + 1] = c
	return c
end

local function destroyRecord(r)
	if r.closeFn then
		pcall(r.closeFn)
	end
	for _, c in ipairs(r.connections) do
		pcall(function()
			c:Disconnect()
		end)
	end
	if r.inst then
		pcall(function()
			r.inst:Destroy()
		end)
	end
end

local function getRecord(id, build)
	local r = Records[id]
	if not r then
		r = { id = id, frame = 0, connections = {}, colors = {}, texts = {} }
		r.inst = build(r)
		Records[id] = r
	end
	r.frame = Runtime.frame
	if not r.inst.Visible then
		r.inst.Visible = true
	end
	return r
end

local function bindColor(r, inst, prop, key, tprop, tkey)
	r.colors[#r.colors + 1] = { inst = inst, prop = prop, key = key, tprop = tprop, tkey = tkey }
	local v = Style[key]
	if v ~= nil then
		inst[prop] = v
	end
	if tprop then
		local t = Style[tkey]
		if t ~= nil then
			inst[tprop] = t
		end
	end
end

local function applyStyle(r)
	for _, b in ipairs(r.colors) do
		local v = Style[b.key]
		if v ~= nil then
			b.inst[b.prop] = v
		end
		if b.tprop then
			local t = Style[b.tkey]
			if t ~= nil then
				b.inst[b.tprop] = t
			end
		end
	end
	for _, t in ipairs(r.texts) do
		t.FontFace = Style.Font
		t.TextSize = Style.TextSize
		t.TextColor3 = Style.TextColor
		t.TextTransparency = Style.TextTransparency
	end
end

local function textStyle(r, inst)
	r.texts[#r.texts + 1] = inst
	inst.FontFace = Style.Font
	inst.TextSize = Style.TextSize
	inst.TextColor3 = Style.TextColor
	inst.TextTransparency = Style.TextTransparency
	inst.TextXAlignment = Enum.TextXAlignment.Left
	inst.TextYAlignment = Enum.TextYAlignment.Center
	inst.AutoLocalize = false
end

local function colorSpec(prefix)
	return {
		Base = { "BackgroundColor3", prefix .. "Color", "BackgroundTransparency", prefix .. "Transparency" },
		Hovered = { "BackgroundColor3", prefix .. "HoveredColor", "BackgroundTransparency", prefix .. "HoveredTransparency" },
		Active = { "BackgroundColor3", prefix .. "ActiveColor", "BackgroundTransparency", prefix .. "ActiveTransparency" },
	}
end

local function imageSpec(prefix)
	return {
		Base = { "ImageColor3", prefix .. "Color", "ImageTransparency", prefix .. "Transparency" },
		Hovered = { "ImageColor3", prefix .. "HoveredColor", "ImageTransparency", prefix .. "HoveredTransparency" },
		Active = { "ImageColor3", prefix .. "ActiveColor", "ImageTransparency", prefix .. "ActiveTransparency" },
	}
end

local function bindInteraction(r, button, target, spec)
	local left = false
	local function apply(list)
		for i = 1, #list, 2 do
			local key = list[i + 1]
			local v = (type(key) == "number") and key or Style[key]
			if v ~= nil then
				target[list[i]] = v
			end
		end
	end
	connect(r, button.MouseEnter, function()
		left = false
		r.hovered = true
		apply(spec.Hovered)
	end)
	connect(r, button.MouseLeave, function()
		left = true
		r.hovered = false
		apply(spec.Base)
	end)
	connect(r, button.InputBegan, function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			r.pressed = true
			apply(spec.Active)
		end
	end)
	connect(r, button.InputEnded, function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			r.pressed = false
			if not left then
				apply(spec.Hovered)
			end
		end
	end)
end

local IDStack = { "" }
local FrameCounters = {}

local function PushID(id)
	IDStack[#IDStack + 1] = IDStack[#IDStack] .. "/" .. tostring(id)
end

local function PopID()
	if #IDStack > 1 then
		table.remove(IDStack)
	end
end

local function widgetID(label)
	local key = IDStack[#IDStack] .. "#" .. tostring(label)
	local n = (FrameCounters[key] or 0) + 1
	FrameCounters[key] = n
	return key .. "@" .. n
end

local RegionStack = {}
local ContainerStack = {}
local ContainerOrders = {}

local function CurrentContainer()
	return ContainerStack[#ContainerStack]
end

local function nextOrder(container)
	local n = (ContainerOrders[container] or 0) + 1
	ContainerOrders[container] = n
	return n
end

local function PushRegion(kind, rec, container)
	RegionStack[#RegionStack + 1] = { kind = kind, rec = rec, container = container }
	if container then
		ContainerStack[#ContainerStack + 1] = container
		ContainerOrders[container] = 0
	end
end

local function PopRegion(kind)
	local top = RegionStack[#RegionStack]
	if top and (kind == nil or top.kind == kind) then
		if top.container then
			table.remove(ContainerStack)
		end
		table.remove(RegionStack)
		return true
	end
	return false
end

local function findRegion(kind)
	for i = #RegionStack, 1, -1 do
		if RegionStack[i].kind == kind then
			return RegionStack[i]
		end
	end
end

local OpenPopups = {}

local function closeAllPopups(except)
	for i = #OpenPopups, 1, -1 do
		local pr = OpenPopups[i]
		if pr ~= except then
			pcall(pr.closeFn)
		end
	end
end

local function frameHeight()
	return Style.TextSize + Style.FramePadding.Y * 2
end

local function clampWindowPos(pos, ws)
	local vp = getViewport()
	return Vector2.new(
		math.clamp(pos.X, -ws.size.X + 60, math.max(-ws.size.X + 60, vp.X - 60)),
		math.clamp(pos.Y, 0, math.max(0, vp.Y - 40))
	)
end

local function clampWindowSize(s)
	local vp = getViewport()
	local minW = 120
	local minH = frameHeight() + 40
	return Vector2.new(
		math.clamp(s.X, minW, math.max(minW, vp.X)),
		math.clamp(s.Y, minH, math.max(minH, vp.Y))
	)
end

local function leafGuard()
	local c = CurrentContainer()
	if not c then
		error("[IrisX] widget called outside of BeginWindow", 0)
	end
	return c
end

local function loadTheme(name)
	local t = THEMES[name]
	if not t then
		return false
	end
	ThemeName = name
	table.clear(Style)
	for k, v in pairs(t) do
		Style[k] = v
	end
	Style.Font = Font.fromEnum(Enum.Font.Code)
	Style.TextSize = 13
	Style.WindowPadding = Vector2.new(8, 8)
	Style.FramePadding = Vector2.new(4, 3)
	Style.ItemSpacing = Vector2.new(8, 4)
	Style.ItemInnerSpacing = Vector2.new(4, 4)
	Style.ScrollbarSize = 7
	Style.GrabWidth = 8
	Style.ContentWidth = 0.65
	Style.ResizePadding = 6
	Style.WindowBorderSize = 1
	for _, r in pairs(Records) do
		applyStyle(r)
	end
	return true
end

function IrisX.SetTheme(name)
	return loadTheme(name)
end

function IrisX.GetTheme()
	return ThemeName
end

local NOTIFY_TEXT_COLORS = {
	info = Color3.fromRGB(230, 230, 230),
	success = Color3.fromRGB(150, 230, 170),
	warning = Color3.fromRGB(240, 200, 120),
	error = Color3.fromRGB(240, 130, 130),
}

local NOTIFY_PREFIX = {
	info = "[info]",
	success = "[ok]",
	warning = "[warn]",
	error = "[error]",
}

local NOTIFY_POSITIONS = {
	TopLeft = { anchor = Vector2.new(0, 0), dir = Vector2.new(0, 1), offset = UDim2.new(0, 10, 0, 10) },
	TopRight = { anchor = Vector2.new(1, 0), dir = Vector2.new(0, 1), offset = UDim2.new(1, -10, 0, 10) },
	TopCenter = { anchor = Vector2.new(0.5, 0), dir = Vector2.new(0, 1), offset = UDim2.new(0.5, 0, 0, 10) },
	BottomLeft = { anchor = Vector2.new(0, 1), dir = Vector2.new(0, -1), offset = UDim2.new(0, 10, 1, -10) },
	BottomRight = { anchor = Vector2.new(1, 1), dir = Vector2.new(0, -1), offset = UDim2.new(1, -10, 1, -10) },
	BottomCenter = { anchor = Vector2.new(0.5, 1), dir = Vector2.new(0, -1), offset = UDim2.new(0.5, 0, 1, -10) },
}

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
	if idx then
		table.remove(ActiveNotifications, idx)
	end
	if notif.key then
		ActiveByKey[notif.key] = nil
	end
	if notif.instance then
		notif.instance:Destroy()
	end
	repositionNotifications(notif.position)
end

local function createNotification(text, opts)
	if not NotifyGui then
		return nil
	end
	opts = opts or {}
	local ntype = opts.Type or "info"
	local duration = opts.Duration or 3
	local position = opts.Position or DefaultNotifyPosition
	local title = opts.Title or "Iris-X"
	local key = opts.Key

	if not NOTIFY_TEXT_COLORS[ntype] then
		ntype = "info"
	end
	if not NOTIFY_POSITIONS[position] then
		position = "TopRight"
	end

	if key and ActiveByKey[key] then
		local existing = ActiveByKey[key]
		if existing.text == text then
			existing.remaining = duration
			existing.startTime = os.clock()
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
		BackgroundColor3 = Style.WindowBgColor,
		BackgroundTransparency = Style.WindowBgTransparency,
		BorderSizePixel = 0,
	}, NotifyGui)
	UIStroke(notifFrame, 1, Style.BorderColor, Style.BorderTransparency)

	local titleBar = new("Frame", {
		Size = UDim2.new(1, 0, 0, 19),
		BackgroundColor3 = Style.TitleBgActiveColor,
		BackgroundTransparency = Style.TitleBgActiveTransparency,
		BorderSizePixel = 0,
	}, notifFrame)

	new("TextLabel", {
		Size = UDim2.new(1, -8, 1, 0),
		Position = UDim2.new(0, 4, 0, 0),
		BackgroundTransparency = 1,
		Text = title,
		TextColor3 = Style.TextColor,
		TextTransparency = Style.TextTransparency,
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
		Text = NOTIFY_PREFIX[ntype] .. " " .. tostring(text),
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
		startTime = os.clock(),
		remaining = duration,
		key = key,
	}

	table.insert(ActiveNotifications, notif)
	if key then
		ActiveByKey[key] = notif
	end

	repositionNotifications(position)
	return notif
end

local function tickNotifications()
	if #ActiveNotifications == 0 then
		return
	end
	local now = os.clock()
	for i = #ActiveNotifications, 1, -1 do
		local notif = ActiveNotifications[i]
		if not notif.instance.Parent then
			table.remove(ActiveNotifications, i)
		elseif now - notif.startTime >= notif.remaining then
			removeNotification(notif)
		end
	end
end

function IrisX.Notify(text, opts)
	if not Runtime.running then
		warn("[IrisX] Notify called before Init")
		return nil
	end
	return createNotification(text, opts)
end

function IrisX.SetNotifyPosition(pos)
	if NOTIFY_POSITIONS[pos] then
		DefaultNotifyPosition = pos
	end
end

function IrisX.GetNotifyPosition()
	return DefaultNotifyPosition
end

function IrisX.Text(str, wrapped)
	local container = leafGuard()
	local id = widgetID("##text")
	local r = getRecord(id, function(rr)
		local t = new("TextLabel", {
			Size = wrapped and UDim2.new(1, 0, 0, 0) or UDim2.fromOffset(0, 0),
			AutomaticSize = wrapped and Enum.AutomaticSize.Y or Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			TextWrapped = wrapped and true or false,
			Text = tostring(str),
		}, container)
		textStyle(rr, t)
		rr.container = container
		return t
	end)
	r.inst.Text = tostring(str)
	r.inst.LayoutOrder = nextOrder(r.container)
	return r.inst
end

function IrisX.TextWrapped(str)
	return IrisX.Text(str, true)
end

function IrisX.Separator()
	local container = leafGuard()
	local id = widgetID("##sep")
	local r = getRecord(id, function(rr)
		local f = new("Frame", {
			Size = UDim2.new(1, 0, 0, 1),
			BorderSizePixel = 0,
		}, container)
		bindColor(rr, f, "BackgroundColor3", "SeparatorColor", "BackgroundTransparency", "SeparatorTransparency")
		rr.container = container
		return f
	end)
	r.inst.LayoutOrder = nextOrder(r.container)
	return r.inst
end

function IrisX.SeparatorText(label)
	local container = leafGuard()
	local id = widgetID("##septext")
	local r = getRecord(id, function(rr)
		local row = new("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
		}, container)
		local l = UIListLayout(row, Enum.FillDirection.Horizontal, UDim.new(0, Style.ItemInnerSpacing.X))
		l.VerticalAlignment = Enum.VerticalAlignment.Center
		local stub = new("Frame", {
			Size = UDim2.fromOffset(9, 1),
			BorderSizePixel = 0,
		}, row)
		bindColor(rr, stub, "BackgroundColor3", "SeparatorColor", "BackgroundTransparency", "SeparatorTransparency")
		local t = new("TextLabel", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = tostring(label),
		}, row)
		textStyle(rr, t)
		UIPadding(t, Vector2.new(0, Style.FramePadding.Y))
		local line = new("Frame", {
			Size = UDim2.new(0, 0, 0, 1),
			BorderSizePixel = 0,
		}, row)
		new("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }, line)
		bindColor(rr, line, "BackgroundColor3", "SeparatorColor", "BackgroundTransparency", "SeparatorTransparency")
		rr.label = t
		rr.container = container
		return row
	end)
	r.label.Text = tostring(label)
	r.inst.LayoutOrder = nextOrder(r.container)
	return r.inst
end

function IrisX.Button(label)
	local container = leafGuard()
	local id = widgetID("##btn" .. tostring(label))
	local r = getRecord(id, function(rr)
		local b = new("TextButton", {
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.fromOffset(0, frameHeight()),
			BackgroundColor3 = Style.ButtonColor,
			BackgroundTransparency = Style.ButtonTransparency,
			BorderSizePixel = 0,
			Text = tostring(label),
			TextXAlignment = Enum.TextXAlignment.Center,
			AutoButtonColor = false,
		}, container)
		textStyle(rr, b)
		UIPadding(b, Vector2.new(Style.FramePadding.X, 0))
		bindInteraction(rr, b, b, colorSpec("Button"))
		bindColor(rr, b, "BackgroundColor3", "ButtonColor", "BackgroundTransparency", "ButtonTransparency")
		connect(rr, b.MouseButton1Click, function()
			rr.clickFrame = Runtime.frame
		end)
		rr.container = container
		return b
	end)
	r.inst.Text = tostring(label)
	r.inst.LayoutOrder = nextOrder(r.container)
	return r.clickFrame == Runtime.frame
end

function IrisX.Checkbox(label, value)
	local container = leafGuard()
	local id = widgetID("##chk" .. tostring(label))
	local ws = widgetState(id, { value = readVal(value, false) == true })
	local r = getRecord(id, function(rr)
		local row = new("TextButton", {
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.fromOffset(0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			AutoButtonColor = false,
		}, container)
		local l = UIListLayout(row, Enum.FillDirection.Horizontal, UDim.new(0, Style.ItemInnerSpacing.X))
		l.VerticalAlignment = Enum.VerticalAlignment.Center
		local boxSize = frameHeight()
		local box = new("Frame", {
			Size = UDim2.fromOffset(boxSize, boxSize),
			BorderSizePixel = 0,
		}, row)
		bindColor(rr, box, "BackgroundColor3", "FrameBgColor", "BackgroundTransparency", "FrameBgTransparency")
		local check = new("ImageLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Image = Icons.Check,
			ScaleType = Enum.ScaleType.Fit,
			BorderSizePixel = 0,
		}, box)
		UIPadding(check, Vector2.new(3, 3))
		bindColor(rr, check, "ImageColor3", "CheckMarkColor")
		bindInteraction(rr, row, box, colorSpec("FrameBg"))
		connect(rr, row.MouseButton1Click, function()
			ws.value = not ws.value
			writeVal(value, ws.value)
		end)
		local t = new("TextLabel", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = tostring(label),
		}, row)
		textStyle(rr, t)
		rr.check = check
		rr.label = t
		rr.container = container
		return row
	end)
	if isState(value) then
		ws.value = value:Get() == true
	end
	r.label.Text = tostring(label)
	r.check.ImageTransparency = ws.value and Style.CheckMarkTransparency or 1
	r.inst.LayoutOrder = nextOrder(r.container)
	return ws.value
end

function IrisX.RadioButton(label, active)
	local container = leafGuard()
	local id = widgetID("##radio" .. tostring(label))
	local r = getRecord(id, function(rr)
		local row = new("TextButton", {
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.fromOffset(0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			AutoButtonColor = false,
		}, container)
		local l = UIListLayout(row, Enum.FillDirection.Horizontal, UDim.new(0, Style.ItemInnerSpacing.X))
		l.VerticalAlignment = Enum.VerticalAlignment.Center
		local btnSize = frameHeight()
		local outer = new("Frame", {
			Size = UDim2.fromOffset(btnSize, btnSize),
			BorderSizePixel = 0,
		}, row)
		UICorner(outer, 1)
		bindColor(rr, outer, "BackgroundColor3", "FrameBgColor", "BackgroundTransparency", "FrameBgTransparency")
		local dot = new("Frame", {
			Size = UDim2.fromScale(1, 1),
			BorderSizePixel = 0,
		}, outer)
		UICorner(dot, 1)
		UIPadding(dot, Vector2.new(5, 5))
		bindColor(rr, dot, "BackgroundColor3", "CheckMarkColor")
		bindInteraction(rr, row, outer, colorSpec("FrameBg"))
		connect(rr, row.MouseButton1Click, function()
			rr.clickFrame = Runtime.frame
			writeVal(active, true)
		end)
		local t = new("TextLabel", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = tostring(label),
		}, row)
		textStyle(rr, t)
		rr.dot = dot
		rr.label = t
		rr.container = container
		return row
	end)
	r.label.Text = tostring(label)
	r.dot.BackgroundTransparency = readVal(active, false) and Style.CheckMarkTransparency or 1
	r.inst.LayoutOrder = nextOrder(r.container)
	return r.clickFrame == Runtime.frame
end

function IrisX.Slider(label, min, max, value, opts)
	local container = leafGuard()
	opts = opts or {}
	min = min or 0
	max = max or 100
	local id = widgetID("##slider" .. tostring(label))
	local ws = widgetState(id, { value = math.clamp(readVal(value, min), min, max) })
	local step = opts.Step
	local precision = opts.Precision
	if not precision then
		precision = (step and step >= 1 and step % 1 == 0) and 0 or 2
	end
	local function snap(v)
		v = math.clamp(v, min, max)
		if step and step > 0 then
			v = min + math.floor((v - min) / step + 0.5) * step
		end
		local p = 10 ^ precision
		return math.round(v * p) / p
	end
	local function fmt(v)
		return string.format("%." .. precision .. "f", v) .. (opts.Suffix or "")
	end
	if isState(value) then
		ws.value = snap(value:Get())
	end
	local r = getRecord(id, function(rr)
		local row = new("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
		}, container)
		local l = UIListLayout(row, Enum.FillDirection.Horizontal, UDim.new(0, Style.ItemInnerSpacing.X))
		l.VerticalAlignment = Enum.VerticalAlignment.Center
		local field = new("TextButton", {
			Size = UDim2.new(Style.ContentWidth, 0, 0, frameHeight()),
			BorderSizePixel = 0,
			Text = "",
			AutoButtonColor = false,
			ClipsDescendants = true,
		}, row)
		bindColor(rr, field, "BackgroundColor3", "FrameBgColor", "BackgroundTransparency", "FrameBgTransparency")
		bindInteraction(rr, field, field, colorSpec("FrameBg"))
		local grab = new("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0, 0.5),
			Size = UDim2.new(0, Style.GrabWidth, 1, 0),
			ZIndex = 5,
			BorderSizePixel = 0,
		}, field)
		bindColor(rr, grab, "BackgroundColor3", "SliderGrabColor", "BackgroundTransparency", "SliderGrabTransparency")
		bindInteraction(rr, field, grab, {
			Base = { "BackgroundColor3", "SliderGrabColor", "BackgroundTransparency", "SliderGrabTransparency" },
			Hovered = { "BackgroundColor3", "SliderGrabColor", "BackgroundTransparency", "SliderGrabTransparency" },
			Active = { "BackgroundColor3", "SliderGrabActiveColor", "BackgroundTransparency", "SliderGrabActiveTransparency" },
		})
		local overlay = new("TextLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			ZIndex = 10,
			ClipsDescendants = true,
		}, field)
		textStyle(rr, overlay)
		overlay.TextXAlignment = Enum.TextXAlignment.Center
		local t = new("TextLabel", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = tostring(label),
		}, row)
		textStyle(rr, t)
		connect(rr, field.InputBegan, function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				rr.dragging = true
				local x = getMouse().X
				local abs = field.AbsolutePosition.X
				local w = field.AbsoluteSize.X
				local gw = grab.AbsoluteSize.X
				local pw = w - gw
				if pw > 0 and max ~= min then
					local ratio = math.clamp((x - (abs + gw / 2)) / pw, 0, 1)
					ws.value = snap(min + (max - min) * ratio)
					writeVal(value, ws.value)
				end
			end
		end)
		connect(rr, UserInputService.InputChanged, function(input)
			if not rr.dragging then
				return
			end
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				local x = getMouse().X
				local abs = field.AbsolutePosition.X
				local w = field.AbsoluteSize.X
				local gw = grab.AbsoluteSize.X
				local pw = w - gw
				if pw > 0 and max ~= min then
					local ratio = math.clamp((x - (abs + gw / 2)) / pw, 0, 1)
					ws.value = snap(min + (max - min) * ratio)
					writeVal(value, ws.value)
				end
			end
		end)
		connect(rr, UserInputService.InputEnded, function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				rr.dragging = false
			end
		end)
		rr.field = field
		rr.grab = grab
		rr.overlay = overlay
		rr.label = t
		rr.container = container
		return row
	end)
	local w = r.field.AbsoluteSize.X
	local gw = r.grab.AbsoluteSize.X
	local pw = w - gw
	if pw > 0 and max ~= min then
		local ratio = (ws.value - min) / (max - min)
		r.grab.Position = UDim2.fromScale((pw / w) * ratio + (1 - pw / w) / 2, 0.5)
	end
	r.overlay.Text = fmt(ws.value)
	r.label.Text = tostring(label)
	r.inst.LayoutOrder = nextOrder(r.container)
	return ws.value
end

function IrisX.InputText(label, value, opts)
	local container = leafGuard()
	opts = opts or {}
	local id = widgetID("##input" .. tostring(label))
	local ws = widgetState(id, { text = tostring(readVal(value, "")) })
	local r = getRecord(id, function(rr)
		local row = new("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
		}, container)
		local l = UIListLayout(row, Enum.FillDirection.Horizontal, UDim.new(0, Style.ItemInnerSpacing.X))
		l.VerticalAlignment = Enum.VerticalAlignment.Center
		local field = new("TextBox", {
			Size = UDim2.new(Style.ContentWidth, 0, 0, frameHeight()),
			BorderSizePixel = 0,
			Text = ws.text,
			PlaceholderText = opts.Placeholder or "",
			ClearTextOnFocus = false,
			TextTruncate = Enum.TextTruncate.AtEnd,
		}, row)
		bindColor(rr, field, "BackgroundColor3", "FrameBgColor", "BackgroundTransparency", "FrameBgTransparency")
		bindColor(rr, field, "PlaceholderColor3", "TextDisabledColor")
		bindInteraction(rr, field, field, colorSpec("FrameBg"))
		textStyle(rr, field)
		UIPadding(field, Style.FramePadding)
		connect(rr, field.FocusLost, function()
			ws.text = field.Text
			rr.submittedFrame = Runtime.frame
			writeVal(value, ws.text)
		end)
		local t = new("TextLabel", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = tostring(label),
		}, row)
		textStyle(rr, t)
		rr.field = field
		rr.label = t
		rr.container = container
		return row
	end)
	if not r.field:IsFocused() and isState(value) then
		local v = tostring(value:Get())
		if r.field.Text ~= v then
			r.field.Text = v
		end
	end
	ws.text = r.field.Text
	r.label.Text = tostring(label)
	r.inst.LayoutOrder = nextOrder(r.container)
	return ws.text, r.submittedFrame == Runtime.frame
end

function IrisX.Combo(label, items, value)
	local container = leafGuard()
	items = items or {}
	local id = widgetID("##combo" .. tostring(label))
	local ws = widgetState(id, { value = readVal(value, items[1]), open = false })
	ws.items = items
	if isState(value) then
		ws.value = value:Get()
	end
	local r = getRecord(id, function(rr)
		local row = new("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
		}, container)
		local l = UIListLayout(row, Enum.FillDirection.Horizontal, UDim.new(0, Style.ItemInnerSpacing.X))
		l.VerticalAlignment = Enum.VerticalAlignment.Center
		local fh = frameHeight()
		local preview = new("TextButton", {
			Size = UDim2.new(Style.ContentWidth, 0, 0, fh),
			BorderSizePixel = 0,
			Text = "",
			AutoButtonColor = false,
			ClipsDescendants = true,
			ZIndex = 2,
		}, row)
		bindColor(rr, preview, "BackgroundColor3", "FrameBgColor", "BackgroundTransparency", "FrameBgTransparency")
		bindInteraction(rr, preview, preview, colorSpec("FrameBg"))
		local previewText = new("TextLabel", {
			Size = UDim2.new(1, -fh, 1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = tostring(ws.value),
			TextTruncate = Enum.TextTruncate.AtEnd,
		}, preview)
		textStyle(rr, previewText)
		UIPadding(previewText, Style.FramePadding)
		local arrowBox = new("Frame", {
			Size = UDim2.new(0, fh, 1, 0),
			Position = UDim2.new(1, -fh, 0, 0),
			BorderSizePixel = 0,
		}, preview)
		bindColor(rr, arrowBox, "BackgroundColor3", "ButtonColor", "BackgroundTransparency", "ButtonTransparency")
		local arrow = new("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(math.floor(fh * 0.6), math.floor(fh * 0.6)),
			BackgroundTransparency = 1,
			Image = Icons.Down,
			ScaleType = Enum.ScaleType.Fit,
			BorderSizePixel = 0,
		}, arrowBox)
		bindColor(rr, arrow, "ImageColor3", "TextColor", "ImageTransparency", "TextTransparency")
		connect(rr, preview.MouseButton1Click, function()
			if ws.open then
				local pr = ws.popupRec
				if pr then
					pcall(pr.closeFn)
				end
			else
				closeAllPopups()
				ws.open = true
			end
		end)
		local t = new("TextLabel", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = tostring(label),
		}, row)
		textStyle(rr, t)
		rr.preview = preview
		rr.previewText = previewText
		rr.label = t
		rr.container = container
		return row
	end)
	r.previewText.Text = tostring(ws.value)
	r.label.Text = tostring(label)
	r.inst.LayoutOrder = nextOrder(r.container)
	if ws.open then
		local pr = getRecord(id .. "$popup", function(prr)
			local popup = new("ScrollingFrame", {
				BorderSizePixel = 0,
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromScale(0, 0),
				ScrollBarImageTransparency = Style.ScrollbarGrabTransparency,
				ScrollBarImageColor3 = Style.ScrollbarGrabColor,
				ScrollBarThickness = Style.ScrollbarSize,
				VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
				TopImage = Icons.Scroll,
				MidImage = Icons.Scroll,
				BottomImage = Icons.Scroll,
				ClipsDescendants = true,
				Visible = false,
				ZIndex = 500,
			}, PopupGui)
			UIStroke(popup, 1, Style.BorderColor, Style.BorderTransparency)
			UIPadding(popup, Vector2.new(2, Style.WindowPadding.Y))
			UIListLayout(popup, Enum.FillDirection.Vertical, UDim.new(0, Style.ItemSpacing.Y))
			bindColor(prr, popup, "BackgroundColor3", "PopupBgColor", "BackgroundTransparency", "PopupBgTransparency")
			bindColor(prr, popup, "ScrollBarImageColor3", "ScrollbarGrabColor", "ScrollBarImageTransparency", "ScrollbarGrabTransparency")
			prr.closeFn = function()
				if not ws.open then
					return
				end
				ws.open = false
				pcall(function()
					popup.Visible = false
				end)
				local i = table.find(OpenPopups, prr)
				if i then
					table.remove(OpenPopups, i)
				end
			end
			return popup
		end)
		ws.popupRec = pr
		local vp = getViewport()
		local fh = frameHeight()
		local n = #items
		local contentH = n * fh + math.max(0, n - 1) * Style.ItemSpacing.Y + Style.WindowPadding.Y * 2 + 4
		local h = math.min(contentH, 200)
		local p = r.preview.AbsolutePosition
		local fw = r.preview.AbsoluteSize.X
		local x = math.clamp(p.X, 0, math.max(0, vp.X - fw))
		local y = p.Y + r.preview.AbsoluteSize.Y + 2
		if y + h > vp.Y and p.Y - h - 2 >= 0 then
			y = p.Y - h - 2
		end
		pr.inst.Position = UDim2.fromOffset(x, y)
		pr.inst.Size = UDim2.fromOffset(fw, h)
		if not table.find(OpenPopups, pr) then
			table.insert(OpenPopups, pr)
		end
		ContainerOrders[pr.inst] = 0
		for i = 1, n do
			local oi = i
			local optR = getRecord(id .. "$opt" .. oi, function(orr)
				local ob = new("TextButton", {
					Size = UDim2.new(1, 0, 0, fh),
					BorderSizePixel = 0,
					Text = tostring(items[oi]),
					AutoButtonColor = false,
					TextTruncate = Enum.TextTruncate.AtEnd,
				}, pr.inst)
				textStyle(orr, ob)
				UIPadding(ob, Style.FramePadding)
				bindInteraction(orr, ob, ob, {
					Base = { "BackgroundColor3", "FrameBgColor", "BackgroundTransparency", 1 },
					Hovered = { "BackgroundColor3", "FrameBgHoveredColor", "BackgroundTransparency", "FrameBgHoveredTransparency" },
					Active = { "BackgroundColor3", "FrameBgActiveColor", "BackgroundTransparency", "FrameBgActiveTransparency" },
				})
				local check = new("ImageLabel", {
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -4, 0.5, 0),
					Size = UDim2.fromOffset(12, 12),
					BackgroundTransparency = 1,
					Image = Icons.Check,
					ScaleType = Enum.ScaleType.Fit,
					BorderSizePixel = 0,
				}, ob)
				bindColor(orr, check, "ImageColor3", "CheckMarkColor")
				connect(orr, ob.MouseButton1Click, function()
					local v = ws.items[oi]
					if v ~= nil then
						ws.value = v
						writeVal(value, v)
					end
					local pr2 = ws.popupRec
					if pr2 then
						pcall(pr2.closeFn)
					end
				end)
				orr.check = check
				orr.container = pr.inst
				return ob
			end)
			optR.inst.Text = tostring(items[oi])
			optR.check.Visible = ws.value == items[oi]
			optR.inst.LayoutOrder = nextOrder(optR.container)
		end
	end
	return ws.value
end

function IrisX.Keybind(label, value)
	local container = leafGuard()
	local id = widgetID("##key" .. tostring(label))
	local ws = widgetState(id, { key = readVal(value, Enum.KeyCode.Unknown) })
	local r = getRecord(id, function(rr)
		local b = new("TextButton", {
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.fromOffset(0, frameHeight()),
			BorderSizePixel = 0,
			Text = tostring(label),
			TextXAlignment = Enum.TextXAlignment.Center,
			AutoButtonColor = false,
		}, container)
		bindColor(rr, b, "BackgroundColor3", "ButtonColor", "BackgroundTransparency", "ButtonTransparency")
		bindInteraction(rr, b, b, colorSpec("Button"))
		textStyle(rr, b)
		UIPadding(b, Vector2.new(Style.FramePadding.X, 0))
		local function stopListening()
			rr.listening = false
			task.defer(function()
				if not rr.listening then
					Runtime.keyCapture = false
				end
			end)
		end
		connect(rr, b.MouseButton1Click, function()
			rr.listening = true
			Runtime.keyCapture = true
		end)
		connect(rr, UserInputService.InputBegan, function(input, gpe)
			if not rr.listening or gpe then
				return
			end
			if input.UserInputType == Enum.UserInputType.Keyboard then
				ws.key = (input.KeyCode == Enum.KeyCode.Escape) and Enum.KeyCode.Unknown or input.KeyCode
				writeVal(value, ws.key)
				stopListening()
			elseif input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				stopListening()
			end
		end)
		rr.container = container
		return b
	end)
	r.inst.Text = rr.listening and (tostring(label) .. ": ...") or (tostring(label) .. ": " .. ws.key.Name)
	r.inst.LayoutOrder = nextOrder(r.container)
	return ws.key
end

function IrisX.BeginGroup()
	local container = leafGuard()
	local id = widgetID("##group")
	local r = getRecord(id, function(rr)
		local f = new("Frame", {
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.fromOffset(0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
		}, container)
		local l = UIListLayout(f, Enum.FillDirection.Horizontal, UDim.new(0, Style.ItemInnerSpacing.X))
		l.VerticalAlignment = Enum.VerticalAlignment.Center
		rr.container = container
		return f
	end)
	r.inst.LayoutOrder = nextOrder(r.container)
	PushRegion("group", r, r.inst)
end

function IrisX.EndGroup()
	PopRegion("group")
end

function IrisX.BeginTabBar(id)
	if not CurrentContainer() then
		return false
	end
	local wid = widgetID("##tabbar" .. tostring(id))
	local ws = widgetState(wid, { active = nil })
	local r = getRecord(wid, function(rr)
		local bar = new("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
		}, CurrentContainer())
		UIListLayout(bar, Enum.FillDirection.Vertical, UDim.new(0, 0))
		local rows = new("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
		}, bar)
		UIListLayout(rows, Enum.FillDirection.Horizontal, UDim.new(0, Style.ItemInnerSpacing.X))
		local underline = new("Frame", {
			Size = UDim2.new(1, 0, 0, 1),
			BorderSizePixel = 0,
		}, bar)
		bindColor(rr, underline, "BackgroundColor3", "TabActiveColor", "BackgroundTransparency", "TabActiveTransparency")
		local host = new("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
		}, bar)
		UIPadding(host, Vector2.new(0, Style.ItemSpacing.Y))
		UIListLayout(host, Enum.FillDirection.Vertical, UDim.new(0, Style.ItemSpacing.Y))
		rr.rows = rows
		rr.host = host
		rr.state = ws
		return bar
	end)
	r.inst.LayoutOrder = nextOrder(CurrentContainer())
	PushRegion("tabbar", r, r.host)
	return true
end

function IrisX.EndTabBar()
	PopRegion("tabbar")
end

function IrisX.BeginTabItem(name)
	local barRegion = findRegion("tabbar")
	if not barRegion then
		PushRegion("tab", nil, nil)
		return false
	end
	local barRec = barRegion.rec
	local barWs = barRec.state
	local wid = widgetID("##tab" .. tostring(name))
	local r = getRecord(wid, function(rr)
		local btn = new("TextButton", {
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.fromOffset(0, 0),
			BorderSizePixel = 0,
			Text = "",
			AutoButtonColor = false,
		}, barRec.rows)
		UIPadding(btn, Vector2.new(Style.FramePadding.X, Style.FramePadding.Y))
		local t = new("TextLabel", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = tostring(name),
		}, btn)
		textStyle(rr, t)
		bindInteraction(rr, btn, btn, {
			Base = { "BackgroundColor3", "TabColor", "BackgroundTransparency", "TabTransparency" },
			Hovered = { "BackgroundColor3", "TabHoveredColor", "BackgroundTransparency", "TabHoveredTransparency" },
			Active = { "BackgroundColor3", "TabActiveColor", "BackgroundTransparency", "TabActiveTransparency" },
		})
		bindColor(rr, btn, "BackgroundColor3", "TabColor", "BackgroundTransparency", "TabTransparency")
		connect(rr, btn.MouseButton1Click, function()
			barWs.active = wid
			closeAllPopups()
		end)
		rr.btn = btn
		rr.label = t
		rr.container = barRec.rows
		return btn
	end)
	r.label.Text = tostring(name)
	r.inst.LayoutOrder = nextOrder(r.container)
	if not barWs.active then
		barWs.active = wid
	end
	local active = (barWs.active == wid)
	if not r.hovered and not r.pressed then
		if active then
			r.btn.BackgroundColor3 = Style.TabActiveColor
			r.btn.BackgroundTransparency = Style.TabActiveTransparency
		else
			r.btn.BackgroundColor3 = Style.TabColor
			r.btn.BackgroundTransparency = Style.TabTransparency
		end
	end
	if active then
		local body = getRecord(wid .. "$body", function(brr)
			local f = new("Frame", {
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
			}, barRec.host)
			UIListLayout(f, Enum.FillDirection.Vertical, UDim.new(0, Style.ItemSpacing.Y))
			return f
		end)
		body.inst.LayoutOrder = nextOrder(barRec.host)
		PushRegion("tab", r, body.inst)
	else
		PushRegion("tab", r, nil)
	end
	return active
end

function IrisX.EndTabItem()
	PopRegion("tab")
end

local function nodeImpl(label, headerMode)
	local container = leafGuard()
	local id = widgetID("##node" .. tostring(label))
	local ws = widgetState(id, { open = false })
	local r = getRecord(id, function(rr)
		local row = new("TextButton", {
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			AutoButtonColor = false,
		}, container)
		local l = UIListLayout(row, Enum.FillDirection.Horizontal, UDim.new(0, Style.ItemInnerSpacing.X))
		l.VerticalAlignment = Enum.VerticalAlignment.Center
		local arrow = new("ImageLabel", {
			Size = UDim2.fromOffset(Style.TextSize, Style.TextSize),
			BackgroundTransparency = 1,
			Image = Icons.Right,
			ScaleType = Enum.ScaleType.Fit,
			BorderSizePixel = 0,
		}, row)
		bindColor(rr, arrow, "ImageColor3", "TextColor", "ImageTransparency", "TextTransparency")
		local t = new("TextLabel", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = tostring(label),
		}, row)
		textStyle(rr, t)
		if headerMode then
			bindInteraction(rr, row, row, colorSpec("Header"))
			bindColor(rr, row, "BackgroundColor3", "HeaderColor", "BackgroundTransparency", "HeaderTransparency")
		else
			bindInteraction(rr, row, row, {
				Base = { "BackgroundColor3", "HeaderColor", "BackgroundTransparency", 1 },
				Hovered = { "BackgroundColor3", "HeaderHoveredColor", "BackgroundTransparency", "HeaderHoveredTransparency" },
				Active = { "BackgroundColor3", "HeaderActiveColor", "BackgroundTransparency", "HeaderActiveTransparency" },
			})
		end
		connect(rr, row.MouseButton1Click, function()
			ws.open = not ws.open
		end)
		rr.arrow = arrow
		rr.label = t
		rr.container = container
		return row
	end)
	r.label.Text = tostring(label)
	r.arrow.Image = ws.open and Icons.Down or Icons.Right
	r.inst.LayoutOrder = nextOrder(r.container)
	if ws.open then
		local body = getRecord(id .. "$body", function(brr)
			local f = new("Frame", {
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
			}, r.container)
			UIListLayout(f, Enum.FillDirection.Vertical, UDim.new(0, Style.ItemSpacing.Y))
			if not headerMode then
				UIPadding(f, Vector2.new(Style.ItemInnerSpacing.X, 0))
			end
			return f
		end)
		body.inst.LayoutOrder = nextOrder(r.container)
		PushRegion("tree", r, body.inst)
	else
		PushRegion("tree", r, nil)
	end
	return ws.open
end

function IrisX.TreeNode(label)
	return nodeImpl(label, false)
end

function IrisX.CollapsingHeader(label)
	return nodeImpl(label, true)
end

function IrisX.TreePop()
	PopRegion("tree")
end

function IrisX.BeginWindow(title, opts)
	opts = opts or {}
	if not RootGui then
		warn("[IrisX] BeginWindow called before Init")
		return false
	end
	local id = "window/" .. tostring(title)
	local ws = widgetState(id, {
		pos = opts.Position or Vector2.new(150, 150),
		size = opts.Size or Vector2.new(320, 400),
		expanded = opts.Size or Vector2.new(320, 400),
		open = true,
		collapsed = false,
	})
	local r = getRecord(id, function(rr)
		local win = new("Frame", {
			Name = "IrisX_Window",
			BorderSizePixel = 0,
		}, RootGui)
		bindColor(rr, win, "BackgroundColor3", "WindowBgColor", "BackgroundTransparency", "WindowBgTransparency")
		local stroke = UIStroke(win, Style.WindowBorderSize, Style.BorderColor, Style.BorderTransparency)
		bindColor(rr, stroke, "Color", "BorderColor", "Transparency", "BorderTransparency")
		UIListLayout(win, Enum.FillDirection.Vertical, UDim.new(0, 0))
		local barH = frameHeight()
		local btnSize = Style.TextSize + (Style.FramePadding.Y - 1) * 2
		local titleBar = new("Frame", {
			Size = UDim2.new(1, 0, 0, barH),
			BorderSizePixel = 0,
			ClipsDescendants = true,
			LayoutOrder = 1,
		}, win)
		bindColor(rr, titleBar, "BackgroundColor3", "TitleBgActiveColor", "BackgroundTransparency", "TitleBgActiveTransparency")
		local collapse = new("TextButton", {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, Style.FramePadding.X, 0.5, 0),
			Size = UDim2.fromOffset(btnSize, btnSize),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			AutoButtonColor = false,
		}, titleBar)
		UICorner(collapse, 1)
		bindInteraction(rr, collapse, collapse, {
			Base = { "BackgroundTransparency", 1, "BackgroundColor3", "ButtonColor" },
			Hovered = { "BackgroundColor3", "ButtonHoveredColor", "BackgroundTransparency", "ButtonHoveredTransparency" },
			Active = { "BackgroundColor3", "ButtonActiveColor", "BackgroundTransparency", "ButtonActiveTransparency" },
		})
		local arrow = new("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(math.floor(btnSize * 0.7), math.floor(btnSize * 0.7)),
			BackgroundTransparency = 1,
			Image = Icons.Down,
			ScaleType = Enum.ScaleType.Fit,
			BorderSizePixel = 0,
		}, collapse)
		bindColor(rr, arrow, "ImageColor3", "TextColor", "ImageTransparency", "TextTransparency")
		local titleLabel = new("TextLabel", {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, Style.FramePadding.X * 2 + btnSize + Style.ItemInnerSpacing.X, 0.5, 0),
			Size = UDim2.new(1, -(Style.FramePadding.X * 3 + btnSize * 2 + Style.ItemInnerSpacing.X * 2), 1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = tostring(title),
			TextTruncate = Enum.TextTruncate.AtEnd,
		}, titleBar)
		textStyle(rr, titleLabel)
		local close = new("TextButton", {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -Style.FramePadding.X, 0.5, 0),
			Size = UDim2.fromOffset(btnSize, btnSize),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			AutoButtonColor = false,
		}, titleBar)
		UICorner(close, 1)
		bindInteraction(rr, close, close, {
			Base = { "BackgroundTransparency", 1, "BackgroundColor3", "ButtonColor" },
			Hovered = { "BackgroundColor3", "ButtonHoveredColor", "BackgroundTransparency", "ButtonHoveredTransparency" },
			Active = { "BackgroundColor3", "ButtonActiveColor", "BackgroundTransparency", "ButtonActiveTransparency" },
		})
		local closeIcon = new("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(math.floor(btnSize * 0.7), math.floor(btnSize * 0.7)),
			BackgroundTransparency = 1,
			Image = Icons.Close,
			ScaleType = Enum.ScaleType.Fit,
			BorderSizePixel = 0,
		}, close)
		bindColor(rr, closeIcon, "ImageColor3", "TextColor", "ImageTransparency", "TextTransparency")
		local content = new("ScrollingFrame", {
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromScale(0, 0),
			ScrollBarThickness = Style.ScrollbarSize,
			VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
			TopImage = Icons.Scroll,
			MidImage = Icons.Scroll,
			BottomImage = Icons.Scroll,
			LayoutOrder = 2,
			ClipsDescendants = true,
		}, win)
		new("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }, content)
		UIPadding(content, Style.WindowPadding)
		UIListLayout(content, Enum.FillDirection.Vertical, UDim.new(0, Style.ItemSpacing.Y))
		bindColor(rr, content, "ScrollBarImageColor3", "ScrollbarGrabColor", "ScrollBarImageTransparency", "ScrollbarGrabTransparency")
		local gripSize = Style.TextSize + Style.FramePadding.X
		local grip = new("ImageButton", {
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.fromScale(1, 1),
			Size = UDim2.fromOffset(gripSize, gripSize),
			BackgroundTransparency = 1,
			Image = Icons.Grip,
			Rotation = 90,
			AutoButtonColor = false,
			ZIndex = 5,
			BorderSizePixel = 0,
		}, win)
		bindColor(rr, grip, "ImageColor3", "ResizeGripColor", "ImageTransparency", "ResizeGripTransparency")
		bindInteraction(rr, grip, grip, imageSpec("ResizeGrip"))
		local rightEdge = new("ImageButton", {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			Size = UDim2.new(0, Style.ResizePadding, 1, 0),
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			AutoButtonColor = false,
			ZIndex = 4,
		}, win)
		local bottomEdge = new("ImageButton", {
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 1, 0),
			Size = UDim2.new(1, 0, 0, Style.ResizePadding),
			BackgroundTransparency = 1,
			ImageTransparency = 1,
			AutoButtonColor = false,
			ZIndex = 4,
		}, win)
		rr.dragging = false
		rr.resizing = false
		connect(rr, titleBar.InputBegan, function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				rr.dragging = true
				rr.dragDelta = getMouse() - ws.pos
				maxZ += 1
				win.ZIndex = maxZ
				closeAllPopups()
			end
		end)
		local function startResize()
			if ws.collapsed then
				return
			end
			rr.resizing = true
			rr.lastMouse = getMouse()
			maxZ += 1
			win.ZIndex = maxZ
			closeAllPopups()
		end
		for _, el in ipairs({ grip, rightEdge, bottomEdge }) do
			connect(rr, el.InputBegan, function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					startResize()
				end
			end)
		end
		connect(rr, UserInputService.InputChanged, function(input)
			if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then
				return
			end
			if rr.dragging then
				ws.pos = clampWindowPos(getMouse() - rr.dragDelta, ws)
			elseif rr.resizing then
				local m = getMouse()
				local d = m - rr.lastMouse
				rr.lastMouse = m
				ws.expanded = clampWindowSize(ws.expanded + d)
				ws.size = ws.expanded
			end
		end)
		connect(rr, UserInputService.InputEnded, function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				rr.dragging = false
				rr.resizing = false
			end
		end)
		connect(rr, content:GetPropertyChangedSignal("CanvasPosition"), closeAllPopups)
		connect(rr, close.MouseButton1Click, function()
			ws.open = false
			writeVal(opts.Open, false)
			closeAllPopups()
		end)
		connect(rr, collapse.MouseButton1Click, function()
			ws.collapsed = not ws.collapsed
			closeAllPopups()
		end)
		rr.win = win
		rr.content = content
		rr.titleLabel = titleLabel
		rr.arrow = arrow
		rr.close = close
		rr.collapse = collapse
		rr.grip = grip
		rr.rightEdge = rightEdge
		rr.bottomEdge = bottomEdge
		rr.isWindow = true
		return win
	end)
	if isState(opts.Open) then
		ws.open = opts.Open:Get()
	end
	if not ws.open then
		r.inst.Visible = false
		PushRegion("window", r, nil)
		return false
	end
	if ws.collapsed then
		ws.expanded = ws.size
	else
		ws.size = ws.expanded
	end
	local barH = frameHeight()
	local visibleSize = ws.collapsed and Vector2.new(ws.expanded.X, barH + 2) or ws.expanded
	ws.pos = clampWindowPos(ws.pos, ws)
	r.inst.Position = UDim2.fromOffset(ws.pos.X, ws.pos.Y)
	r.inst.Size = UDim2.fromOffset(visibleSize.X, visibleSize.Y)
	r.content.Visible = not ws.collapsed
	r.grip.Visible = (not ws.collapsed) and (not opts.NoResize)
	r.rightEdge.Visible = (not ws.collapsed) and (not opts.NoResize)
	r.bottomEdge.Visible = (not ws.collapsed) and (not opts.NoResize)
	r.close.Visible = not opts.NoClose
	r.collapse.Visible = not opts.NoCollapse
	r.arrow.Image = ws.collapsed and Icons.Right or Icons.Down
	r.titleLabel.Text = tostring(title)
	PushRegion("window", r, r.content)
	return true
end

function IrisX.End()
	PopRegion("window")
end

function IrisX.SetWindowOpen(title, open)
	local ws = WidgetStates["window/" .. tostring(title)]
	if ws then
		ws.open = open and true or false
	end
end

IrisX.PushID = PushID
IrisX.PopID = PopID

function IrisX.IsRunning()
	return Runtime.running
end

local function postFrame()
	local f = Runtime.frame
	for i = #OpenPopups, 1, -1 do
		local pr = OpenPopups[i]
		if pr.frame ~= f then
			pcall(pr.closeFn)
		end
	end
	for id, r in pairs(Records) do
		if r.frame ~= f then
			if r.inst.Visible then
				r.inst.Visible = false
			end
			if f - r.frame > 300 then
				destroyRecord(r)
				Records[id] = nil
			end
		end
	end
	local vp = getViewport()
	for id, r in pairs(Records) do
		if r.isWindow and r.inst.Visible then
			local ws = WidgetStates[id]
			if ws and (ws.pos.Y > vp.Y - 40 or ws.pos.X > vp.X - 60) then
				ws.pos = Vector2.new(
					math.min(ws.pos.X, math.max(0, vp.X - 60)),
					math.min(ws.pos.Y, math.max(0, vp.Y - 40))
				)
				r.inst.Position = UDim2.fromOffset(ws.pos.X, ws.pos.Y)
			end
		end
	end
end

function IrisX.Connect(fn)
	Runtime.callback = fn
end

local function Shutdown()
	if not Runtime.running then
		return
	end
	Runtime.running = false
	Runtime.callback = nil
	Runtime.keyCapture = false
	if Runtime.conn then
		pcall(function()
			Runtime.conn:Disconnect()
		end)
		Runtime.conn = nil
	end
	for _, c in ipairs(Runtime.connections) do
		pcall(function()
			c:Disconnect()
		end)
	end
	table.clear(Runtime.connections)
	for _, r in pairs(Records) do
		destroyRecord(r)
	end
	table.clear(Records)
	table.clear(WidgetStates)
	table.clear(AllStates)
	table.clear(OpenPopups)
	table.clear(ActiveNotifications)
	table.clear(ActiveByKey)
	for _, gui in ipairs({ RootGui, PopupGui, NotifyGui }) do
		if gui and gui.Parent then
			gui:Destroy()
		end
	end
	RootGui, PopupGui, NotifyGui = nil, nil, nil
	G.__IRISX_RUNTIME = nil
end

function IrisX.Shutdown()
	Shutdown()
end

local function Init(config)
	if Runtime.running then
		return IrisX
	end
	config = config or {}
	Runtime.toggleKey = config.Keybind or Enum.KeyCode.Insert
	loadTheme(config.Theme or "dark")
	for _, gui in ipairs(PlayerGui:GetChildren()) do
		if gui:IsA("ScreenGui") and (gui.Name == "IrisX" or gui.Name == "IrisX_Popups" or gui.Name == "IrisX_Notify") then
			gui:Destroy()
		end
	end
	RootGui = new("ScreenGui", {
		Name = "IrisX",
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = 127,
	}, PlayerGui)
	PopupGui = new("ScreenGui", {
		Name = "IrisX_Popups",
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = 999,
	}, PlayerGui)
	NotifyGui = new("ScreenGui", {
		Name = "IrisX_Notify",
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = 9999,
	}, PlayerGui)
	table.insert(Runtime.connections, UserInputService.InputBegan:Connect(function(input, gpe)
		if not gpe and not Runtime.keyCapture and input.KeyCode == Runtime.toggleKey then
			RootGui.Enabled = not RootGui.Enabled
			if not RootGui.Enabled then
				closeAllPopups()
			end
		end
	end))
	table.insert(Runtime.connections, UserInputService.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			local m = getMouse()
			for i = #OpenPopups, 1, -1 do
				local pr = OpenPopups[i]
				if not inBounds(m, pr.inst) and not (pr.preview and inBounds(m, pr.preview)) then
					pcall(pr.closeFn)
				end
			end
		end
	end))
	table.insert(Runtime.connections, RunService.Heartbeat:Connect(tickNotifications))
	Runtime.running = true
	Runtime.conn = RunService.Heartbeat:Connect(function()
		Runtime.frame += 1
		FrameCounters = {}
		IDStack = { "" }
		RegionStack = {}
		ContainerStack = {}
		ContainerOrders = {}
		for _, s in ipairs(AllStates) do
			s._changed = false
		end
		if Runtime.callback then
			local ok, err = pcall(Runtime.callback)
			if ok then
				Runtime.lastError = nil
			elseif err ~= Runtime.lastError then
				Runtime.lastError = err
				warn("[IrisX] " .. tostring(err))
			end
		end
		postFrame()
	end)
	G.__IRISX_RUNTIME = { Shutdown = Shutdown }
	return IrisX
end

IrisX.Init = Init

function IrisX.ShowDemoWindow()
	local ds = widgetState("demo", {})
	ds.check = ds.check or State(false)
	ds.slider = ds.slider or State(50)
	ds.text = ds.text or State("")
	ds.combo = ds.combo or State("Alpha")
	ds.radio = ds.radio or State("A")
	ds.key = ds.key or State(Enum.KeyCode.Unknown)

	if IrisX.BeginWindow("Iris-X Demo", { Size = Vector2.new(380, 470), Position = Vector2.new(220, 140) }) then
		IrisX.Text("Every frame is rebuilt from scratch.")
		IrisX.TextWrapped("Toggle key: " .. Runtime.toggleKey.Name)

		IrisX.SeparatorText("Widgets")
		IrisX.BeginGroup()
		if IrisX.Button("Notify") then
			IrisX.Notify("Hello from Iris-X " .. IrisX.Version, { Type = "success" })
		end
		if IrisX.Button("Theme") then
			IrisX.SetTheme(IrisX.GetTheme() == "dark" and "light" or "dark")
		end
		if IrisX.Button("Unload") then
			IrisX.Shutdown()
			return
		end
		IrisX.EndGroup()

		local checked = IrisX.Checkbox("Extra section", ds.check)
		ds.check:Set(checked)
		IrisX.TextWrapped("Checkbox: " .. (checked and "on" or "off"))

		if checked then
			local s = IrisX.Slider("Slider", 0, 100, ds.slider, { Step = 1 })
			ds.slider:Set(s)
			IrisX.Text("Value: " .. math.floor(s + 0.5) .. "/100")

			local text, submitted = IrisX.InputText("Input", ds.text, { Placeholder = "type, press enter" })
			ds.text:Set(text)
			if submitted and text ~= "" then
				IrisX.Notify("Submitted: " .. text, { Type = "info" })
			end

			local picked = IrisX.Combo("Combo", { "Alpha", "Beta", "Gamma" }, ds.combo)
			ds.combo:Set(picked)
			IrisX.Text("Combo: " .. tostring(picked))

			IrisX.BeginGroup()
			if IrisX.RadioButton("A", ds.radio:Get() == "A") then
				ds.radio:Set("A")
			end
			if IrisX.RadioButton("B", ds.radio:Get() == "B") then
				ds.radio:Set("B")
			end
			IrisX.EndGroup()
			IrisX.Text("Radio: " .. ds.radio:Get())

			local k = IrisX.Keybind("Keybind", ds.key)
			ds.key:Set(k)
			IrisX.Text("Key: " .. k.Name)
		end

		IrisX.SeparatorText("Tabs")
		if IrisX.BeginTabBar("demo") then
			if IrisX.BeginTabItem("Tree") then
				local headOpen = IrisX.CollapsingHeader("Header")
				if headOpen then
					IrisX.Text("Under collapsing header.")
				end
				IrisX.TreePop()

				local nodeOpen = IrisX.TreeNode("Node")
				if nodeOpen then
					IrisX.Text("Nested inside tree node.")
					if IrisX.Button("Deep button") then
						IrisX.Notify("Deep click", { Type = "warning" })
					end
				end
				IrisX.TreePop()
				IrisX.EndTabItem()
			end

			if IrisX.BeginTabItem("About") then
				IrisX.TextWrapped(IrisX.Version .. ": immediate mode, ID stack, widget pool, persistent states.")
				IrisX.EndTabItem()
			end

			IrisX.EndTabBar()
		end
	end
	IrisX.End()
end

IrisX.Version = IrisX.Version or "4.0.0"

local expected = {
	"Init", "Connect", "Shutdown", "IsRunning", "SetTheme", "GetTheme",
	"Notify", "SetNotifyPosition", "GetNotifyPosition", "PushID", "PopID",
	"SetWindowOpen", "BeginWindow", "End", "Text", "TextWrapped", "Separator",
	"SeparatorText", "Button", "Checkbox", "RadioButton", "Slider", "InputText",
	"Combo", "Keybind", "BeginGroup", "EndGroup", "BeginTabBar", "EndTabBar",
	"BeginTabItem", "EndTabItem", "TreeNode", "CollapsingHeader", "TreePop", "State",
}
for _, name in ipairs(expected) do
	if IrisX[name] == nil then
		warn("[IrisX] not defined, file is truncated above: " .. name)
	end
end

if getgenv then
	getgenv().IrisX = IrisX
else
	_G.IrisX = IrisX
end

return IrisX
