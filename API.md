# Iris-X API Reference

All widgets accept an optional `parent` as their **last** argument. Omit it to place the widget directly in the main scrolling window. Valid parents include sections (`win:Section`) and tab bodies (`tabs:AddTab`).

---

## Static Library API (`IrisX`)

### `IrisX:CreateWindow(options)`
Creates and mounts a new window.

```lua
local win = IrisX:CreateWindow({
    Title = "My Menu",                   -- string, default "Iris-X"
    Size = Vector2.new(320, 400),        -- Vector2, min clamped to 260x160
    Position = Vector2.new(150, 150),    -- Vector2
    Theme = "dark",                      -- "dark" or "light" (or custom key)
    Keybind = Enum.KeyCode.Insert,       -- visibility toggle key
})
```

Returns a `Window` object.

---

### `IrisX:Notify(text, options)`
Pushes a toast notification to the screen stack.

```lua
IrisX:Notify("Configuration loaded", {
    Type = "success",        -- "info" | "success" | "warning" | "error"
    Duration = 3,            -- number (seconds, default 3)
    Position = "TopRight",   -- see positions below
    Title = "Iris-X",        -- header string
    Key = "cfg_load",        -- string: deduplicates spam
    Theme = "dark",          -- "dark" | "light"
})
```

- Max 5 notifications shown at once per position; oldest is removed first.
- When `Key` matches an existing notification:
  - If `text` is identical, its timer resets to `Duration`.
  - If `text` is different, the old notification is replaced immediately.

### `IrisX:SetNotifyPosition(position)` / `IrisX:GetNotifyPosition()`
Sets or gets the default screen corner for notifications without an explicit `Position`.

Valid positions:
- `"TopLeft"`, `"TopCenter"`, `"TopRight"`
- `"BottomLeft"`, `"BottomCenter"`, `"BottomRight"`

---

## Window Methods (`win`)

### Lifecycle & Visibility

#### `win:Destroy()`
Closes all popups, disconnects library and tracked connections, deletes tracked Drawing objects, executes registered rollbacks, and destroys all GUI instances.

#### `win:AddHideButton(bind, parent)`
Spawns a button that hides the UI (showing a reminder toast with the toggle key). Passing `bind` updates the window's toggle key.

#### `win:AddUnloadButton(parent)`
Spawns a button that calls `win:Destroy()`.

#### `win:AddThemeButton(parent)`
Spawns a button that toggles between dark and light themes.

#### `win:SetTheme(name)` / `win:GetTheme()` / `win:ToggleTheme()`
Switches theme at runtime. Updates all registered colors and transparencies across open widgets.

---

### Widgets

Stateful widgets return a controller object exposing:
- `obj:Get()` — returns the current value.
- `obj:Set(value, silent)` — sets value and updates GUI. Fires callback unless `silent == true`.
- `obj.Instance` — root GuiObject instance.

---

#### `win:Text(str, options, parent)`
Displays a static text label.

```lua
win:Text("Hello world")
win:Text("Error text", { Color = Color3.fromRGB(240, 80, 80) })
win:Text("Long paragraph that wraps properly", { Wrapped = true }, parent)
```

| Option | Type | Default |
|---|---|---|
| `Color` | Color3 | Theme `TextColor` |
| `Wrapped` | boolean | `false` |

---

#### `win:Separator(parent)`
Draws a 1-pixel horizontal line across the container.

#### `win:SeparatorText(text, parent)`
Draws an ImGui-style section separator with centered text and lines on both sides.

---

#### `win:Button(text, callback, parent)`
Standard clickable button.

```lua
win:Button("Reset Settings", function(btn)
    print("clicked")
end, parent)
```

---

#### `win:Toggle(text, default, callback, parent)`
Checkbox toggle.

```lua
local toggle = win:Toggle("Godmode", false, function(state)
    print("Godmode:", state)
end, parent)

toggle:Get()            --> false
toggle:Set(true)        --> updates GUI and fires callback
toggle:Set(false, true) --> updates GUI silently
```

---

#### `win:Slider(text, min, max, default, callback, options, parent)`
Draggable scalar slider. Supports continuous and stepped values.

```lua
local slider = win:Slider("FOV", 30, 120, 70, function(val)
    Camera.FieldOfView = val
end, { Step = 1 }, parent)

slider:Get()
slider:Set(90)
```

| Option | Type | Default | Description |
|---|---|---|---|
| `Step` | number | `nil` | Snaps value to increments of this size. |
| `Precision` | number | `0` if Step is integer, else `2` | Number of decimal places in label overlay. |

---

#### `win:Input(text, placeholder, callback, parent)`
Text input box. Callback fires on `FocusLost` (not per keystroke).

```lua
local input = win:Input("Player Name", "Enter username...", function(text)
    print("Target:", text)
end, parent)

input:Get()
input:Set("JohnDoe")
```

---

#### `win:Keybind(text, default, callback, parent)`
Button that listens for a single keyboard key. Click to listen; press `Escape` to unbind (`Enum.KeyCode.Unknown`); click anywhere outside to cancel.

```lua
local bind = win:Keybind("Trigger Key", Enum.KeyCode.E, function(key)
    print("New key:", key.Name)
end, parent)

bind:Get()                  --> Enum.KeyCode.E
bind:Set(Enum.KeyCode.X)
```

*Note: Keyboard keys only (`Enum.KeyCode`). Mouse buttons are not supported.*

---

#### `win:Combo(text, options, default, callback, parent)`
Single-select dropdown menu. Positions popup below or above depending on viewport boundaries. Automatically closes when parent container scrolls or user clicks outside.

```lua
local combo = win:Combo("Target Part", { "Head", "Torso", "Feet" }, "Head", function(selected)
    print("Aiming at:", selected)
end, parent)

combo:Get()
combo:Set("Torso")
```

---

#### `win:RadioGroup()` / `win:Radio(...)`
Exclusive radio buttons. Use `RadioGroup` to coordinate them:

```lua
local group = win:RadioGroup()

local r1 = group:Add("Option 1", true, function(selected) end, parent)
local r2 = group:Add("Option 2", false, function(selected) end, parent)

group:Get()          --> "Option 1"
group:Set("Option 2")-- deselects Option 1, selects Option 2, fires callbacks
```

Methods on `group`:
- `group:Add(text, default, callback, parent)` — creates a linked radio.
- `group:Get()` — returns the text of the currently selected radio, or `nil`.
- `group:Set(text)` — selects the radio matching `text`.

`win:Radio(text, default, callback, parent)` can be called directly without a group, but will stay permanently selected once clicked.

---

## Layout Containers

### `win:Section(title, defaultOpen, parent)`
Collapsible header block. Returns a child container Frame to pass as `parent` to other widgets.

```lua
local espSection = win:Section("ESP Settings", true) -- starts expanded
win:Toggle("Box", false, cb, espSection)

-- Nested section:
local colorSection = win:Section("Colors", false, espSection)
win:Button("Reset Colors", cb, colorSection)
```

---

### `win:Tabs(parent)`
Horizontal tab strip. Returns a TabGroup controller.

```lua
local tabs = win:Tabs()
local tabAim = tabs:AddTab("Aim")
local tabVis = tabs:AddTab("Visuals")

-- Place widgets inside tab bodies:
win:Toggle("Silent Aim", false, cb, tabAim)
win:Toggle("Tracers", false, cb, tabVis)

tabs:GetCurrent()     --> returns entry table for active tab
tabs:SelectTab(entry) --> switches active tab
```

The first added tab is selected automatically.

---

## Exploit Cleanup & Tracking

Use these internals to register resources created by your own scripts. Calling `win:Destroy()` (or re-executing via the loader) will safely clean them up.

```lua
-- Track an RBXScriptConnection:
local conn = RunService.RenderStepped:Connect(function() end)
win._track(conn)

-- Track a Drawing instance:
local line = Drawing.new("Line")
win._trackDrawing(line)

-- Register a state rollback function:
Camera.FieldOfView = 120
win._trackRollback(function()
    Camera.FieldOfView = 70
end)
```

---

## Custom Themes

Add entries to `IrisX.THEMES` before or after calling `CreateWindow`.

```lua
local custom = {}
for k, v in pairs(IrisX.THEMES.dark) do custom[k] = v end

-- Override specific colors:
custom.WindowBgColor = Color3.fromRGB(18, 18, 22)
custom.TitleBgActiveColor = Color3.fromRGB(75, 45, 120)
custom.ButtonColor = Color3.fromRGB(95, 55, 150)
custom.FrameBgColor = Color3.fromRGB(30, 30, 38)

IrisX.THEMES.purple = custom

-- Use on init:
local win = IrisX:CreateWindow({ Theme = "purple" })

-- Or switch at runtime:
win:SetTheme("purple")
```

All color keys accept `Color3`. Each color has a matching `*Transparency` (number, 0 to 1) property in the table.
