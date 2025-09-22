Config = {}

Config.UseNotify = true       -- true = use ox_lib notify

Config.UseProgress = true     -- true = use ox_lib progressbar

Config.RepairPrice = 500

Config.NpcModel = `s_m_m_autoshop_02`

Config.Blip = {
    enabled = true,            -- true = show blips, false = no blips
    sprite = 402,              -- Wrench icon
    scale = 1.5,               -- size
    colour = 5,                -- Yellow/Orange
    flashes = false,
    text = 'Vehicle Repair',
    shortRange = true          -- blip only visible nearby
}

Config.NpcCoords = {
    vector4(-211.55, -1324.55, 30.89, 270.0), -- LS Customs City
    vector4(110.77, 6626.64, 31.78, 180.0)    -- Paleto Bay
}

