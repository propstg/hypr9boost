ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('nitro', function(source)
    if ESX.GetPlayerFromId(source).getInventoryItem('nitro').count > 0 then
        TriggerClientEvent('hypr9speed:activar', source)
    else
        TriggerClientEvent('esx:showNotification', source, "Algo va mal.")
    end
end)

RegisterServerEvent('hypr9speed:removeInventoryItem')
AddEventHandler('hypr9speed:removeInventoryItem', function(item, quantity)
    ESX.GetPlayerFromId(source).removeInventoryItem(item, quantity)
end)