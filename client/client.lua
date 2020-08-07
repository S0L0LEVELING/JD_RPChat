local pedDisplaying = {}

local function DrawText3D(coords, text)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)
    local scale = 200 / (GetGameplayCamFov() * dist)
        SetTextColour(Config.Me3dcolor.r, Config.Me3dcolor.g, Config.Me3dcolor.b, Config.Me3dcolor.a)
        SetTextScale(0.0, Config.Me3dScale * scale)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextDropShadow()
        SetTextCentre(true)
        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName(text)
        SetDrawOrigin(coords, 0)
        EndTextCommandDisplayText(0.0, 0.0)
        ClearDrawOrigin()
end
local function Display(ped, text)

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local pedCoords = GetEntityCoords(ped)
    local dist = #(playerCoords - pedCoords)

    if dist <= Config.Me3ddistToDraw then
        pedDisplaying[ped] = (pedDisplaying[ped] or 1) + 1
        local display = true
        Citizen.CreateThread(function()
            Wait(Config.Me3ddisplayTime)
            display = false
        end)
        local offset = 0.8 + pedDisplaying[ped] * 0.1
        while display do
            if HasEntityClearLosToEntity(playerPed, ped, 17 ) then
                local x, y, z = table.unpack(GetEntityCoords(ped))
                z = z + offset
                DrawText3D(vector3(x, y, z), text)
            end
            Wait(0)
        end
        pedDisplaying[ped] = pedDisplaying[ped] - 1

    end
end

RegisterNetEvent('shareDisplay')
AddEventHandler('shareDisplay', function(text, serverId)
    local player = GetPlayerFromServerId(serverId)
    if player ~= -1 then
        local ped = GetPlayerPed(player)
        Display(ped, text)
    end
end)
