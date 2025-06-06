local wasProximityDisabledFromOverride = false
disableProximityCycle = false

local ESX = exports["Framework"]:getSharedObject()

RegisterCommand('setvoiceintent', function(source, args)
    if GetConvarInt('voice_allowSetIntent', 1) == 1 then
        local intent = args[1]
        if intent == 'speech' then
            MumbleSetAudioInputIntent(`speech`)
        elseif intent == 'music' then
            MumbleSetAudioInputIntent(`music`)
        end
        LocalPlayer.state:set('voiceIntent', intent, true)
    end
end)
TriggerEvent('chat:addSuggestion', '/setvoiceintent', 'Sets the players voice intent', {
    { name = "intent",
        help = "speech is default and enables noise suppression & high pass filter, music disables both of these." },
})

-- TODO: Better implementation of this?
RegisterCommand('vol', function(_, args)
    if not args[1] then return end
    setVolume(tonumber(args[1]))
end)
TriggerEvent('chat:addSuggestion', '/vol', 'Sets the radio/phone volume', {
    { name = "volume", help = "A range between 1-100 on how loud you want them to be" },
})

exports('setAllowProximityCycleState', function(state)
    type_check({ state, "boolean" })
    disableProximityCycle = state
end)

function setProximityState(proximityRange, isCustom)
    local voiceModeData = Cfg.voiceModes[mode]
    MumbleSetTalkerProximity(proximityRange + 0.0)
    LocalPlayer.state:set('proximity', {
        index = mode,
        distance = proximityRange,
        mode = isCustom and "Custom" or voiceModeData[2],
    }, true)
    
    TriggerEvent("iZeyy:Hud:changeMicMode", isCustom and #Cfg.voiceModes or mode - 1)
end

exports("overrideProximityRange", function(range, disableCycle)
    type_check({ range, "number" })
    setProximityState(range, true)
    if disableCycle then
        disableProximityCycle = true
        wasProximityDisabledFromOverride = true
    end
end)

exports("clearProximityOverride", function()
    local voiceModeData = Cfg.voiceModes[mode]
    setProximityState(voiceModeData[1], false)
    if wasProximityDisabledFromOverride then
        disableProximityCycle = false
    end
end)

RegisterCommand('cycleproximity', function()
    -- Proximity est désactivé ou forcé manuellement
    if GetConvarInt('voice_enableProximityCycle', 1) ~= 1 or disableProximityCycle then return end
    local newMode = mode + 1

    if newMode <= #Cfg.voiceModes then
        mode = newMode
    else
        mode = 1
    end

    setProximityState(Cfg.voiceModes[mode][1], false)
    TriggerEvent('pma-voice:setTalkingMode', mode)
    TriggerEvent("iZeyy:Hud:changeMicMode", mode)

    local currentModeName = Cfg.voiceModes[mode][2]
    ESX.ShowNotification('Mode vocal actuel : ' .. currentModeName)

    Citizen.CreateThread(function()
        local i = 0
        while i < 15 do
            Citizen.Wait(0)
            i = i + 1
            DrawMarker(1, GetEntityCoords(PlayerPedId()) - vector3(0, 0, 1.0), 0, 0, 0, 0, 0, 0, Cfg.voiceModes[mode][1] * 2.0, Cfg.voiceModes[mode][1] * 2.0, 1.0, 0, 137, 201, 140, 0, 0, 0, 0)
        end
    end)
end, false)


if gameVersion == 'fivem' then
	RegisterKeyMapping('cycleproximity', 'Cycle Proximity', 'keyboard', GetConvar('voice_defaultCycle', 'F11'))
end