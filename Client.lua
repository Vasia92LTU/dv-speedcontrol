local ChangedRecently = false
local SpeedDivider = nil
local speedLimitDisplayed = false 

if MPH then
    SpeedDivider = 2.237
else
    SpeedDivider = 3.6
end

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        
        if IsPedInAnyVehicle(playerPed, false) then
            local MaxSpeed = 99999.0
            local NeedToChange = false
            local cords = GetEntityCoords(playerPed, true)
            local currentZoneSpeed = 0  
            
            for _, v in pairs(Zones) do
                local distance = GetDistanceBetweenCoords(cords.x, cords.y, cords.z, v.x, v.y, v.z, v.UseZ)

                if distance < v.distance then
                    NeedToChange = true
                    MaxSpeed = v.LimitSpeed / SpeedDivider
                    currentZoneSpeed = v.LimitSpeed 
                    break 
                end
            end
            
            if NeedToChange then
                SetEntityMaxSpeed(vehicle, MaxSpeed)

                if not speedLimitDisplayed then
                    SendNUIMessage({
                        type = "open",
                        speed = currentZoneSpeed  
                    })
                    speedLimitDisplayed = true
                end
            elseif NeedToChange == false and speedLimitDisplayed then
                SendNUIMessage({
                    type = "close"
                })
                speedLimitDisplayed = false
                SetEntityMaxSpeed(vehicle, 99999.0) 
            end
        else
            if speedLimitDisplayed then
                SendNUIMessage({
                    type = "close"
                })
                speedLimitDisplayed = false
            end
        end

        Wait(500)
    end
end)
