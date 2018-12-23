ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('nitro', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getInventoryItem('nitro').count > 0 then
        TriggerClientEvent('hypr9speed:activar', source)
        xPlayer.removeInventoryItem('nitro', 1)
    else
        TriggerClientEvent('esx:showNotification', source, _('not_enough_nitrous'))
    end
end)
