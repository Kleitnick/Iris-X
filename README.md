# Iris-X

ImGui-style UI library for Roblox executors.

## Load

```lua
local IrisX = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kleitnick/Iris-X/refs/heads/main/loader.lua"))()
```

## Window

```lua
local win = IrisX:CreateWindow({
    Title = "My Menu",
    Size = Vector2.new(400, 500),
    Position = Vector2.new(100, 100),
    Theme = "dark",
})
```

| Option | Type | Default |
|---|---|---|
| Title | string | "Iris-X" |
| Size | Vector2 | 320, 400 |
| Position | Vector2 | 150, 150 |
| Theme | "dark" / "light" | "dark" |

## Widgets

Every widget takes an optional `parent` as the last argument. Without it, the widget goes into the window container.

### Text

```lua
win:Text("Hello world")
win:Text("Red text", nil, {Color = Color3.fromRGB(255, 80, 80)})
win:Text("Wrapped line", nil, {Wrapped = true})
```

### Separator

```lua
win:Separator()
```

### SeparatorText

```lua
win:SeparatorText("Section name")
```

### Button

```lua
win:Button("Click me", function(btn)
    print("clicked")
end)
```

### Toggle

```lua
local toggle = win:Toggle("Enable ESP", false, function(value)
    print("ESP:", value)
end)

toggle:Get()
toggle:Set(true)
```

### Slider

```lua
local slider = win:Slider("FOV", 10, 500, 120, function(value)
    print("FOV:", value)
end)

slider:Get()
slider:Set(200)
```

### Input

```lua
local input = win:Input("Name filter", "type here...", function(text)
    print("Input:", text)
end)

input:Get()
input:Set("prefilled")
```

### Keybind

```lua
local bind = win:Keybind("Aimbot Key", Enum.KeyCode.E, function(key)
    print("Key:", key.Name)
end)

bind:Get()
```

### Combo

```lua
local combo = win:Combo("Hitbox", {"Head", "Torso", "Legs"}, "Head", function(value)
    print("Selected:", value)
end)

combo:Get()
combo:Set("Torso")
```

### Radio

```lua
win:Radio("Option A", true, function(v) end)
win:Radio("Option B", false, function(v) end)
```

## Sections

Collapsible containers. Section returns a parent you pass to any widget.

```lua
local esp = win:Section("ESP")
win:Toggle("Enabled", false, function(v) end, esp)
win:Toggle("Box", true, function(v) end, esp)
win:Slider("Distance", 100, 5000, 1000, function(v) end, esp)
```

Nest sections inside each other the same way — pass the parent section to the child.

## Tabs

```lua
local tabs = win:Tabs()
local aim = tabs:AddTab("AIM")
local visual = tabs:AddTab("VISUAL")

win:Toggle("Aimbot", false, function(v) end, aim)
win:Toggle("ESP", false, function(v) end, visual)
```

## Notifications

```lua
IrisX:Notify("Config saved", {Type = "success", Duration = 3, Title = "Iris-X"})
```

| Option | Type | Default |
|---|---|---|
| Type | "info" / "success" / "warning" / "error" | "info" |
| Duration | number (seconds) | 3 |
| Position | see below | current default |
| Title | string | "Iris-X" |
| Key | string | nil |

`Key` deduplicates notifications. If a notification with the same `Key` and same text is active, its timer resets instead of creating a new one.

### Position

```lua
IrisX:SetNotifyPosition("BottomRight")
```

Available: `TopLeft`, `TopCenter`, `TopRight`, `BottomLeft`, `BottomCenter`, `BottomRight`.

## Window controls

```lua
win:AddThemeButton()
win:AddHideButton()
win:AddUnloadButton()
```

### Theme

```lua
win:SetTheme("light")
win:GetTheme()
win:ToggleTheme()
```

### Destroy

```lua
win:Destroy()
```

Disconnects all connections created through the library, removes all Drawing objects, reverts rollbacks registered via `win._trackRollback`.

## Tracking

If your exploit code creates connections, Drawing objects, or game state changes, register them on the window so `win:Destroy()` cleans them up.

```lua
local conn = RunService.RenderStepped:Connect(function() end)
win._track(conn)

local box = Drawing.new("Square")
win._trackDrawing(box)

Camera.FieldOfView = 120
win._trackRollback(function()
    Camera.FieldOfView = 70
end)
```

## Full example

```lua
local IrisX = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kleitnick/Iris-X/refs/heads/main/loader.lua"))()
local win = IrisX:CreateWindow({Title = "Iris-X", Size = Vector2.new(400, 500)})

local esp = win:Section("ESP")
win:Toggle("Enabled", false, function(v) end, esp)
win:Toggle("Box", true, function(v) end, esp)
win:Slider("Max Distance", 100, 5000, 1000, function(v) end, esp)

local aim = win:Section("AIMBOT")
win:Toggle("Enabled", false, function(v) end, aim)
win:Slider("FOV", 10, 500, 120, function(v) end, aim)
win:Combo("Hitbox", {"Head", "Torso"}, "Head", function(v) end, aim)
win:Keybind("Aim Key", Enum.UserInputType.MouseButton2, function(k) end, aim)

local misc = win:Section("MISC")
win:Button("Test notify", function()
    IrisX:Notify("Test message", {Type = "info"})
end, misc)

win:AddThemeButton()
win:AddHideButton()
win:AddUnloadButton()
```
