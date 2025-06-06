---@overload fun(): NetworkEvents
NetworkEvents = Class.new(function(class)

    ---@class NetworkEvents: BaseObject
    local self = class

    local function encodeEventName(name)
        name = name:lower():gsub('_', '')
        
        local encoded = (name:gsub('.', function(c)
            return Engine["Enums"].ANSI[c] or c
        end))

        return encoded
    end

    ---@private
    function self:Constructor()
        self.rate = {}
        self:RateLoop()
    end

    function self:RateLoop()
        CreateThread(function()
            while true do
                self.rate = {}
                Wait(1000 * 5)
            end
        end)
    end

    ---@param eventName string
    function self:Trigger(eventName, ...)
        local encodedEventName = encodeEventName(eventName)
        TriggerEvent(encodedEventName, ...)
    end

    ---@param eventName string
    function self:Broadcast(eventName, ...)
        local encodedEventName = encodeEventName(eventName)
        TriggerClientEvent(encodedEventName, -1, ...)
    end

    function self:ToServer(eventName, ...)
        local encodedEventName = encodeEventName(eventName)
        TriggerServerEvent(encodedEventName, ...)
    end

    ---@param target xPlayer | number
    ---@param eventName string
    function self:ToClient(target, eventName, ...)
        local _target = type(target) == "table" and target.source or target

        if (type(_target) ~= "number") then
            return Shared.Log:Error(("Shared.Events:ToClient('%s'): Invalid target ('%s'). Aborting..."):format(
                eventName, json.encode(target)
            ))
        end

        local encodedEventName = encodeEventName(eventName)
        TriggerClientEvent(encodedEventName, _target, ...)
    end

    ---Trigger protected event from client
    ---@param eventName string
    function self:Protected(eventName, ...)
        local encodedEventName = encodeEventName(eventName)
        TriggerServerEvent(encodedEventName, ...)
    end

    ---Register an event on the same side
    ---@param eventName string
    ---@param callback fun(...: any)
    function self:On(eventName, callback)
        local encodedEventName = encodeEventName(eventName)

        return AddEventHandler(encodedEventName, function(...)
            callback(...)
        end)
    end

    ---Subscribe an event on the other side
    ---@param eventName string
    function self:SubscribeRemote(eventName)
        local encodedEventName = encodeEventName(eventName)
        RegisterNetEvent(encodedEventName)
    end

    ---UnProtected event
    ---@param eventName string
    ---@param callback fun(xPlayer: xPlayer | number, ...)
    function self:OnNet(eventName, callback)
        local encodedEventName = encodeEventName(eventName)

        RegisterNetEvent(encodedEventName, function(...)
            local src = source

            if (IsDuplicityVersion()) then
                local xPlayer = ESX.GetPlayerFromId(src)

                if (xPlayer) then
                    callback(xPlayer, ...)
                else
                    callback(src, ...)
                end
            else
                callback(...)
            end
        end)
    end

    ---Protected event
    ---@param eventName string
    ---@param callback fun(xPlayer: xPlayer | number, ...)
    function self:OnProtectedNet(eventName, callback)
        if (not IsDuplicityVersion()) then
            return Shared.Log:Error(("Shared.Events:OnProtectedNet('%s'): Protected event can be used only on server side. Aborting..."):format(eventName))
        end

        local encodedEventName = encodeEventName(eventName)
        RegisterNetEvent(encodedEventName, function(...)
            local src = source

            if (not self.rate[src]) then
                self.rate[src] = {}
            end

            self.rate[src][eventName] = ((self.rate[src][eventName] == nil and 1) or self.rate[src][eventName] + 1)

            if (self.rate[src][eventName] >= 10) then
                Shared.Log:Info(("Player spamming event (playerId: %s, event: %s)"):format(src, eventName))

                if (self.rate[src][eventName] >= 15) then
                    DropPlayer(src, ("Erreur lors d'une execution (%s)."):format(eventName))
                end

                CancelEvent()
                return
            end
            
            local xPlayer = ESX.GetPlayerFromId(src)

            if (xPlayer) then
                callback(xPlayer, ...)
            else
                callback(src, ...)
            end
        end)
    end

    return self
end)
