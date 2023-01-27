local QBCore
if not Config.CustomQbBuild then
    QBCore = exports['qb-core']:GetCoreObject()
else
    QBCore = exports[Config.BuildName]:GetCoreObject()
end

local boxZones = {}
local isCooldownActive = false
local isInside = false
local currentZone

for i=1, #Config.SceneryLocations do
    local z = Config.SceneryLocations[i].location.z - 1
    boxZones[i] = BoxZone:Create(Config.SceneryLocations[i].location, 5.0, 5.0, {
        name="sceneryBoxZone_" .. tostring(i),
        heading=Config.SceneryLocations[i].location.w,
        minZ=z,
        maxZ=z + 3
    })
end

local combo = ComboZone:Create(boxZones, {name="sceneryCombo", debugPoly=Config.DebugPoly})
combo:onPlayerInOut(function(isPointInside, point, zone)
    isInside = isPointInside
    if isPointInside then
        currentZone = zone
        
        if Config.UseNotify then
            QBCore.Functions.Notify('E to enjoy the view', 'primary', 2500)
        else
            TriggerEvent('qb-core:client:DrawText', 'E to enjoy the view', 'left')
        end
    else
        TriggerEvent('qb-core:client:HideText')
    end
end)

local function StartCooldown()
    CreateThread(function()
        isCooldownActive = true
        Wait(Config.CooldownTime)
        isCooldownActive = false
    end)
end

local function randomThink()
    local name = "think"
    local num = math.random(1, 5)
    if num > 1 then name = name .. num end
    return name
end

local function randomSit()
    local name = "sit"
    local num = math.random(1, 9)
    if num > 1 then name = name .. num end
    return name
end

local function randomLeanBar()
    local name = "leanbar"
    local num = math.random(1, 2)
    if num == 2 then
        name = name .. 3
    end
    return name
end

local function randomMindBlown()
    local name = "mindblown"
    local num = math.random(1, 2)
    if num > 1 then name = name .. num end
    return name
end

CreateThread(function()
    while true do
        if isInside then
            if IsControlPressed(0, 46) then
                if not isCooldownActive then
                    local timeout = 3000
                    local anim = Config.SceneryLocations[currentZone.id].anim
                    local cancelAnim = false
                    local autoCancel = Config.SceneryLocations[currentZone.id].autoCancel

                    if type(anim) == "number" then
                        cancelAnim = true
                        if anim == 1 then anim = randomThink() end
                        if anim == 2 then anim = randomSit() end
                        if anim == 3 then anim = randomLeanBar() end
                        if anim == 4 then anim = randomMindBlown() end
                    end

                    TaskGoStraightToCoord(PlayerPedId(), currentZone.center.x, currentZone.center.y, currentZone.center.z, 5, timeout, currentZone.center.w, 5)
                    Wait(timeout)
                    ExecuteCommand("e " .. anim)

                    if cancelAnim and autoCancel ~= false then
                        Wait(4000)
                        ExecuteCommand("e c")
                    end
                    TriggerServerEvent('hud:server:RelieveStress', Config.ReliveStressAmount)
                    StartCooldown()
                    Wait(1000)
                else
                    local message_num = math.random(1, #Config.CooldownMessages)
                    QBCore.Functions.Notify(Config.CooldownMessages[message_num], 'error', 3000)
                    Wait(1000)
                end
            end
        else
            Wait(200)
        end
        Wait(50)
    end
end)