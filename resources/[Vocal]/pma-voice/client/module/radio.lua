local radioChannel = 0
local radioNames = {}

--- event syncRadioData
--- syncs the current players on the radio to the client
---@param radioTable table the table of the current players on the radio
---@param localPlyRadioName string the local players name
function syncRadioData(radioTable, localPlyRadioName)
    radioData = radioTable
    logger.info('[radio] Syncing radio table.')
    if GetConvarInt('voice_debugMode', 0) >= 4 then
        -- print('-------- RADIO TABLE --------')
        tprint(radioData)
        -- print('-----------------------------')
    end
    for tgt, enabled in pairs(radioTable) do
        if tgt ~= playerServerId then
            toggleVoice(tgt, enabled, 'radio')
        end
    end
    -- sendUIMessage({
    --     radioChannel = radioChannel,
    --     radioEnabled = radioEnabled
    -- })
    if GetConvarInt("voice_syncPlayerNames", 0) == 1 then
        radioNames[playerServerId] = localPlyRadioName
    end
end

RegisterNetEvent('pma-voice:syncRadioData', syncRadioData)

--- event setTalkingOnRadio
--- sets the players talking status, triggered when a player starts/stops talking.
---@param plySource number the players server id.
---@param enabled boolean whether the player is talking or not.
function setTalkingOnRadio(plySource, enabled)
    radioData[plySource] = enabled
    -- if we don't have radioEnabled don't actually set them as talking (we still want the state to enable people talking later)
    if not radioEnabled then return end
    -- If we're on a call we don't want to toggle their voice disabled this will break calls.
    if not callData[plySource] then
        toggleVoice(plySource, enabled, 'radio')
    end
    playMicClicks(enabled)
end

RegisterNetEvent('pma-voice:setTalkingOnRadio', setTalkingOnRadio)

--- event addPlayerToRadio
--- adds a player onto the radio.
---@param plySource number the players server id to add to the radio.
function addPlayerToRadio(plySource, plyRadioName)
    radioData[plySource] = false
    if GetConvarInt("voice_syncPlayerNames", 0) == 1 then
        radioNames[plySource] = plyRadioName
    end
    if radioPressed then
        logger.info('[radio] %s joined radio %s while we were talking, adding them to targets', plySource, radioChannel)
        playerTargets(radioData, MumbleIsPlayerTalking(PlayerId()) and callData or {})
    else
        logger.info('[radio] %s joined radio %s', plySource, radioChannel)
    end
end

RegisterNetEvent('pma-voice:addPlayerToRadio', addPlayerToRadio)

--- event removePlayerFromRadio
--- removes the player (or self) from the radio
---@param plySource number the players server id to remove from the radio.
function removePlayerFromRadio(plySource)
    if plySource == playerServerId then
        logger.info('[radio] Left radio %s, cleaning up.', radioChannel)
        for tgt, _ in pairs(radioData) do
            if tgt ~= playerServerId then
                toggleVoice(tgt, false, 'radio')
            end
        end
        -- sendUIMessage({
        --     radioChannel = 0,
        --     radioEnabled = radioEnabled
        -- })
        radioNames = {}
        radioData = {}
        playerTargets(MumbleIsPlayerTalking(PlayerId()) and callData or {})
    else
        toggleVoice(plySource, false, 'radio')
        if radioPressed then
            logger.info('[radio] %s left radio %s while we were talking, updating targets.', plySource, radioChannel)
            playerTargets(radioData, MumbleIsPlayerTalking(PlayerId()) and callData or {})
        else
            logger.info('[radio] %s has left radio %s', plySource, radioChannel)
        end
        radioData[plySource] = nil
        if GetConvarInt("voice_syncPlayerNames", 0) == 1 then
            radioNames[plySource] = nil
        end
    end
end

RegisterNetEvent('pma-voice:removePlayerFromRadio', removePlayerFromRadio)

--- function setRadioChannel
--- sets the local players current radio channel and updates the server
---@param channel number the channel to set the player to, or 0 to remove them.
function setRadioChannel(channel)
    if GetConvarInt('voice_enableRadios', 1) ~= 1 then return end
    type_check({ channel, "number" })
    TriggerServerEvent('pma-voice:setPlayerRadio', channel)
    radioChannel = channel
end

--- exports setRadioChannel
--- sets the local players current radio channel and updates the server
exports('setRadioChannel', setRadioChannel)
-- mumble-voip compatability
exports('SetRadioChannel', setRadioChannel)

--- exports removePlayerFromRadio
--- sets the local players current radio channel and updates the server
exports('removePlayerFromRadio', function()
    setRadioChannel(0)
end)

--- exports addPlayerToRadio
--- sets the local players current radio channel and updates the server
---@param _radio number the channel to set the player to, or 0 to remove them.
exports('addPlayerToRadio', function(_radio)
    local radio = tonumber(_radio)
    if radio then
        setRadioChannel(radio)
    end
end)


--- check if the player is dead
--- seperating this so if people use different methods they can customize
--- it to their need as this will likely never be changed
--- but you can integrate the below state bag to your death resources.
--- LocalPlayer.state:set('isDead', true or false, false)
function isDead()
    if LocalPlayer.state.isDead then
        return true
    elseif IsPlayerDead(PlayerId()) then
        return true
    end
    return false
end

RegisterCommand('+radiotalk', function()
    if GetConvarInt('voice_enableRadios', 1) ~= 1 then return end
    if isDead() or LocalPlayer.state.disableRadio then return end
    if not radioPressed and radioEnabled then
        if radioChannel > 0 then
            logger.info('[radio] Start broadcasting, update targets and notify server.')
            playerTargets(radioData, MumbleIsPlayerTalking(PlayerId()) and callData or {})
            TriggerServerEvent('pma-voice:setTalkingOnRadio', true)
            radioPressed = true

            CreateThread(function()
                playMicClicks(true)
            end)
            
            RequestAnimDict('random@arrests')
            while not HasAnimDictLoaded('random@arrests') do
                Wait(10)
            end
            TaskPlayAnim(PlayerPedId(), "random@arrests", "generic_radio_enter", 8.0, 2.0, -1, 50, 2.0, false, false, false)

            CreateThread(function()
                TriggerEvent("pma-voice:radioActive", true)
                while radioPressed and radioChannel > 0 and radioEnabled and not isDead() and not LocalPlayer.state.disableRadio do
                    Wait(0)
                    SetControlNormal(0, 249, 1.0)
                    SetControlNormal(1, 249, 1.0)
                    SetControlNormal(2, 249, 1.0)
                end
            end)
        end
    end
end, false)

RegisterCommand('-radiotalk', function()
    if (radioChannel > 0 or radioEnabled) and radioPressed then
        radioPressed = false
        MumbleClearVoiceTargetPlayers(voiceTarget)
        playerTargets(MumbleIsPlayerTalking(PlayerId()) and callData or {})
        TriggerEvent("pma-voice:radioActive", false)
        playMicClicks(false)
        
        StopAnimTask(PlayerPedId(), "random@arrests", "generic_radio_enter", -4.0)
            
        TriggerServerEvent('pma-voice:setTalkingOnRadio', false)
    end
end, false)
if gameVersion == 'fivem' then
    RegisterKeyMapping('+radiotalk', 'Talk over Radio', 'keyboard', GetConvar('voice_defaultRadio', 'LMENU'))
end

--- event syncRadio
--- syncs the players radio, only happens if the radio was set server side.
---@param _radioChannel number the radio channel to set the player to.
function syncRadio(_radioChannel)

    if GetConvarInt('voice_enableRadios', 1) ~= 1 then return end
    logger.info('[radio] radio set serverside update to radio %s', radioChannel)
    radioChannel = _radioChannel

end

RegisterNetEvent('pma-voice:clSetPlayerRadio', syncRadio)


--- handles "radioEnabled" changing
---@param radioEnabledVal bool whether radio is enabled or not
function handleRadioEnabledChanged(radioEnabledVal)
    if radioEnabledVal then
        syncRadioData(radioData, "")
    else
        removePlayerFromRadio(playerServerId)
    end
end
