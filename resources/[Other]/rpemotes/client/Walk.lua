local canChange = true
local unable_message = "You are unable to change your walking style right now."

function WalkMenuStart(name, force)
    if not canChange and not force then
        return
    end
    if Config.PersistentWalk then SetResourceKvp("walkstyle", name) end
    RequestWalking(name)
    SetPedMovementClipset(PlayerPedId(), name, 0.2)
    RemoveAnimSet(name)
end

function ResetWalk()
    if not canChange then
        return
    end
    ResetPedMovementClipset(PlayerPedId(), 0.0)
end

function WalksOnCommand()
    local WalksCommand = ""
    for a in PairsByKeys(RP.Walks) do
        WalksCommand = WalksCommand .. "" .. string.lower(a) .. ", "
    end
end

function WalkCommandStart(name)
    if not canChange then
        return
    end
    name = FirstToUpper(string.lower(name))

    if name == "Reset" then
        ResetPedMovementClipset(PlayerPedId(), 0.0)
        DeleteResourceKvp("walkstyle")
        return
    end

    if TableHasKey(RP.Walks, name) then
        local name2 = table.unpack(RP.Walks[name])
        WalkMenuStart(name2)
    elseif name == "Injured" then
        WalkMenuStart("move_m@injured")
    end
end

-- Persistent Walkstyles are stored to KVP. Once the player has spawned, the walkstyle is applied.

if Config.WalkingStylesEnabled and Config.PersistentWalk then
    -- Function to check if walkstyle is available to prevent exploiting
    local function walkstyleExists(kvp)
        for _, v in pairs(RP.Walks) do
            if v[1] == kvp then
                return true
            end
        end
        return false
    end

    local function handleWalkstyle()
        local kvp = GetResourceKvpString("walkstyle")

        if kvp ~= nil then
            if walkstyleExists(kvp) then
                WalkMenuStart(kvp)
            else
                ResetPedMovementClipset(PlayerPedId(), 0.0)
                DeleteResourceKvp("walkstyle")
            end
        end
    end

    AddEventHandler('playerSpawned', handleWalkstyle)
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', handleWalkstyle)
    RegisterNetEvent('esx:playerLoaded', handleWalkstyle)
end

if Config.WalkingStylesEnabled then
    RegisterCommand('walks', function() WalksOnCommand() end, false)
    RegisterCommand('walk', function(_, args, _) WalkCommandStart(tostring(args[1])) end, false)
    TriggerEvent('chat:addSuggestion', '/walk', 'Set your walkingstyle.', { { name = "style", help = "/walks for a list of valid styles" } })
    TriggerEvent('chat:addSuggestion', '/walks', 'List available walking styles.')
end

exports('toggleWalkstyle', function(bool, message)
    canChange = bool
    if message then
        unable_message = message
    end
end)

exports('getWalkstyle', function()
    return GetResourceKvpString("walkstyle")
end)

exports('setWalkstyle', WalkMenuStart)
