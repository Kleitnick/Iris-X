# Iris-X

ImGui-style UI library for Roblox, reforked from [SirMallard's Iris](https://github.com/SirMallard/Iris) and rewritten specifically for script executors.

Original Iris was designed as an immediate-mode library for studio development. Iris-X drops the Wally/Rotriever toolchain, runs as a single self-contained script via `loadstring`, and adds lifecycle management so re-executing your script never leaves orphaned GUIs or dangling connections.

## What's changed for executors

- **Single-file distribution** — loads via `loadstring`, no dependencies or modules.
- **Hardened teardown** — re-running the loader automatically disconnects old events, clears drawings, and destroys previous GUIs via `__IrisX_Cleanup`.
- **Integrated tracker** — hook your exploit's `RenderStepped` connections, `Drawing` objects, and workspace rollbacks directly into `win:Destroy()`.
- **Built-in stackable notifications** with deduplication.
- **Executor-focused controls** — hide on keybind, unload script button, theme switcher.
- **Fixed mobile/touch input** alongside mouse input for dragging, resizing, and sliders.

## Quickstart

```lua
local IrisX = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kleitnick/Iris-X/refs/heads/main/loader.lua"))()

local win = IrisX:CreateWindow({
    Title = "Aimbot & Visuals",
    Size = Vector2.new(380, 460),
    Keybind = Enum.KeyCode.Insert,
})

local esp = win:Section("Visuals", true)
win:Toggle("ESP Box", false, function(state)
    print("ESP:", state)
end, esp)

win:Slider("Max Distance", 50, 2000, 500, function(val)
    print("Dist:", val)
end, { Step = 50 }, esp)

local aim = win:Section("Aim")
win:Keybind("Aim Key", Enum.KeyCode.E, function(key)
    print("Bound to:", key.Name)
end, aim)

win:Combo("Hitbox", { "Head", "HumanoidRootPart", "Torso" }, "Head", function(part)
    print("Target:", part)
end, aim)

local priority = win:RadioGroup()
priority:Add("Distance", true, function(v) end, aim)
priority:Add("Crosshair", false, function(v) end, aim)

win:AddHideButton()
win:AddUnloadButton()
```

## Documentation

Full API reference, widget signatures, and configuration options are documented in **[API.md](API.md)**.

## Credits

- **SirMallard** — creator of the original [Iris](https://github.com/SirMallard/Iris) library, design concept, and ImGui theme adaptations.
- **Kleitnick** — executor adaptations, stateful lifecycle, cleanup handlers, and standalone runtime.
