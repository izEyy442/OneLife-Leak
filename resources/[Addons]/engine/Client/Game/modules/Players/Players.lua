---@type GamePlayers
GamePlayers = Class.new(function(class) 

    ---@class GamePlayers: BaseObject
    local self = class

    ---@private
    function self:Constructor()
        Shared:Initialized("Game.Players")
    end

    ---@return table, number
    function self:GetPlayers()
        local players, myPlayer = {}, PlayerId()

        for _, player in ipairs(GetActivePlayers()) do
            local ped = GetPlayerPed(player)
    
            if (DoesEntityExist(ped) and (player ~= myPlayer)) then
                players[#players + 1] = player
            end
        end

        return players, #players
    end

    ---@param maxDistance number
    ---@return table
    function self:GetPlayersInArea(maxDistance)
        local players = self:GetPlayers()
        local myPlayerCoords = Client.Player:GetCoords()
        local inArea = {}

        for i = 1, #players do
            local distance = #(myPlayerCoords - GetEntityCoords(GetPlayerPed(players[i])))
            if (distance <= maxDistance or 10) then
                inArea[#inArea + 1] = players[i]
            end
        end

        return inArea
    end

    ---@return number | nil, number
    function self:GetClosestPlayer()
        local players = self:GetPlayers()
        local myPlayerCoords = Client.Player:GetCoords()
        local closestDistance = -1
        local closestPlayer = -1

        for i = 1, #players do
            local distance = #(myPlayerCoords - GetEntityCoords(GetPlayerPed(players[i])))
            if (closestDistance == -1 or distance < closestDistance) then
                closestPlayer, closestDistance = players[i], distance
            end
        end

        return closestPlayer, closestDistance
    end

    return self
end)