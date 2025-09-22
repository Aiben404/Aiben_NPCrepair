


CreateThread(function()
    lib.requestModel(Config.NpcModel, 10000)

    for _, coords in pairs(Config.NpcCoords) do
        local npc = CreatePed(4, Config.NpcModel, coords.x, coords.y, coords.z - 1, coords.w, false, true)
        SetEntityInvincible(npc, true)
        SetBlockingOfNonTemporaryEvents(npc, true)
        FreezeEntityPosition(npc, true)

        exports.ox_target:addLocalEntity(npc, {
            {
                name = 'npc_repair',
                icon = 'fas fa-wrench',
                label = ('Repair Vehicle [$%s]'):format(Config.RepairPrice),
                onSelect = function()
                    TriggerServerEvent('Aiben_NPCrepair:payRepair')
                end
            }
        })
    end
end)




CreateThread(function()
    if Config.Blip.enabled then
        for _, coords in pairs(Config.NpcCoords) do
            local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
            SetBlipSprite(blip, Config.Blip.sprite)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, Config.Blip.scale)
            SetBlipColour(blip, Config.Blip.colour)
            SetBlipAsShortRange(blip, Config.Blip.shortRange or false)
            if Config.Blip.flashes then
                SetBlipFlashes(blip, true)
            end
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config.Blip.text)
            EndTextCommandSetBlipName(blip)
        end
    end
end)




RegisterNetEvent('Aiben_NPCrepair:doRepair', function(success)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    if not DoesEntityExist(vehicle) then
        if Config.UseNotify then
            lib.notify({ title = 'Repair', description = 'You must be in a vehicle!', type = 'error' })
        end
        return
    end

    if success then
        if Config.UseProgress then
            if lib.progressBar({
                duration = 5000,
                label = 'Repairing vehicle...',
                useWhileDead = false,
                canCancel = false,
                disable = { car = true, move = true, combat = true },
            }) then
                SetVehicleFixed(vehicle)
                SetVehicleDirtLevel(vehicle, 0.0)
                SetVehicleEngineHealth(vehicle, 1000.0)
                SetVehicleBodyHealth(vehicle, 1000.0)
                if Config.UseNotify then
                    lib.notify({ title = 'Repair', description = 'Your vehicle has been repaired!', type = 'success' })
                end
            end
        else

            SetVehicleFixed(vehicle)
            SetVehicleDirtLevel(vehicle, 0.0)
            SetVehicleEngineHealth(vehicle, 1000.0)
            SetVehicleBodyHealth(vehicle, 1000.0)
            if Config.UseNotify then
                lib.notify({ title = 'Repair', description = 'Your vehicle has been repaired!', type = 'success' })
            end
        end
    else
        if Config.UseNotify then
            lib.notify({ title = 'Repair', description = 'You do not have enough money!', type = 'error' })
        end
    end
end)
