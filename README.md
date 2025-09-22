# Aiben NPC Repair Script (ESX + ox_lib)

This resource adds NPC mechanics around the map that can repair vehicles for a configurable price.  
It is optimized, uses **ox_lib** for progress bars and notifications, and supports configurable map blips.

---

## 📌 Features
- Repair NPCs at multiple locations (`Config.NpcCoords`)
- Configurable repair price
- NPCs are interactable with **ox_target**
- Vehicle repair includes fixing engine, body, and cleaning dirt
- Uses **ox_lib notify** and **ox_lib progress bar**
- Fully configurable blip system
- Optimized codebase for performance

---

## ⚙️ Installation
1. Download or clone this resource into your `resources` folder:
   ```
   resources/[esx]/Aiben_NPCrepair
   ```

2. Ensure you have:
   - ESX (es_extended)
   - ox_lib
   - ox_target

3. Add the following line to your `server.cfg`:
   ```
   ensure Aiben_NPCrepair
   ```

---

## 🛠️ Configuration
All settings are managed in `config.lua`.

### Example:
```lua
Config = {}

Config.UseNotify = true       -- true = use ox_lib notify
Config.UseProgress = true     -- true = use ox_lib progressbar

Config.RepairPrice = 500      -- cost to repair

Config.NpcModel = `s_m_m_autoshop_02`

Config.NpcCoords = {
    vector4(-211.55, -1324.55, 30.89, 270.0), -- LS Customs City
    vector4(110.77, 6626.64, 31.78, 180.0)    -- Paleto Bay
}

-- Blip settings for repair locations
Config.Blip = {
    enabled = true,            -- true = show blips
    sprite = 402,              -- Wrench icon
    scale = 0.8,
    colour = 5,                -- Yellow/Orange
    flashes = false,
    text = 'Vehicle Repair',
    shortRange = true          -- only visible nearby
}
```

---

## 🔧 Usage
- Approach an NPC mechanic
- Use **ox_target** to interact
- Pay the configured price
- Vehicle is repaired after progress bar completes (if enabled)

---

## 📜 Credits
- Script Author: **Aiben404**