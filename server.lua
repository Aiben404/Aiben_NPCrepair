local ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('Aiben_NPCrepair:payRepair', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer then
        if xPlayer.getMoney() >= Config.RepairPrice then
            xPlayer.removeMoney(Config.RepairPrice)
            TriggerClientEvent('Aiben_NPCrepair:doRepair', src, true)
        else
            TriggerClientEvent('Aiben_NPCrepair:doRepair', src, false)
        end
    else
        print(("[Aiben_NPCrepair] ERROR: Could not fetch xPlayer for id %s"):format(src))
    end
end)
