# Iris-X

ImGui-style UI library for Roblox executors.

- Draggable, resizable, collapsible windows
- Tabs, sections, and the standard widget set
- Dark and light themes, custom themes supported
- Stackable notifications
- Clean teardown: `win:Destroy()` or re-running the script removes everything it created

## Load

```lua
local IrisX = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kleitnick/Iris-X/refs/heads/main/loader.lua"))()
```

Loading the script again tears down the previous instance before building a new one.

## Window

```lua
local win = IrisX:CreateWindow({
    Title = "My Menu",
    Size = Vector2.new(400, 500),
    Position = Vector2.new(100, 100),
    Theme = "dark",
    Keybind = Enum.KeyCode.Insert,
})
```

| Option | Type | Default |
|---|---|---|
| Title | string | "Iris-X" |
| Size | Vector2 | 320, 400 |
| Position | Vector2 | 150, 150 |
| Theme | "dark" / "light" / custom | "dark" |
| Keybind | Enum.KeyCode | Insert (visibility toggle) |

### Window behavior

- Drag by the title bar, resize from the right or bottom edge or the corner grip. The window is clamped to the screen; minimum size 260×160.
- The arrow collapses the window to its title bar. The dash button hides it completely — only the Keybind brings it back.
- The ✕ button destroys the window.

## Widgets

Every widget takes an optional `parent` as the **last** argument. Without it, the widget goes into the window container. Sections and tab bodies are valid parents.

Stateful widgets (Toggle, Slider, Input, Keybind, Combo, Radio) return an object:

```lua
obj:Get()             -- current value
obj:Set(value)        -- update and fire the callback
obj:Set(value, true)  -- update silently
```

### Text

```lua
win:Text("Hello world")
win:Text("Red text", { Color = Color3.fromRGB(255, 80, 80) })
win:Text("Wrapped line", { Wrapped = true })
```

| Option | Type | Default |
|---|---|---|
| Color | Color3 | theme text color |
| Wrapped | bool | false |

### Separator / SeparatorText

```lua
win:Separator()
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
end, { Step = 1 })
```

| Option | Type | Default |
|---|---|---|
| Step | number | nil (continuous) |
| Precision | number | 0 for whole-number steps, else 2 |

### Input

```lua
local input = win:Input("Name filter", "type here...", function(text)
    print("Input:", text)
end)

input:Get()
input:Set("prefilled")
```

Fires on focus loss, not per keystroke.

### Keybind

```lua
local bind = win:Keybind("Aimbot Key", Enum.KeyCode.E, function(key)
    print("Key:", key.Name)
end)

bind:Get()
bind:Set(Enum.KeyCode.Q)
```

Keyboard keys only. Click the button to start listening, then press a key. Escape clears the bind; clicking anywhere else cancels without changing it.

### Combo

```lua
local combo = win:Combo("Hitbox", {"Head", "Torso", "Legs"}, "Head", function(value)
    print("Selected:", value)
end)

combo:Get()
combo:Set("Torso")
```

The popup scrolls when the list is taller than 200 px. Clicking outside closes it.

### Radio

Radios in a group are exclusive — clicking one clears the others:

```lua
local group = win:RadioGroup()
group:Add("Option A", true, function(v) end)
group:Add("Option B", false, function(v) end)

group:Get()    --> "Option A"
group:Set("Option B")
```

`Add` takes the same arguments as `win:Radio`. `group:Set` fires the callbacks of the selected and deselected radios.

Standalone radios exist but stay on once clicked; you almost always want a group.

## Sections

Collapsible containers. A section returns a parent you can pass to any widget, including another section.

```lua
local esp = win:Section("ESP")
win:Toggle("Enabled", false, function(v) end, esp)

local adv = win:Section("Advanced", true, esp)  -- starts open, nested
```

Sections start collapsed; pass `true` as the second argument to start expanded.

## Tabs

```lua
local tabs = win:Tabs()
local aim = tabs:AddTab("AIM")
local visual = tabs:AddTab("VISUAL")

win:Toggle("Aimbot", false, function(v) end, aim)
win:Toggle("ESP", false, function(v) end, visual)
```

The first tab is selected automatically. Tab bodies are valid parents.

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
| Theme | "dark" / "light" | "dark" |

At most 5 notifications are visible; the oldest is dropped first. Each position stacks independently.

`Key` deduplicates: same key and same text resets the timer; same key and different text replaces the old notification.

```lua
IrisX:SetNotifyPosition("BottomRight")
IrisX:GetNotifyPosition()
```

Available: `TopLeft`, `TopCenter`, `TopRight`, `BottomLeft`, `BottomCenter`, `BottomRight`.

## Window controls

```lua
win:AddThemeButton()                  -- cycles dark/light
win:AddHideButton()                   -- hides the window
win:AddHideButton(Enum.KeyCode.P)     -- also rebinds the toggle key
win:AddUnloadButton()                 -- win:Destroy()
```

All take an optional parent as the last argument.

## Themes

```lua
win:SetTheme("light")
win:GetTheme()
win:ToggleTheme()
```

Custom theme — copy a built-in one and override:

```lua
local ocean = {}
for k, v in pairs(IrisX.THEMES.dark) do ocean[k] = v end
ocean.WindowBgColor = Color3.fromRGB(12, 24, 46)
ocean.TitleBgActiveColor = Color3.fromRGB(20, 40, 80)
ocean.ButtonHoveredColor = Color3.fromRGB(80, 160, 255)
IrisX.THEMES.ocean = ocean

local win = IrisX:CreateWindow({Title = "My Menu", Theme = "ocean"})
-- or: win:SetTheme("ocean")
```

## Destroy

```lua
win:Destroy()
```

Destroys the window, widgets and popups, disconnects every connection created through the library, removes Drawing objects, and reverts rollbacks registered via `win._trackRollback`.

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

local esp = win:Section("ESP", true)
win:Toggle("Enabled", false, function(v) end, esp)
win:Toggle("Box", true, function(v) end, esp)
win:Slider("Max Distance", 100, 5000, 1000, function(v) end, esp, {Step = 100})

local aim = win:Section("AIMBOT")
win:Toggle("Enabled", false, function(v) end, aim)
win:Slider("FOV", 10, 500, 120, function(v) end, aim, {Step = 1})
win:Combo("Hitbox", {"Head", "Torso"}, "Head", function(v) end, aim)
win:Keybind("Aim Key", Enum.KeyCode.Q, function(k) end, aim)

local priority = win:RadioGroup()
priority:Add("Distance", true, function(v) end, aim)
priority:Add("Health", false, function(v) end, aim)

local misc = win:Section("MISC")
win:Button("Test notify", function()
    IrisX:Notify("Test message", {Type = "info"})
end, misc)

win:AddThemeButton()
win:AddHideButton()
win:AddUnloadButton()
```
