local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local TextService = game:GetService("TextService")
local HttpService = game:GetService("HttpService")

local LP = Players.LocalPlayer

local GlobalEnv = (getgenv and getgenv()) or _G
if GlobalEnv.__IrisX_Cleanup then
	pcall(GlobalEnv.__IrisX_Cleanup)
end

local function getGuiParent()
	if gethui then
		local ok, res = pcall(gethui)
		if ok and typeof(res) == "Instance" then
			return res
		end
	end
	local ok, core = pcall(function()
		return game:GetService("CoreGui")
	end)
	if ok and typeof(core) == "Instance" then
		local testOk = pcall(function()
			local _ = core.Name
		end)
		if testOk then
			return core
		end
	end
	return LP:WaitForChild("PlayerGui")
end

local GuiParent = getGuiParent()

local Themes = {
	dark = {
		WindowBg = Color3.fromRGB(18, 18, 22),
		TitleBg = Color3.fromRGB(24, 24, 30),
		TitleBgActive = Color3.fromRGB(30, 30, 38),
		Border = Color3.fromRGB(48, 48, 60),
		FrameBg = Color3.fromRGB(28, 28, 36),
		FrameBgHovered = Color3.fromRGB(38, 38, 48),
		FrameBgActive = Color3.fromRGB(48, 48, 62),
		Text = Color3.fromRGB(235, 235, 242),
		TextDisabled = Color3.fromRGB(130, 130, 145),
		CheckMark = Color3.fromRGB(95, 135, 255),
		SliderGrab = Color3.fromRGB(95, 135, 255),
		SliderGrabActive = Color3.fromRGB(120, 155, 255),
		Button = Color3.fromRGB(36, 36, 46),
		ButtonHovered = Color3.fromRGB(48, 48, 62),
		ButtonActive = Color3.fromRGB(60, 60, 78),
		Header = Color3.fromRGB(30, 30, 40),
		HeaderHovered = Color3.fromRGB(40, 40, 52),
		HeaderActive = Color3.fromRGB(50, 50, 66),
		Separator = Color3.fromRGB(45, 45, 58),
		Tab = Color3.fromRGB(26, 26, 34),
		TabHovered = Color3.fromRGB(40, 40, 52),
		TabActive = Color3.fromRGB(95, 135, 255),
		PopupBg = Color3.fromRGB(22, 22, 28),
		ScrollbarBg = Color3.fromRGB(20, 20, 26),
		ScrollbarGrab = Color3.fromRGB(65, 65, 82),
		Accent = Color3.fromRGB(95, 135, 255),
		Success = Color3.fromRGB(70, 200, 120),
		Warning = Color3.fromRGB(240, 180, 60),
		Error = Color3.fromRGB(235, 80, 80),
		Font = Enum.Font.GothamMedium,
		FontBold = Enum.Font.GothamBold,
		TextSize = 13,
		TitleTextSize = 14,
		CornerRadius = UDim.new(0, 5),
		WindowCorner = UDim.new(0, 8),
		ItemSpacing = 6,
		WindowPadding = 10,
		FramePadding = 6,
	},
	light = {
		WindowBg = Color3.fromRGB(242, 242, 247),
		TitleBg = Color3.fromRGB(228, 228, 236),
		TitleBgActive = Color3.fromRGB(218, 218, 228),
		Border = Color3.fromRGB(195, 195, 208),
		FrameBg = Color3.fromRGB(228, 228, 236),
		FrameBgHovered = Color3.fromRGB(215, 215, 225),
		FrameBgActive = Color3.fromRGB(200, 200, 215),
		Text = Color3.fromRGB(28, 28, 35),
		TextDisabled = Color3.fromRGB(125, 125, 140),
		CheckMark = Color3.fromRGB(65, 105, 235),
		SliderGrab = Color3.fromRGB(65, 105, 235),
		SliderGrabActive = Color3.fromRGB(45, 85, 215),
		Button = Color3.fromRGB(222, 222, 232),
		ButtonHovered = Color3.fromRGB(208, 208, 220),
		ButtonActive = Color3.fromRGB(192, 192, 208),
		Header = Color3.fromRGB(225, 225, 235),
		HeaderHovered = Color3.fromRGB(212, 212, 224),
		HeaderActive = Color3.fromRGB(198, 198, 212),
		Separator = Color3.fromRGB(200, 200, 212),
		Tab = Color3.fromRGB(225, 225, 235),
		TabHovered = Color3.fromRGB(210, 210, 222),
		TabActive = Color3.fromRGB(65, 105, 235),
		PopupBg = Color3.fromRGB(248, 248, 252),
		ScrollbarBg = Color3.fromRGB(232, 232, 240),
		ScrollbarGrab = Color3.fromRGB(170, 170, 185),
		Accent = Color3.fromRGB(65, 105, 235),
		Success = Color3.fromRGB(45, 170, 95),
		Warning = Color3.fromRGB(215, 150, 35),
		Error = Color3.fromRGB(215, 60, 60),
		Font = Enum.Font.GothamMedium,
		FontBold = Enum.Font.GothamBold,
		TextSize = 13,
		TitleTextSize = 14,
		CornerRadius = UDim.new(0, 5),
		WindowCorner = UDim.new(0, 8),
		ItemSpacing = 6,
		WindowPadding = 10,
		FramePadding = 6,
	}
}

local function new(class, props, parent)
	local o = Instance.new(class)
	if props then
		for k, v in pairs(props) do
			o[k] = v
		end
	end
	if typeof(parent) == "Instance" then
		o.Parent = parent
	end
	return o
end

local function corner(parent, r)
	return new("UICorner", { CornerRadius = r or UDim.new(0, 5) }, parent)
end

local function stroke(parent, color, thickness, transparency)
	return new("UIStroke", {
		Color = color or Color3.fromRGB(48, 48, 60),
		Thickness = thickness or 1,
		Transparency = transparency or 0,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	}, parent)
end

local function padding(parent, t, b, l, r)
	return new("UIPadding", {
		PaddingTop = UDim.new(0, t or 0),
		PaddingBottom = UDim.new(0, b or t or 0),
		PaddingLeft = UDim.new(0, l or t or 0),
		PaddingRight = UDim.new(0, r or l or t or 0),
	}, parent)
end

local function list(parent, spacing, dir, halign, valign)
	return new("UIListLayout", {
		Padding = UDim.new(0, spacing or 6),
		FillDirection = dir or Enum.FillDirection.Vertical,
		HorizontalAlignment = halign or Enum.HorizontalAlignment.Left,
		VerticalAlignment = valign or Enum.VerticalAlignment.Top,
		SortOrder = Enum.SortOrder.LayoutOrder
	}, parent)
end

local function tween(obj, dur, props, style, dir)
	local t = TweenService:Create(
		obj,
		TweenInfo.new(dur or 0.15, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out),
		props
	)
	t:Play()
	return t
end

local function colorToHex(c)
	return string.format("#%02X%02X%02X", math.round(c.R * 255), math.round(c.G * 255), math.round(c.B * 255))
end

local function hexToColor(hex)
	if type(hex) ~= "string" then return nil end
	hex = hex:gsub("^#", ""):gsub("%s+", "")
	if #hex == 6 then
		local r = tonumber(hex:sub(1, 2), 16)
		local g = tonumber(hex:sub(3, 4), 16)
		local b = tonumber(hex:sub(5, 6), 16)
		if r and g and b then
			return Color3.fromRGB(r, g, b)
		end
	end
	return nil
end

local function formatKey(k)
	if not k or k == Enum.KeyCode.Unknown then
		return "None"
	end
	if typeof(k) == "EnumItem" then
		if k.EnumType == Enum.UserInputType then
			if k == Enum.UserInputType.MouseButton1 then return "MB1" end
			if k == Enum.UserInputType.MouseButton2 then return "MB2" end
			if k == Enum.UserInputType.MouseButton3 then return "MB3" end
		end
		return k.Name
	end
	return tostring(k)
end

local function parseKey(str)
	if type(str) ~= "string" or str == "None" or str == "" then
		return nil
	end
	if str == "MB1" or str == "MouseButton1" then return Enum.UserInputType.MouseButton1 end
	if str == "MB2" or str == "MouseButton2" then return Enum.UserInputType.MouseButton2 end
	if str == "MB3" or str == "MouseButton3" then return Enum.UserInputType.MouseButton3 end
	for _, item in ipairs(Enum.KeyCode:GetEnumItems()) do
		if item.Name == str then
			return item
		end
	end
	return nil
end

local RootGui = new("ScreenGui", {
	Name = "IrisX",
	ResetOnSpawn = false,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	DisplayOrder = 127
}, GuiParent)

local PopupGui = new("ScreenGui", {
	Name = "IrisX_Popups",
	ResetOnSpawn = false,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	DisplayOrder = 999
}, GuiParent)

local NotifyGui = new("ScreenGui", {
	Name = "IrisX_Notify",
	ResetOnSpawn = false,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	DisplayOrder = 9999
}, GuiParent)

local NotifyHolder = new("Frame", {
	Name = "Holder",
	AnchorPoint = Vector2.new(1, 1),
	Position = UDim2.new(1, -16, 1, -16),
	Size = UDim2.new(0, 290, 1, -32),
	BackgroundTransparency = 1
}, NotifyGui)

list(NotifyHolder, 8, Enum.FillDirection.Vertical, Enum.HorizontalAlignment.Right, Enum.VerticalAlignment.Bottom)

local ActiveWindows = {}

local function FullCleanup()
	for _, w in ipairs(ActiveWindows) do
		pcall(function() w:Destroy() end)
	end
	table.clear(ActiveWindows)
	pcall(function() RootGui:Destroy() end)
	pcall(function() PopupGui:Destroy() end)
	pcall(function() NotifyGui:Destroy() end)
end

GlobalEnv.__IrisX_Cleanup = FullCleanup

local IrisX = {}
IrisX.Themes = Themes

function IrisX:Notify(opts)
	opts = opts or {}
	local title = opts.Title or "Notification"
	local content = opts.Content or opts.Text or ""
	local duration = opts.Duration or 4
	local ntype = string.lower(opts.Type or "info")
	local th = Themes[opts.Theme or "dark"] or Themes.dark

	local accentColor = th.Accent
	if ntype == "success" then accentColor = th.Success
	elseif ntype == "warning" or ntype == "warn" then accentColor = th.Warning
	elseif ntype == "error" or ntype == "danger" then accentColor = th.Error end

	local card = new("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = th.WindowBg,
		BackgroundTransparency = 1,
		ClipsDescendants = true
	}, NotifyHolder)
	corner(card, UDim.new(0, 6))
	local cardStroke = stroke(card, th.Border, 1, 1)

	local bar = new("Frame", {
		Size = UDim2.new(0, 3, 1, 0),
		BackgroundColor3 = accentColor,
		BorderSizePixel = 0
	}, card)

	local body = new("Frame", {
		Position = UDim2.new(0, 3, 0, 0),
		Size = UDim2.new(1, -3, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1
	}, card)
	padding(body, 8, 8, 10, 10)
	list(body, 4)

	local titleLbl = new("TextLabel", {
		Size = UDim2.new(1, 0, 0, 16),
		BackgroundTransparency = 1,
		Text = title,
		Font = th.FontBold,
		TextSize = th.TextSize,
		TextColor3 = th.Text,
		TextTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left
	}, body)

	local contentLbl = new("TextLabel", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		Text = content,
		Font = th.Font,
		TextSize = th.TextSize - 1,
		TextColor3 = th.TextDisabled,
		TextTransparency = 1,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left
	}, body)

	tween(card, 0.2, { BackgroundTransparency = 0.04 })
	tween(cardStroke, 0.2, { Transparency = 0 })
	tween(titleLbl, 0.2, { TextTransparency = 0 })
	tween(contentLbl, 0.2, { TextTransparency = 0 })

	task.delay(duration, function()
		if not card or not card.Parent then return end
		tween(card, 0.2, { BackgroundTransparency = 1 })
		tween(cardStroke, 0.2, { Transparency = 1 })
		tween(titleLbl, 0.2, { TextTransparency = 1 })
		tween(contentLbl, 0.2, { TextTransparency = 1 })
		tween(bar, 0.2, { BackgroundTransparency = 1 })
		task.wait(0.22)
		if card then card:Destroy() end
	end)
end

function IrisX:CreateWindow(opts)
	opts = opts or {}
	local winTitle = opts.Title or "Iris-X"
	local winSize = opts.Size or UDim2.fromOffset(500, 380)
	local winPos = opts.Position or UDim2.new(0.5, -250, 0.5, -190)
	local themeName = string.lower(opts.Theme or "dark")
	local th = Themes[themeName] or Themes.dark

	local state = {
		themeName = themeName,
		theme = th,
		toggleKey = opts.Keybind or Enum.KeyCode.Insert,
		keyCapture = false,
		minimized = false,
		visible = true,
		savedSize = winSize,
		connections = {},
		drawings = {},
		rollbacks = {},
		popups = {},
		themeUpdaters = {},
		configFolder = opts.ConfigFolder or "IrisX_Configs"
	}

	local Win = {}
	Win.Flags = {}

	local function track(conn)
		if conn then
			table.insert(state.connections, conn)
		end
		return conn
	end

	local function trackDrawing(d)
		if d then
			table.insert(state.drawings, d)
		end
		return d
	end

	local function trackRollback(fn)
		if type(fn) == "function" then
			table.insert(state.rollbacks, fn)
		end
	end

	Win._track = track
	Win._trackDrawing = trackDrawing
	Win._trackRollback = trackRollback

	local function onThemeChange(fn)
		table.insert(state.themeUpdaters, fn)
		fn(state.theme)
	end

	local function closeAllPopups(except)
		for _, p in ipairs(state.popups) do
			if p ~= except and p.Close then
				p.Close()
			end
		end
	end

	local Main = new("Frame", {
		Name = "Window",
		Size = winSize,
		Position = winPos,
		BackgroundColor3 = th.WindowBg,
		BorderSizePixel = 0,
		ClipsDescendants = true
	}, RootGui)
	corner(Main, th.WindowCorner)
	local MainStroke = stroke(Main, th.Border, 1)

	local Content = new("Frame", {
		Name = "Content",
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1
	}, Main)
	list(Content, 0)

	local TitleBar = new("Frame", {
		Name = "TitleBar",
		Size = UDim2.new(1, 0, 0, 32),
		BackgroundColor3 = th.TitleBg,
		BorderSizePixel = 0,
		LayoutOrder = 1
	}, Content)
	padding(TitleBar, 0, 0, 12, 8)

	local TitleLabel = new("TextLabel", {
		Size = UDim2.new(1, -60, 1, 0),
		BackgroundTransparency = 1,
		Text = winTitle,
		Font = th.FontBold,
		TextSize = th.TitleTextSize,
		TextColor3 = th.Text,
		TextXAlignment = Enum.TextXAlignment.Left
	}, TitleBar)

	local TopBtns = new("Frame", {
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.new(1, 0, 0.5, 0),
		Size = UDim2.fromOffset(52, 22),
		BackgroundTransparency = 1
	}, TitleBar)
	list(TopBtns, 4, Enum.FillDirection.Horizontal, Enum.HorizontalAlignment.Right, Enum.VerticalAlignment.Center)

	local MinBtn = new("TextButton", {
		Size = UDim2.fromOffset(22, 22),
		BackgroundColor3 = th.Button,
		Text = "-",
		Font = th.FontBold,
		TextSize = 14,
		TextColor3 = th.Text,
		AutoButtonColor = false
	}, TopBtns)
	corner(MinBtn, UDim.new(0, 4))

	local CloseBtn = new("TextButton", {
		Size = UDim2.fromOffset(22, 22),
		BackgroundColor3 = th.Button,
		Text = "×",
		Font = th.FontBold,
		TextSize = 15,
		TextColor3 = th.Text,
		AutoButtonColor = false
	}, TopBtns)
	corner(CloseBtn, UDim.new(0, 4))

	local ChildContainer = new("ScrollingFrame", {
		Name = "ChildContainer",
		Size = UDim2.new(1, 0, 1, -32),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 3,
		ScrollBarImageColor3 = th.ScrollbarGrab,
		CanvasSize = UDim2.new(0, 0, 0, 0),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		LayoutOrder = 2
	}, Content)
	new("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }, ChildContainer)
	padding(ChildContainer, th.WindowPadding, th.WindowPadding, th.WindowPadding, th.WindowPadding)
	list(ChildContainer, th.ItemSpacing)

	local ResizeGrip = new("TextButton", {
		Name = "ResizeGrip",
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, -2, 1, -2),
		Size = UDim2.fromOffset(14, 14),
		BackgroundTransparency = 1,
		Text = "◢",
		Font = th.Font,
		TextSize = 10,
		TextColor3 = th.TextDisabled,
		AutoButtonColor = false,
		ZIndex = 10
	}, Main)

	onThemeChange(function(t)
		Main.BackgroundColor3 = t.WindowBg
		MainStroke.Color = t.Border
		TitleBar.BackgroundColor3 = t.TitleBg
		TitleLabel.TextColor3 = t.Text
		MinBtn.BackgroundColor3 = t.Button
		MinBtn.TextColor3 = t.Text
		CloseBtn.BackgroundColor3 = t.Button
		CloseBtn.TextColor3 = t.Text
		ChildContainer.ScrollBarImageColor3 = t.ScrollbarGrab
		ResizeGrip.TextColor3 = t.TextDisabled
	end)

	local function resolveArgs(a, b)
		local wOpts, parent
		if typeof(a) == "Instance" then
			parent = a
			if type(b) == "table" then wOpts = b end
		elseif type(a) == "table" then
			wOpts = a
			if typeof(b) == "Instance" then parent = b end
		elseif typeof(b) == "Instance" then
			parent = b
		end
		return wOpts or {}, parent or ChildContainer
	end

	track(ChildContainer:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
		closeAllPopups()
	end))

	do
		local dragging, dragInput, dragStart, startPos
		track(TitleBar.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				closeAllPopups()
				dragging = true
				dragStart = input.Position
				startPos = Main.Position
				TitleBar.BackgroundColor3 = state.theme.TitleBgActive
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
						TitleBar.BackgroundColor3 = state.theme.TitleBg
					end
				end)
			end
		end))
		track(TitleBar.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end))
		track(UIS.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				local delta = input.Position - dragStart
				Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			end
		end))
	end

	do
		local resizing, resizeStart, startSize
		track(ResizeGrip.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 and not state.minimized then
				closeAllPopups()
				resizing = true
				resizeStart = input.Position
				startSize = Main.Size
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						resizing = false
						state.savedSize = Main.Size
					end
				end)
			end
		end))
		track(UIS.InputChanged:Connect(function(input)
			if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
				local delta = input.Position - resizeStart
				local nw = math.max(300, startSize.X.Offset + delta.X)
				local nh = math.max(200, startSize.Y.Offset + delta.Y)
				Main.Size = UDim2.fromOffset(nw, nh)
			end
		end))
	end

	track(MinBtn.MouseButton1Click:Connect(function()
		closeAllPopups()
		state.minimized = not state.minimized
		ResizeGrip.Visible = not state.minimized
		if state.minimized then
			state.savedSize = Main.Size
			MinBtn.Text = "+"
			tween(Main, 0.18, { Size = UDim2.fromOffset(Main.Size.X.Offset, 32) })
		else
			MinBtn.Text = "-"
			tween(Main, 0.18, { Size = state.savedSize })
		end
	end))

	track(CloseBtn.MouseButton1Click:Connect(function()
		closeAllPopups()
		state.visible = false
		Main.Visible = false
	end))

	track(UIS.InputBegan:Connect(function(input, gpe)
		if gpe or state.keyCapture then return end
		if state.toggleKey then
			if input.KeyCode == state.toggleKey or input.UserInputType == state.toggleKey then
				closeAllPopups()
				state.visible = not state.visible
				Main.Visible = state.visible
			end
		end
	end))

	function Win:SetTheme(name)
		name = string.lower(tostring(name or "dark"))
		if not Themes[name] then return end
		state.themeName = name
		state.theme = Themes[name]
		for _, fn in ipairs(state.themeUpdaters) do
			pcall(fn, state.theme)
		end
	end

	function Win:GetTheme()
		return state.themeName
	end

	function Win:ToggleTheme()
		if state.themeName == "dark" then
			Win:SetTheme("light")
		else
			Win:SetTheme("dark")
		end
		return state.themeName
	end

	function Win:RegisterFlag(flag, ctrl)
		if type(flag) == "string" and flag ~= "" and ctrl then
			Win.Flags[flag] = ctrl
		end
	end

	function Win:Notify(nOpts)
		nOpts = nOpts or {}
		nOpts.Theme = state.themeName
		IrisX:Notify(nOpts)
	end

	function Win:Row(a, b)
		local rOpts, container = resolveArgs(a, b)
		local spacing = rOpts.Spacing or state.theme.ItemSpacing
		local fill = rOpts.Fill ~= false

		local row = new("Frame", {
			Name = "Row",
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1
		}, container)

		list(row, spacing, Enum.FillDirection.Horizontal, Enum.HorizontalAlignment.Left, Enum.VerticalAlignment.Center)

		if fill then
			track(row.ChildAdded:Connect(function(child)
				if child:IsA("GuiObject") then
					child.Size = UDim2.new(0, 0, child.Size.Y.Scale, child.Size.Y.Offset)
					if not child:FindFirstChildOfClass("UIFlexItem") then
						new("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }, child)
					end
				end
			end))
		end

		return row
	end

	function Win:Text(str, a, b)
		local wOpts, container = resolveArgs(a, b)
		local wrapped = wOpts.Wrapped == true
		local customColor = wOpts.Color

		local lbl = new("TextLabel", {
			Size = wrapped and UDim2.new(1, 0, 0, 0) or UDim2.fromOffset(0, 18),
			AutomaticSize = wrapped and Enum.AutomaticSize.Y or Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			Text = tostring(str or ""),
			Font = state.theme.Font,
			TextSize = state.theme.TextSize,
			TextColor3 = customColor or state.theme.Text,
			TextWrapped = wrapped,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		}, container)

		onThemeChange(function(t)
			if not customColor then
				lbl.TextColor3 = t.Text
			end
		end)

		local ctrl = {
			Type = "Text",
			Instance = lbl,
			Set = function(_, newText)
				lbl.Text = tostring(newText or "")
			end,
			Get = function()
				return lbl.Text
			end,
			SetColor = function(_, c)
				customColor = c
				lbl.TextColor3 = c
			end
		}
		return ctrl
	end

	function Win:Separator(parent)
		local container = typeof(parent) == "Instance" and parent or ChildContainer
		local sep = new("Frame", {
			Size = UDim2.new(1, 0, 0, 1),
			BackgroundColor3 = state.theme.Separator,
			BorderSizePixel = 0
		}, container)
		onThemeChange(function(t)
			sep.BackgroundColor3 = t.Separator
		end)
		return sep
	end

	function Win:SeparatorText(str, parent)
		local container = typeof(parent) == "Instance" and parent or ChildContainer
		local holder = new("Frame", {
			Size = UDim2.new(1, 0, 0, 18),
			BackgroundTransparency = 1
		}, container)
		list(holder, 8, Enum.FillDirection.Horizontal, Enum.HorizontalAlignment.Left, Enum.VerticalAlignment.Center)

		local lbl = new("TextLabel", {
			Size = UDim2.fromOffset(0, 18),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundTransparency = 1,
			Text = tostring(str or ""),
			Font = state.theme.FontBold,
			TextSize = state.theme.TextSize - 1,
			TextColor3 = state.theme.Accent,
			LayoutOrder = 1
		}, holder)

		local line = new("Frame", {
			Size = UDim2.new(1, 0, 0, 1),
			BackgroundColor3 = state.theme.Separator,
			BorderSizePixel = 0,
			LayoutOrder = 2
		}, holder)
		new("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }, line)

		onThemeChange(function(t)
			lbl.TextColor3 = t.Accent
			line.BackgroundColor3 = t.Separator
		end)

		return {
			Instance = holder,
			Set = function(_, v) lbl.Text = tostring(v or "") end
		}
	end

	function Win:Button(text, callback, a, b)
		local wOpts, container = resolveArgs(a, b)
		local fullWidth = wOpts.FullWidth ~= false

		local btn = new("TextButton", {
			Size = fullWidth and UDim2.new(1, 0, 0, 28) or UDim2.fromOffset(0, 28),
			AutomaticSize = fullWidth and Enum.AutomaticSize.None or Enum.AutomaticSize.X,
			BackgroundColor3 = state.theme.Button,
			Text = tostring(text or "Button"),
			Font = state.theme.Font,
			TextSize = state.theme.TextSize,
			TextColor3 = state.theme.Text,
			AutoButtonColor = false
		}, container)
		if not fullWidth then
			padding(btn, 0, 0, 12, 12)
		end
		corner(btn, state.theme.CornerRadius)
		local btnStroke = stroke(btn, state.theme.Border, 1)

		track(btn.MouseEnter:Connect(function()
			tween(btn, 0.12, { BackgroundColor3 = state.theme.ButtonHovered })
		end))
		track(btn.MouseLeave:Connect(function()
			tween(btn, 0.12, { BackgroundColor3 = state.theme.Button })
		end))
		track(btn.MouseButton1Down:Connect(function()
			tween(btn, 0.08, { BackgroundColor3 = state.theme.ButtonActive })
		end))
		track(btn.MouseButton1Up:Connect(function()
			tween(btn, 0.12, { BackgroundColor3 = state.theme.ButtonHovered })
		end))
		track(btn.MouseButton1Click:Connect(function()
			if callback then task.spawn(callback) end
		end))

		onThemeChange(function(t)
			btn.BackgroundColor3 = t.Button
			btn.TextColor3 = t.Text
			btnStroke.Color = t.Border
		end)

		return {
			Type = "Button",
			Instance = btn,
			SetText = function(_, t) btn.Text = tostring(t or "") end,
			Fire = function() if callback then task.spawn(callback) end end
		}
	end

	function Win:Toggle(text, default, callback, a, b)
		local wOpts, container = resolveArgs(a, b)
		local val = default == true

		local row = new("TextButton", {
			Size = UDim2.new(1, 0, 0, 26),
			BackgroundTransparency = 1,
			Text = "",
			AutoButtonColor = false
		}, container)

		local box = new("Frame", {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 0, 0.5, 0),
			Size = UDim2.fromOffset(18, 18),
			BackgroundColor3 = val and state.theme.CheckMark or state.theme.FrameBg
		}, row)
		corner(box, UDim.new(0, 4))
		local boxStroke = stroke(box, val and state.theme.CheckMark or state.theme.Border, 1)

		local check = new("TextLabel", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "✓",
			Font = state.theme.FontBold,
			TextSize = 13,
			TextColor3 = Color3.new(1, 1, 1),
			TextTransparency = val and 0 or 1
		}, box)

		local lbl = new("TextLabel", {
			Position = UDim2.new(0, 26, 0, 0),
			Size = UDim2.new(1, -26, 1, 0),
			BackgroundTransparency = 1,
			Text = tostring(text or "Toggle"),
			Font = state.theme.Font,
			TextSize = state.theme.TextSize,
			TextColor3 = state.theme.Text,
			TextXAlignment = Enum.TextXAlignment.Left
		}, row)

		local function updateVisual()
			local t = state.theme
			tween(box, 0.14, { BackgroundColor3 = val and t.CheckMark or t.FrameBg })
			tween(boxStroke, 0.14, { Color = val and t.CheckMark or t.Border })
			tween(check, 0.14, { TextTransparency = val and 0 or 1 })
		end

		local function set(newVal, silent)
			val = newVal == true
			updateVisual()
			if not silent and callback then
				task.spawn(callback, val)
			end
		end

		track(row.MouseButton1Click:Connect(function()
			set(not val, false)
		end))

		onThemeChange(function(t)
			lbl.TextColor3 = t.Text
			updateVisual()
		end)

		local ctrl = {
			Type = "Toggle",
			Instance = row,
			Get = function() return val end,
			Set = function(_, v, silent) set(v, silent) end
		}
		if wOpts.Flag then Win:RegisterFlag(wOpts.Flag, ctrl) end
		return ctrl
	end

	function Win:RadioGroup(flag)
		local group = {
			Type = "RadioGroup",
			Items = {},
			Current = nil,
			Get = function(self)
				return self.Current
			end,
			Set = function(self, label, silent)
				for _, item in ipairs(self.Items) do
					if item.Label == label then
						item:Set(true, silent)
						return
					end
				end
			end
		}
		if flag then Win:RegisterFlag(flag, group) end
		return group
	end

	function Win:Radio(text, default, callback, a, b, explicitGroup)
		local wOpts, container = resolveArgs(a, b)
		local group = explicitGroup or wOpts.Group
		local val = default == true

		local row = new("TextButton", {
			Size = UDim2.new(1, 0, 0, 24),
			BackgroundTransparency = 1,
			Text = "",
			AutoButtonColor = false
		}, container)

		local outer = new("Frame", {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 0, 0.5, 0),
			Size = UDim2.fromOffset(18, 18),
			BackgroundColor3 = state.theme.FrameBg
		}, row)
		corner(outer, UDim.new(1, 0))
		local outerStroke = stroke(outer, val and state.theme.CheckMark or state.theme.Border, 1)

		local dot = new("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = val and UDim2.fromOffset(10, 10) or UDim2.fromOffset(0, 0),
			BackgroundColor3 = state.theme.CheckMark
		}, outer)
		corner(dot, UDim.new(1, 0))

		local lbl = new("TextLabel", {
			Position = UDim2.new(0, 26, 0, 0),
			Size = UDim2.new(1, -26, 1, 0),
			BackgroundTransparency = 1,
			Text = tostring(text or "Radio"),
			Font = state.theme.Font,
			TextSize = state.theme.TextSize,
			TextColor3 = state.theme.Text,
			TextXAlignment = Enum.TextXAlignment.Left
		}, row)

		local function updateVisual()
			local t = state.theme
			outer.BackgroundColor3 = t.FrameBg
			outerStroke.Color = val and t.CheckMark or t.Border
			dot.BackgroundColor3 = t.CheckMark
			tween(dot, 0.14, { Size = val and UDim2.fromOffset(10, 10) or UDim2.fromOffset(0, 0) })
		end

		local ctrl
		local function set(newVal, silent)
			newVal = newVal == true
			if group and newVal then
				for _, item in ipairs(group.Items) do
					if item ~= ctrl and item.Get() then
						item:_setInternal(false, silent)
					end
				end
				group.Current = text
			end
			val = newVal
			updateVisual()
			if not silent and callback then
				task.spawn(callback, val)
			end
		end

		track(row.MouseButton1Click:Connect(function()
			if group then
				if not val then set(true, false) end
			else
				set(not val, false)
			end
		end))

		onThemeChange(function(t)
			lbl.TextColor3 = t.Text
			updateVisual()
		end)

		ctrl = {
			Type = "Radio",
			Label = text,
			Instance = row,
			Get = function() return val end,
			Set = function(_, v, silent) set(v, silent) end,
			_setInternal = function(_, v, silent)
				val = v == true
				updateVisual()
				if not silent and callback then
					task.spawn(callback, val)
				end
			end
		}

		if group and group.Items then
			table.insert(group.Items, ctrl)
			if val then group.Current = text end
		end
		if wOpts.Flag then Win:RegisterFlag(wOpts.Flag, ctrl) end
		return ctrl
	end

	function Win:Slider(text, min, max, default, callback, a, b)
		local wOpts, container = resolveArgs(a, b)
		min = tonumber(min) or 0
		max = tonumber(max) or 100
		local step = tonumber(wOpts.Step)
		local precision = tonumber(wOpts.Precision)
		if not precision then
			if step and step % 1 ~= 0 then
				local s = tostring(step)
				local dotPos = string.find(s, "%.")
				precision = dotPos and (#s - dotPos) or 2
			elseif min % 1 ~= 0 or max % 1 ~= 0 or (default and default % 1 ~= 0) then
				precision = 2
			else
				precision = 0
			end
		end

		local function roundVal(v)
			v = math.clamp(v, min, max)
			if step and step > 0 then
				v = min + math.round((v - min) / step) * step
				v = math.clamp(v, min, max)
			end
			local mult = 10 ^ precision
			return math.round(v * mult) / mult
		end

		local val = roundVal(tonumber(default) or min)

		local holder = new("Frame", {
			Size = UDim2.new(1, 0, 0, 38),
			BackgroundTransparency = 1
		}, container)

		local top = new("Frame", {
			Size = UDim2.new(1, 0, 0, 18),
			BackgroundTransparency = 1
		}, holder)

		local lbl = new("TextLabel", {
			Size = UDim2.new(0.65, 0, 1, 0),
			BackgroundTransparency = 1,
			Text = tostring(text or "Slider"),
			Font = state.theme.Font,
			TextSize = state.theme.TextSize,
			TextColor3 = state.theme.Text,
			TextXAlignment = Enum.TextXAlignment.Left
		}, top)

		local valBox = new("TextBox", {
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, 0, 0, 0),
			Size = UDim2.new(0.35, 0, 1, 0),
			BackgroundTransparency = 1,
			Text = string.format("%." .. precision .. "f", val),
			Font = state.theme.FontBold,
			TextSize = state.theme.TextSize,
			TextColor3 = state.theme.Accent,
			TextXAlignment = Enum.TextXAlignment.Right,
			ClearTextOnFocus = false
		}, top)

		local trackBar = new("TextButton", {
			Position = UDim2.new(0, 0, 0, 22),
			Size = UDim2.new(1, 0, 0, 12),
			BackgroundColor3 = state.theme.FrameBg,
			Text = "",
			AutoButtonColor = false
		}, holder)
		corner(trackBar, UDim.new(1, 0))
		local trackStroke = stroke(trackBar, state.theme.Border, 1)

		local alpha = (max > min) and ((val - min) / (max - min)) or 0
		local fill = new("Frame", {
			Size = UDim2.new(alpha, 0, 1, 0),
			BackgroundColor3 = state.theme.SliderGrab,
			BorderSizePixel = 0
		}, trackBar)
		corner(fill, UDim.new(1, 0))

		local function set(newVal, silent)
			val = roundVal(tonumber(newVal) or min)
			local a2 = (max > min) and ((val - min) / (max - min)) or 0
			tween(fill, 0.06, { Size = UDim2.new(a2, 0, 1, 0) })
			valBox.Text = string.format("%." .. precision .. "f", val)
			if not silent and callback then
				task.spawn(callback, val)
			end
		end

		local sliding = false
		local function updateFromX(x)
			local rel = math.clamp((x - trackBar.AbsolutePosition.X) / math.max(1, trackBar.AbsoluteSize.X), 0, 1)
			set(min + (max - min) * rel, false)
		end

		track(trackBar.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				sliding = true
				fill.BackgroundColor3 = state.theme.SliderGrabActive
				updateFromX(input.Position.X)
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						sliding = false
						fill.BackgroundColor3 = state.theme.SliderGrab
					end
				end)
			end
		end))

		track(UIS.InputChanged:Connect(function(input)
			if sliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				updateFromX(input.Position.X)
			end
		end))

		track(valBox.FocusLost:Connect(function()
			local n = tonumber(valBox.Text)
			if n then
				set(n, false)
			else
				valBox.Text = string.format("%." .. precision .. "f", val)
			end
		end))

		onThemeChange(function(t)
			lbl.TextColor3 = t.Text
			valBox.TextColor3 = t.Accent
			trackBar.BackgroundColor3 = t.FrameBg
			trackStroke.Color = t.Border
			fill.BackgroundColor3 = sliding and t.SliderGrabActive or t.SliderGrab
		end)

		local ctrl = {
			Type = "Slider",
			Instance = holder,
			Get = function() return val end,
			Set = function(_, v, silent) set(v, silent) end
		}
		if wOpts.Flag then Win:RegisterFlag(wOpts.Flag, ctrl) end
		return ctrl
	end

	function Win:Input(text, placeholder, callback, a, b)
		local wOpts, container = resolveArgs(a, b)
		local val = tostring(wOpts.Default or "")
		local numeric = wOpts.Numeric == true

		local holder = new("Frame", {
			Size = UDim2.new(1, 0, 0, 46),
			BackgroundTransparency = 1
		}, container)

		local lbl = new("TextLabel", {
			Size = UDim2.new(1, 0, 0, 16),
			BackgroundTransparency = 1,
			Text = tostring(text or "Input"),
			Font = state.theme.Font,
			TextSize = state.theme.TextSize,
			TextColor3 = state.theme.Text,
			TextXAlignment = Enum.TextXAlignment.Left
		}, holder)

		local boxHolder = new("Frame", {
			Position = UDim2.new(0, 0, 0, 18),
			Size = UDim2.new(1, 0, 0, 26),
			BackgroundColor3 = state.theme.FrameBg
		}, holder)
		corner(boxHolder, state.theme.CornerRadius)
		local boxStroke = stroke(boxHolder, state.theme.Border, 1)
		padding(boxHolder, 0, 0, 8, 8)

		local box = new("TextBox", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = val,
			PlaceholderText = tostring(placeholder or ""),
			Font = state.theme.Font,
			TextSize = state.theme.TextSize,
			TextColor3 = state.theme.Text,
			PlaceholderColor3 = state.theme.TextDisabled,
			TextXAlignment = Enum.TextXAlignment.Left,
			ClearTextOnFocus = false
		}, boxHolder)

		local function set(newVal, silent)
			local s = tostring(newVal or "")
			if numeric then
				s = s:gsub("[^%d%.%-]", "")
			end
			val = s
			box.Text = val
			if not silent and callback then
				task.spawn(callback, numeric and (tonumber(val) or 0) or val)
			end
		end

		track(box.Focused:Connect(function()
			tween(boxStroke, 0.12, { Color = state.theme.Accent })
		end))

		track(box.FocusLost:Connect(function()
			tween(boxStroke, 0.12, { Color = state.theme.Border })
			set(box.Text, false)
		end))

		onThemeChange(function(t)
			lbl.TextColor3 = t.Text
			boxHolder.BackgroundColor3 = t.FrameBg
			boxStroke.Color = t.Border
			box.TextColor3 = t.Text
			box.PlaceholderColor3 = t.TextDisabled
		end)

		local ctrl = {
			Type = "Input",
			Instance = holder,
			Get = function() return numeric and (tonumber(val) or 0) or val end,
			Set = function(_, v, silent) set(v, silent) end
		}
		if wOpts.Flag then Win:RegisterFlag(wOpts.Flag, ctrl) end
		return ctrl
	end

	function Win:Keybind(text, default, callback, a, b)
		local wOpts, container = resolveArgs(a, b)
		local key = default
		local mode = wOpts.Mode or "Toggle"
		local active = false
		local listening = false
		local allowMB1 = wOpts.AllowLeftClick == true
		local fireOnBind = wOpts.FireOnBind == true
		local onTrigger = wOpts.OnTrigger or callback
		local onChanged = wOpts.OnChanged

		local row = new("Frame", {
			Size = UDim2.new(1, 0, 0, 26),
			BackgroundTransparency = 1
		}, container)

		local lbl = new("TextLabel", {
			Size = UDim2.new(1, -90, 1, 0),
			BackgroundTransparency = 1,
			Text = tostring(text or "Keybind"),
			Font = state.theme.Font,
			TextSize = state.theme.TextSize,
			TextColor3 = state.theme.Text,
			TextXAlignment = Enum.TextXAlignment.Left
		}, row)

		local bindBtn = new("TextButton", {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			Size = UDim2.fromOffset(80, 22),
			BackgroundColor3 = state.theme.FrameBg,
			Text = "[" .. formatKey(key) .. "]",
			Font = state.theme.Font,
			TextSize = state.theme.TextSize - 1,
			TextColor3 = state.theme.Text,
			AutoButtonColor = false
		}, row)
		corner(bindBtn, UDim.new(0, 4))
		local bindStroke = stroke(bindBtn, state.theme.Border, 1)

		local function setKey(newKey, silent)
			if type(newKey) == "string" then
				newKey = parseKey(newKey)
			end
			key = newKey
			bindBtn.Text = "[" .. formatKey(key) .. "]"
			if not silent then
				if onChanged then task.spawn(onChanged, key) end
				if fireOnBind and callback then task.spawn(callback, key) end
			end
		end

		track(bindBtn.MouseButton1Click:Connect(function()
			listening = true
			state.keyCapture = true
			bindBtn.Text = "[...]"
			bindStroke.Color = state.theme.Accent
		end))

		track(UIS.InputBegan:Connect(function(input, gpe)
			if listening then
				if input.UserInputType == Enum.UserInputType.Keyboard then
					if input.KeyCode == Enum.KeyCode.Escape or input.KeyCode == Enum.KeyCode.Backspace then
						setKey(nil, false)
					elseif input.KeyCode ~= Enum.KeyCode.Unknown then
						setKey(input.KeyCode, false)
					end
					listening = false
					bindStroke.Color = state.theme.Border
					task.defer(function() state.keyCapture = false end)
				elseif input.UserInputType == Enum.UserInputType.MouseButton2 or input.UserInputType == Enum.UserInputType.MouseButton3 then
					setKey(input.UserInputType, false)
					listening = false
					bindStroke.Color = state.theme.Border
					task.defer(function() state.keyCapture = false end)
				elseif allowMB1 and input.UserInputType == Enum.UserInputType.MouseButton1 then
					setKey(Enum.UserInputType.MouseButton1, false)
					listening = false
					bindStroke.Color = state.theme.Border
					task.defer(function() state.keyCapture = false end)
				end
				return
			end

			if gpe or not key then return end
			local matched = (input.KeyCode == key) or (input.UserInputType == key)
			if matched then
				if mode == "Toggle" then
					active = not active
					if onTrigger then task.spawn(onTrigger, active, key) end
				elseif mode == "Hold" then
					active = true
					if onTrigger then task.spawn(onTrigger, true, key) end
				elseif mode == "Always" then
					active = true
					if onTrigger then task.spawn(onTrigger, true, key) end
				end
			end
		end))

		track(UIS.InputEnded:Connect(function(input, gpe)
			if gpe or listening or not key then return end
			local matched = (input.KeyCode == key) or (input.UserInputType == key)
			if matched and mode == "Hold" then
				active = false
				if onTrigger then task.spawn(onTrigger, false, key) end
			end
		end))

		onThemeChange(function(t)
			lbl.TextColor3 = t.Text
			bindBtn.BackgroundColor3 = t.FrameBg
			bindBtn.TextColor3 = t.Text
			bindStroke.Color = listening and t.Accent or t.Border
		end)

		local ctrl = {
			Type = "Keybind",
			Instance = row,
			Get = function() return key end,
			GetState = function() return mode == "Always" and true or active end,
			GetMode = function() return mode end,
			SetMode = function(_, m) mode = m end,
			Set = function(_, k, silent) setKey(k, silent) end
		}
		if wOpts.Flag then Win:RegisterFlag(wOpts.Flag, ctrl) end
		return ctrl
	end

	function Win:Combo(text, options, default, callback, a, b)
		local wOpts, container = resolveArgs(a, b)
		options = type(options) == "table" and options or {}
		local isMulti = wOpts.Multi == true
		local selected = {}
		local singleVal = nil

		if isMulti then
			if type(default) == "table" then
				if #default > 0 then
					for _, v in ipairs(default) do selected[v] = true end
				else
					for k, v in pairs(default) do if v then selected[k] = true end end
				end
			elseif default ~= nil then
				selected[default] = true
			end
		else
			singleVal = default or options[1]
		end

		local holder = new("Frame", {
			Size = UDim2.new(1, 0, 0, 46),
			BackgroundTransparency = 1
		}, container)

		local lbl = new("TextLabel", {
			Size = UDim2.new(1, 0, 0, 16),
			BackgroundTransparency = 1,
			Text = tostring(text or "Combo"),
			Font = state.theme.Font,
			TextSize = state.theme.TextSize,
			TextColor3 = state.theme.Text,
			TextXAlignment = Enum.TextXAlignment.Left
		}, holder)

		local mainBtn = new("TextButton", {
			Position = UDim2.new(0, 0, 0, 18),
			Size = UDim2.new(1, 0, 0, 26),
			BackgroundColor3 = state.theme.FrameBg,
			Text = "",
			AutoButtonColor = false
		}, holder)
		corner(mainBtn, state.theme.CornerRadius)
		local mainStroke = stroke(mainBtn, state.theme.Border, 1)
		padding(mainBtn, 0, 0, 8, 8)

		local valLbl = new("TextLabel", {
			Size = UDim2.new(1, -18, 1, 0),
			BackgroundTransparency = 1,
			Text = "",
			Font = state.theme.Font,
			TextSize = state.theme.TextSize,
			TextColor3 = state.theme.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, mainBtn)

		local arrow = new("TextLabel", {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			Size = UDim2.fromOffset(14, 14),
			BackgroundTransparency = 1,
			Text = "▾",
			Font = state.theme.FontBold,
			TextSize = 12,
			TextColor3 = state.theme.TextDisabled
		}, mainBtn)

		local popup = new("ScrollingFrame", {
			Visible = false,
			Size = UDim2.fromOffset(160, 0),
			BackgroundColor3 = state.theme.PopupBg,
			BorderSizePixel = 0,
			ScrollBarThickness = 2,
			ScrollBarImageColor3 = state.theme.ScrollbarGrab,
			CanvasSize = UDim2.new(0, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y
		}, PopupGui)
		corner(popup, state.theme.CornerRadius)
		local popStroke = stroke(popup, state.theme.Border, 1)
		padding(popup, 4, 4, 4, 4)
		list(popup, 2)

		local isOpen = false
		local itemBtns = {}

		local function getDisplayText()
			if isMulti then
				local listOut = {}
				for _, opt in ipairs(options) do
					if selected[opt] then table.insert(listOut, tostring(opt)) end
				end
				return #listOut > 0 and table.concat(listOut, ", ") or "None"
			else
				return singleVal ~= nil and tostring(singleVal) or "None"
			end
		end

		local function refreshItems()
			valLbl.Text = getDisplayText()
			local t = state.theme
			for opt, btn in pairs(itemBtns) do
				local act = isMulti and (selected[opt] == true) or (singleVal == opt)
				btn.BackgroundColor3 = act and t.Accent or t.FrameBg
				btn.TextColor3 = act and Color3.new(1, 1, 1) or t.Text
			end
		end

		local function closePopup()
			if not isOpen then return end
			isOpen = false
			arrow.Text = "▾"
			popup.Visible = false
		end

		local popupEntry = { Close = closePopup }
		table.insert(state.popups, popupEntry)

		local function rebuildOptions()
			for _, c in ipairs(popup:GetChildren()) do
				if c:IsA("TextButton") then c:Destroy() end
			end
			table.clear(itemBtns)

			for _, opt in ipairs(options) do
				local ibtn = new("TextButton", {
					Size = UDim2.new(1, 0, 0, 24),
					BackgroundColor3 = state.theme.FrameBg,
					Text = tostring(opt),
					Font = state.theme.Font,
					TextSize = state.theme.TextSize,
					TextColor3 = state.theme.Text,
					AutoButtonColor = false
				}, popup)
				corner(ibtn, UDim.new(0, 4))
				itemBtns[opt] = ibtn

				ibtn.MouseButton1Click:Connect(function()
					if isMulti then
						if selected[opt] then
							selected[opt] = nil
						else
							selected[opt] = true
						end
						refreshItems()
						if callback then
							local copy = {}
							for k, v in pairs(selected) do copy[k] = v end
							task.spawn(callback, copy)
						end
					else
						singleVal = opt
						refreshItems()
						closePopup()
						if callback then
							task.spawn(callback, singleVal)
						end
					end
				end)
			end
			refreshItems()
		end

		rebuildOptions()

		track(mainBtn.MouseButton1Click:Connect(function()
			if isOpen then
				closePopup()
			else
				closeAllPopups(popupEntry)
				isOpen = true
				arrow.Text = "▴"
				local absPos = mainBtn.AbsolutePosition
				local absSize = mainBtn.AbsoluteSize
				local h = math.min(#options * 26 + 8, 150)
				popup.Position = UDim2.fromOffset(absPos.X, absPos.Y + absSize.Y + 4)
				popup.Size = UDim2.fromOffset(absSize.X, h)
				popup.Visible = true
			end
		end))

		local function set(newVal, silent)
			if isMulti then
				table.clear(selected)
				if type(newVal) == "table" then
					if #newVal > 0 then
						for _, v in ipairs(newVal) do selected[v] = true end
					else
						for k, v in pairs(newVal) do if v then selected[k] = true end end
					end
				elseif newVal ~= nil then
					selected[newVal] = true
				end
				refreshItems()
				if not silent and callback then
					local copy = {}
					for k, v in pairs(selected) do copy[k] = v end
					task.spawn(callback, copy)
				end
			else
				singleVal = newVal
				refreshItems()
				if not silent and callback then
					task.spawn(callback, singleVal)
				end
			end
		end

		onThemeChange(function(t)
			lbl.TextColor3 = t.Text
			mainBtn.BackgroundColor3 = t.FrameBg
			mainStroke.Color = t.Border
			valLbl.TextColor3 = t.Text
			arrow.TextColor3 = t.TextDisabled
			popup.BackgroundColor3 = t.PopupBg
			popStroke.Color = t.Border
			popup.ScrollBarImageColor3 = t.ScrollbarGrab
			refreshItems()
		end)

		local ctrl = {
			Type = isMulti and "MultiCombo" or "Combo",
			Instance = holder,
			Popup = popup,
			Close = closePopup,
			Get = function()
				if isMulti then
					local copy = {}
					for k, v in pairs(selected) do copy[k] = v end
					return copy
				end
				return singleVal
			end,
			GetList = function()
				local arr = {}
				if isMulti then
					for _, opt in ipairs(options) do
						if selected[opt] then table.insert(arr, opt) end
					end
				elseif singleVal ~= nil then
					table.insert(arr, singleVal)
				end
				return arr
			end,
			Set = function(_, v, silent) set(v, silent) end,
			SetOptions = function(_, newOpts, newDef, silent)
				options = type(newOpts) == "table" and newOpts or {}
				if newDef ~= nil then
					set(newDef, silent)
				end
				rebuildOptions()
			end
		}
		if wOpts.Flag then Win:RegisterFlag(wOpts.Flag, ctrl) end
		return ctrl
	end

	function Win:ColorPicker(text, default, callback, a, b)
		local wOpts, container = resolveArgs(a, b)
		local curColor = typeof(default) == "Color3" and default or Color3.fromRGB(95, 135, 255)
		local h, s, v = Color3.toHSV(curColor)

		local row = new("Frame", {
			Size = UDim2.new(1, 0, 0, 26),
			BackgroundTransparency = 1
		}, container)

		local lbl = new("TextLabel", {
			Size = UDim2.new(1, -50, 1, 0),
			BackgroundTransparency = 1,
			Text = tostring(text or "Color"),
			Font = state.theme.Font,
			TextSize = state.theme.TextSize,
			TextColor3 = state.theme.Text,
			TextXAlignment = Enum.TextXAlignment.Left
		}, row)

		local previewBtn = new("TextButton", {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			Size = UDim2.fromOffset(40, 20),
			BackgroundColor3 = curColor,
			Text = "",
			AutoButtonColor = false
		}, row)
		corner(previewBtn, UDim.new(0, 4))
		local prevStroke = stroke(previewBtn, state.theme.Border, 1)

		local popup = new("Frame", {
			Visible = false,
			Size = UDim2.fromOffset(190, 175),
			BackgroundColor3 = state.theme.PopupBg
		}, PopupGui)
		corner(popup, state.theme.CornerRadius)
		local popStroke = stroke(popup, state.theme.Border, 1)
		padding(popup, 8, 8, 8, 8)

		local svBox = new("TextButton", {
			Size = UDim2.new(1, -24, 0, 120),
			BackgroundColor3 = Color3.fromHSV(h, 1, 1),
			Text = "",
			AutoButtonColor = false
		}, popup)
		corner(svBox, UDim.new(0, 4))

		local satOverlay = new("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.new(1, 1, 1),
			BorderSizePixel = 0
		}, svBox)
		corner(satOverlay, UDim.new(0, 4))
		new("UIGradient", {
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0),
				NumberSequenceKeypoint.new(1, 1)
			})
		}, satOverlay)

		local valOverlay = new("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.new(0, 0, 0),
			BorderSizePixel = 0
		}, svBox)
		corner(valOverlay, UDim.new(0, 4))
		new("UIGradient", {
			Rotation = 90,
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 1),
				NumberSequenceKeypoint.new(1, 0)
			})
		}, valOverlay)

		local svCursor = new("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(s, 1 - v),
			Size = UDim2.fromOffset(10, 10),
			BackgroundColor3 = Color3.new(1, 1, 1)
		}, svBox)
		corner(svCursor, UDim.new(1, 0))
		stroke(svCursor, Color3.new(0, 0, 0), 1)

		local hueBar = new("TextButton", {
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, 0, 0, 0),
			Size = UDim2.fromOffset(16, 120),
			BackgroundColor3 = Color3.new(1, 1, 1),
			Text = "",
			AutoButtonColor = false
		}, popup)
		corner(hueBar, UDim.new(0, 4))
		new("UIGradient", {
			Rotation = 90,
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
				ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)),
				ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
				ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)),
				ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
				ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
				ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))
			})
		}, hueBar)

		local hueCursor = new("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, h),
			Size = UDim2.new(1, 4, 0, 4),
			BackgroundColor3 = Color3.new(1, 1, 1)
		}, hueBar)
		corner(hueCursor, UDim.new(0, 2))
		stroke(hueCursor, Color3.new(0, 0, 0), 1)

		local hexBox = new("TextBox", {
			Position = UDim2.new(0, 0, 0, 128),
			Size = UDim2.new(1, 0, 0, 26),
			BackgroundColor3 = state.theme.FrameBg,
			Text = colorToHex(curColor),
			Font = state.theme.Font,
			TextSize = state.theme.TextSize,
			TextColor3 = state.theme.Text,
			ClearTextOnFocus = false
		}, popup)
		corner(hexBox, UDim.new(0, 4))
		local hexStroke = stroke(hexBox, state.theme.Border, 1)

		local isOpen = false
		local function closePopup()
			if not isOpen then return end
			isOpen = false
			popup.Visible = false
		end
		local popupEntry = { Close = closePopup }
		table.insert(state.popups, popupEntry)

		local function applyHSV(silent)
			curColor = Color3.fromHSV(h, s, v)
			previewBtn.BackgroundColor3 = curColor
			svBox.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
			svCursor.Position = UDim2.fromScale(s, 1 - v)
			hueCursor.Position = UDim2.fromScale(0.5, h)
			hexBox.Text = colorToHex(curColor)
			if not silent and callback then
				task.spawn(callback, curColor)
			end
		end

		local draggingSV = false
		local draggingHue = false

		local function updateSV(pos)
			s = math.clamp((pos.X - svBox.AbsolutePosition.X) / math.max(1, svBox.AbsoluteSize.X), 0, 1)
			v = 1 - math.clamp((pos.Y - svBox.AbsolutePosition.Y) / math.max(1, svBox.AbsoluteSize.Y), 0, 1)
			applyHSV(false)
		end

		local function updateHue(pos)
			h = math.clamp((pos.Y - hueBar.AbsolutePosition.Y) / math.max(1, hueBar.AbsoluteSize.Y), 0, 1)
			applyHSV(false)
		end

		track(svBox.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				draggingSV = true
				updateSV(input.Position)
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then draggingSV = false end
				end)
			end
		end))

		track(hueBar.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				draggingHue = true
				updateHue(input.Position)
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then draggingHue = false end
				end)
			end
		end))

		track(UIS.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement then
				if draggingSV then updateSV(input.Position)
				elseif draggingHue then updateHue(input.Position) end
			end
		end))

		track(hexBox.FocusLost:Connect(function()
			local c = hexToColor(hexBox.Text)
			if c then
				h, s, v = Color3.toHSV(c)
				applyHSV(false)
			else
				hexBox.Text = colorToHex(curColor)
			end
		end))

		track(previewBtn.MouseButton1Click:Connect(function()
			if isOpen then
				closePopup()
			else
				closeAllPopups(popupEntry)
				isOpen = true
				local absPos = previewBtn.AbsolutePosition
				local absSize = previewBtn.AbsoluteSize
				popup.Position = UDim2.fromOffset(absPos.X - 190 + absSize.X, absPos.Y + absSize.Y + 4)
				popup.Visible = true
			end
		end))

		local function set(c, silent)
			if type(c) == "string" then
				c = hexToColor(c)
			elseif type(c) == "table" and c.R and c.G and c.B then
				c = Color3.new(c.R, c.G, c.B)
			end
			if typeof(c) == "Color3" then
				h, s, v = Color3.toHSV(c)
				applyHSV(silent)
			end
		end

		onThemeChange(function(t)
			lbl.TextColor3 = t.Text
			prevStroke.Color = t.Border
			popup.BackgroundColor3 = t.PopupBg
			popStroke.Color = t.Border
			hexBox.BackgroundColor3 = t.FrameBg
			hexBox.TextColor3 = t.Text
			hexStroke.Color = t.Border
		end)

		local ctrl = {
			Type = "ColorPicker",
			Instance = row,
			Popup = popup,
			Close = closePopup,
			Get = function() return curColor end,
			GetHex = function() return colorToHex(curColor) end,
			Set = function(_, c, silent) set(c, silent) end
		}
		if wOpts.Flag then Win:RegisterFlag(wOpts.Flag, ctrl) end
		return ctrl
	end

	function Win:Tabs(parent)
		local container = typeof(parent) == "Instance" and parent or ChildContainer

		local wrapper = new("Frame", {
			Name = "TabsWrapper",
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1
		}, container)
		list(wrapper, 8)

		local tabBar = new("ScrollingFrame", {
			Name = "TabBar",
			Size = UDim2.new(1, 0, 0, 28),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 0,
			ScrollingDirection = Enum.ScrollingDirection.X,
			CanvasSize = UDim2.new(0, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.X,
			LayoutOrder = 1
		}, wrapper)
		list(tabBar, 6, Enum.FillDirection.Horizontal, Enum.HorizontalAlignment.Left, Enum.VerticalAlignment.Center)

		local bodyHolder = new("Frame", {
			Name = "BodyHolder",
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			LayoutOrder = 2
		}, wrapper)

		local Group = {
			Tabs = {},
			Current = nil
		}

		function Group:SelectTab(entry)
			closeAllPopups()
			self.Current = entry
			local t = state.theme
			for _, tab in ipairs(self.Tabs) do
				local active = (tab == entry)
				tab.Body.Visible = active
				tween(tab.Button, 0.14, { BackgroundColor3 = active and t.TabActive or t.Tab })
				tab.Button.TextColor3 = active and Color3.new(1, 1, 1) or t.Text
			end
		end

		function Group:GetCurrent()
			return self.Current
		end

		function Group:AddTab(title)
			local textWidth = TextService:GetTextSize(tostring(title or "Tab"), state.theme.TextSize, state.theme.FontBold, Vector2.new(1000, 28)).X
			local btn = new("TextButton", {
				Size = UDim2.fromOffset(math.max(64, textWidth + 24), 26),
				BackgroundColor3 = state.theme.Tab,
				Text = tostring(title or "Tab"),
				Font = state.theme.FontBold,
				TextSize = state.theme.TextSize,
				TextColor3 = state.theme.Text,
				AutoButtonColor = false
			}, tabBar)
			corner(btn, state.theme.CornerRadius)

			local body = new("Frame", {
				Name = tostring(title or "Tab"),
				Visible = false,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1
			}, bodyHolder)
			list(body, state.theme.ItemSpacing)

			local entry = {
				Title = title,
				Button = btn,
				Body = body
			}
			table.insert(self.Tabs, entry)

			btn.MouseButton1Click:Connect(function()
				self:SelectTab(entry)
			end)

			if #self.Tabs == 1 then
				self:SelectTab(entry)
			end

			return body, entry
		end

		onThemeChange(function(t)
			for _, tab in ipairs(Group.Tabs) do
				local active = (tab == Group.Current)
				tab.Button.BackgroundColor3 = active and t.TabActive or t.Tab
				tab.Button.TextColor3 = active and Color3.new(1, 1, 1) or t.Text
			end
		end)

		return Group
	end

	function Win:Section(title, a, b)
		local container = ChildContainer
		local open = true

		if typeof(a) == "Instance" then
			container = a
			if type(b) == "boolean" then open = b end
		elseif type(a) == "boolean" then
			open = a
			if typeof(b) == "Instance" then container = b end
		elseif typeof(b) == "Instance" then
			container = b
		end

		local sec = new("Frame", {
			Name = "Section",
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = state.theme.WindowBg,
			BorderSizePixel = 0
		}, container)
		corner(sec, state.theme.CornerRadius)
		local secStroke = stroke(sec, state.theme.Border, 1)
		list(sec, 0)

		local header = new("TextButton", {
			Size = UDim2.new(1, 0, 0, 28),
			BackgroundColor3 = state.theme.Header,
			Text = "",
			AutoButtonColor = false,
			LayoutOrder = 1
		}, sec)
		corner(header, state.theme.CornerRadius)
		padding(header, 0, 0, 10, 10)

		local titleLbl = new("TextLabel", {
			Size = UDim2.new(1, -20, 1, 0),
			BackgroundTransparency = 1,
			Text = tostring(title or "Section"),
			Font = state.theme.FontBold,
			TextSize = state.theme.TextSize,
			TextColor3 = state.theme.Text,
			TextXAlignment = Enum.TextXAlignment.Left
		}, header)

		local arrow = new("TextLabel", {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			Size = UDim2.fromOffset(14, 14),
			BackgroundTransparency = 1,
			Text = open and "▾" or "▸",
			Font = state.theme.FontBold,
			TextSize = 12,
			TextColor3 = state.theme.TextDisabled
		}, header)

		local body = new("Frame", {
			Name = "Body",
			Visible = open,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			LayoutOrder = 2
		}, sec)
		padding(body, 8, 8, 8, 8)
		list(body, state.theme.ItemSpacing)

		track(header.MouseButton1Click:Connect(function()
			closeAllPopups()
			open = not open
			body.Visible = open
			arrow.Text = open and "▾" or "▸"
		end))

		onThemeChange(function(t)
			sec.BackgroundColor3 = t.WindowBg
			secStroke.Color = t.Border
			header.BackgroundColor3 = t.Header
			titleLbl.TextColor3 = t.Text
			arrow.TextColor3 = t.TextDisabled
		end)

		return body
	end

	local function ensureConfigFolder()
		if isfolder and makefolder then
			if not isfolder(state.configFolder) then
				pcall(makefolder, state.configFolder)
			end
			return true
		end
		return false
	end

	function Win:SaveConfig(name)
		name = tostring(name or "default"):gsub("[^%w_%-]", "")
		if name == "" or not writefile or not ensureConfigFolder() then return false end

		local data = {}
		for flag, ctrl in pairs(Win.Flags) do
			local val = ctrl:Get()
			if ctrl.Type == "ColorPicker" then
				data[flag] = { __type = "Color3", hex = colorToHex(val) }
			elseif ctrl.Type == "Keybind" then
				data[flag] = { __type = "Keybind", key = formatKey(val), mode = ctrl:GetMode() }
			else
				data[flag] = val
			end
		end

		local ok, encoded = pcall(function() return HttpService:JSONEncode(data) end)
		if not ok then return false end
		local writeOk = pcall(writefile, state.configFolder .. "/" .. name .. ".json", encoded)
		return writeOk
	end

	function Win:LoadConfig(name, silent)
		name = tostring(name or "default"):gsub("[^%w_%-]", "")
		local path = state.configFolder .. "/" .. name .. ".json"
		if name == "" or not readfile or not isfile or not isfile(path) then return false end

		local ok, content = pcall(readfile, path)
		if not ok or not content then return false end

		local decOk, data = pcall(function() return HttpService:JSONDecode(content) end)
		if not decOk or type(data) ~= "table" then return false end

		for flag, val in pairs(data) do
			local ctrl = Win.Flags[flag]
			if ctrl then
				if type(val) == "table" and val.__type == "Color3" then
					ctrl:Set(val.hex, silent)
				elseif type(val) == "table" and val.__type == "Keybind" then
					if val.mode and ctrl.SetMode then ctrl:SetMode(val.mode) end
					ctrl:Set(val.key, silent)
				else
					ctrl:Set(val, silent)
				end
			end
		end
		return true
	end

	function Win:DeleteConfig(name)
		name = tostring(name or "default"):gsub("[^%w_%-]", "")
		local path = state.configFolder .. "/" .. name .. ".json"
		if name ~= "" and isfile and delfile and isfile(path) then
			pcall(delfile, path)
			return true
		end
		return false
	end

	function Win:ListConfigs()
		local out = {}
		if listfiles and ensureConfigFolder() then
			local ok, files = pcall(listfiles, state.configFolder)
			if ok and type(files) == "table" then
				for _, f in ipairs(files) do
					local n = f:match("([^/\\]+)%.json$")
					if n then table.insert(out, n) end
				end
			end
		end
		if #out == 0 then table.insert(out, "default") end
		return out
	end

	function Win:AddConfigSection(parent)
		local sec = Win:Section("Configurations", true, parent)
		local cfgName = "default"
		local nameInput = Win:Input("Config Name", "default", function(v)
			if v ~= "" then cfgName = v end
		end, { Default = "default" }, sec)

		local combo
		combo = Win:Combo("Saved Configs", Win:ListConfigs(), "default", function(v)
			cfgName = v
			nameInput:Set(v, true)
		end, sec)

		local row1 = Win:Row(sec)
		Win:Button("Save", function()
			if Win:SaveConfig(cfgName) then
				combo:SetOptions(Win:ListConfigs(), cfgName, true)
				Win:Notify({ Title = "Config", Content = "Saved '" .. cfgName .. "'", Type = "success" })
			else
				Win:Notify({ Title = "Config", Content = "Failed to save config", Type = "error" })
			end
		end, row1)

		Win:Button("Load", function()
			if Win:LoadConfig(cfgName, false) then
				Win:Notify({ Title = "Config", Content = "Loaded '" .. cfgName .. "'", Type = "info" })
			else
				Win:Notify({ Title = "Config", Content = "Config not found", Type = "warning" })
			end
		end, row1)

		local row2 = Win:Row(sec)
		Win:Button("Refresh", function()
			combo:SetOptions(Win:ListConfigs(), cfgName, true)
		end, row2)

		Win:Button("Delete", function()
			if Win:DeleteConfig(cfgName) then
				local listNow = Win:ListConfigs()
				cfgName = listNow[1] or "default"
				nameInput:Set(cfgName, true)
				combo:SetOptions(listNow, cfgName, true)
				Win:Notify({ Title = "Config", Content = "Deleted config", Type = "warning" })
			end
		end, row2)

		return sec
	end

	function Win:AddThemeButton(parent)
		return Win:Button("Toggle Theme (Dark / Light)", function()
			Win:ToggleTheme()
		end, parent)
	end

	function Win:AddHideButton(bind, parent)
		if bind then state.toggleKey = bind end
		return Win:Keybind("Menu Toggle Key", state.toggleKey, nil, {
			OnChanged = function(newKey)
				state.toggleKey = newKey
			end
		}, parent)
	end

	function Win:AddUnloadButton(parent)
		return Win:Button("Unload UI", function()
			Win:Destroy()
		end, parent)
	end

	function Win:Destroy()
		closeAllPopups()
		for _, fn in ipairs(state.rollbacks) do
			pcall(fn)
		end
		table.clear(state.rollbacks)

		for _, conn in ipairs(state.connections) do
			pcall(function() conn:Disconnect() end)
		end
		table.clear(state.connections)

		for _, d in ipairs(state.drawings) do
			pcall(function() d:Remove() end)
		end
		table.clear(state.drawings)

		for _, p in ipairs(state.popups) do
			if p.Close then pcall(p.Close) end
		end
		table.clear(state.popups)

		pcall(function() Main:Destroy() end)
	end

	table.insert(ActiveWindows, Win)
	return Win
end

return IrisX
