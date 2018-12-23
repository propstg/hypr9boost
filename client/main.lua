ESX = nil
local nitroActivado = false
local playerVehicle = 0

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while true do
        Citizen.Wait(10)

        playerVehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)

        if nitroActivado and playerVehicle ~= 0 then
            ESX.ShowHelpNotification(_('nitrous_ready'))

            if IsControlPressed(1, 38) then
                ESX.ShowNotification(_('nitrous_activated'))
                Citizen.Wait(Config.DelayBeforeBoost)

                SetVehicleBoostActive(playerVehicle, 1, 0)
                SetVehicleForwardSpeed(playerVehicle, Config.BoostForce)
                StartScreenEffect("RaceTurbo", 0, 0)
                SetVehicleBoostActive(playerVehicle, 0, 0)

                nitroActivado = false
            end
        end
    end
end)

RegisterNetEvent('hypr9speed:activar')
AddEventHandler('hypr9speed:activar', function()
    closeMenuIfOpen('inventory')
    closeMenuIfOpen('inventory_item')
    nitroActivado = true
end)

function closeMenuIfOpen(menuName)
    if ESX.UI.Menu.IsOpen('default', 'es_extended', menuName) then
        ESX.UI.Menu.Close('default', 'es_extended', menuName)
    end
end

-- Thanks to Flacetracer for the code snippet @ https://forum.fivem.net/t/help-add-speed-for-vehicle/23966
