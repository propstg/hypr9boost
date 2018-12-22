ESX = nil
local nitroActivado = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while true do
        Citizen.Wait(10)

        local playerVehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)

        if nitroActivado and playerVehicle ~= 0 and IsControlPressed(1, 38) then
            Citizen.Wait(Config.DelayBeforeBoost)

            SetVehicleBoostActive(playerVehicle, 1, 0)
            SetVehicleForwardSpeed(playerVehicle, Config.BoostForce)
            StartScreenEffect("RaceTurbo", 0, 0)
            SetVehicleBoostActive(playerVehicle, 0, 0)

            nitroActivado = false
        end
    end
end)

RegisterNetEvent('hypr9speed:activar')
AddEventHandler('hypr9speed:activar', function()
    closeMenuIfOpen('inventory')
	closeMenuIfOpen('inventory_item')
	ESX.ShowNotification(_U('nitrous_activated'))
    nitroActivado = true
end)

function closeMenuIfOpen(menuName)
    if ESX.UI.Menu.IsOpen('default', 'es_extended', menuName) then
        ESX.UI.Menu.Close('default', 'es_extended', menuName)
    end
end

-- Thanks to Flacetracer for the code snippet @ https://forum.fivem.net/t/help-add-speed-for-vehicle/23966