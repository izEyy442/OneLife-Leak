-- local StartGift = {}
-- local RewardClaimed = {}

-- local CalenderList = {
--     {day = 1, label = "Aucune Récompense", type = "money", reward = 0}, -- Pas Open
--     {day = 2, label = "Aucune Récompense", type = "money", reward = 0}, -- Pas Open
--     {day = 3, label = "Aucune Récompense", type = "money", reward = 0}, -- Pas Open
--     {day = 4, label = "Aucune Récompense", type = "money", reward = 0}, -- Pas Open
--     {day = 5, label = "Aucune Récompense", type = "money", reward = 0}, -- Pas Open
--     {day = 6, label = "Aucune Récompense", type = "money", reward = 0}, -- Pas Open
--     {day = 7, label = "Aucune Récompense", type = "money", reward = 0}, -- Pas Open
--     {day = 8, label = "Aucune Récompense", type = "money", reward = 0}, -- Pas Open
--     {day = 9, label = "Aucune Récompense", type = "money", reward = 0}, -- Pas Open
--     {day = 10, label = "Aucune Récompense", type = "money", reward = 0}, -- Pas Open
--     {day = 11, label = "Aucune Récompense", type = "money", reward = 0}, -- Pas Open
--     {day = 12, label = "Aucune Récompense", type = "money", reward = 0}, -- Pas Open

--     {day = 13, label = "1000$", type = "money", reward = 1000},
--     {day = 14, label = "Chocolat", type = "item", reward = "chocolat", count = 1},
--     {day = 15, label = "350$", type = "money", reward = 350},
--     {day = 16, label = "250 Coins", type = "coins", reward = 250},
--     {day = 17, label = "Chocolat", type = "item", reward = "chocolat", count = 1},
--     {day = 18, label = "Asea Enneigé", type = "vehicle", reward = "asea2"},
--     {day = 19, label = "Kevlar", type = "item", reward = "kevlar", count = 2},
--     {day = 20, label = "250 Coins", type = "coins", reward = 250},
--     {day = 21, label = "750$", type = "money", reward = 750},
--     {day = 22, label = "Mesa Enneigé", type = "vehicle", reward = "mesa2"},
--     {day = 23, label = "Chocolat", type = "item", reward = "kevlar", count = 1},
--     {day = 24, label = "Kevlar", type = "item", reward = "kevlar", count = 2},
--     {day = 25, label = "500 Coins", type = "coins", reward = 500},

--     {day = 26, label = "Aucune Récompense", type = "money", reward = 0}, -- Plus Noel chef
--     {day = 27, label = "Aucune Récompense", type = "money", reward = 0}, -- Plus Noel chef
--     {day = 28, label = "Aucune Récompense", type = "money", reward = 0}, -- Plus Noel chef
--     {day = 29, label = "Aucune Récompense", type = "money", reward = 0}, -- Plus Noel chef
--     {day = 30, label = "Aucune Récompense", type = "money", reward = 0}, -- Plus Noel chef
--     {day = 31, label = "Aucune Récompense", type = "money", reward = 0}, -- Plus Noel chef
-- }

-- local function ClaimNoelCashReward(Count)
--     local xPlayer = ESX.GetPlayerFromId(source)
--     if (xPlayer) then
--         xPlayer.addAccountMoney("cash", Count)
--         xPlayer.showNotification(("Vous avez reçu %s$ en cash"):format(Count))
--     end
-- end

-- local function generateNoelUniquePlate(callback)
--     local plate = "NOEL" .. math.random(1000, 9999)
--     MySQL.Async.fetchScalar("SELECT plate FROM owned_vehicles WHERE plate = @plate", {["@plate"] = plate}, function(result)
--         if result then
--             generateUniquePlate(callback)
--         else
--             callback(plate)
--         end
--     end)
-- end

-- local function ClaimNoelVehicleReward(Model, Label)
--     local xPlayer = ESX.GetPlayerFromId(source)
--     generateNoelUniquePlate(function(UniquePlate)
--         MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, type, state, boutique, stored) VALUES (@owner, @plate, @vehicle, @type, @state, @boutique, @stored)', {
--             ["@owner"] = xPlayer.identifier,
--             ["@plate"] = UniquePlate,
--             ["@vehicle"] = json.encode({
--                 model = Model,
--                 plate = UniquePlate,
--             }),
--             ["@state"] = 1,
--             ["@boutique"] = 0,
--             ["@stored"] = 1,
--             ["@type"] = "car",
--         }, function(rowsChanged)
--             if rowsChanged > 0 then
--                 xPlayer.showNotification(("Vous avez recu ~b~%s~s~ dans votre garage avec la plaque suivante [~b~%s~s~]"):format(Label, UniquePlate))
--                 Shared.Log:Success(("Le joueur %s a recupré son cadeau de Noel journalier"):format(xPlayer.getName()))
--             else
--                 StartGift[PlayerId] = nil
--                 RewardClaimed[PlayerId] = nil
--                 Shared.Log:Error(("Le joueur %s a recontré un probleme avec son cadeau de Noel"):format(xPlayer.getName()))
--             end
--         end)
--     end)
-- end

-- local function ClaimNoelItemReward(Count, Label, Reward)
--     local xPlayer = ESX.GetPlayerFromId(source)
--     if (xPlayer) then
--         xPlayer.addInventoryItem(Reward, Count)
--         xPlayer.showNotification(("Vous avez reçu %s %s"):format(Count, Label))
--     end
-- end

-- local function ClaimNoelCoinsReward(Count)
--     local xPlayer = ESX.GetPlayerFromId(source)
--     local PlayerId = xPlayer.identifier
--     if (xPlayer) then
--         MySQL.Async.execute("UPDATE users SET coins = coins + " .. Count .. " WHERE identifier = '" .. xPlayer.identifier .. "'", {},
--         function(rowsChanged)
--             if rowsChanged > 0 then
--                 xPlayer.showNotification(("Vous avez recu %s Coins"):format(Count))
--             else
--                 StartGift[PlayerId] = nil
--                 RewardClaimed[PlayerId] = nil
--                 Shared.Log:Error(("Erreur lors de l'ajouts des (%s) Coins au joueur %s"):format(xPlayer.getName()))
--             end
--         end)
--     end
-- end

-- RegisterNetEvent("iZeyy:Noel:Gift", function()
--     local xPlayer = ESX.GetPlayerFromId(source)
--     local CurrentDay = tonumber(os.date("%d"))
--     local PlayerId = xPlayer.identifier
--     local PlayerPed = GetPlayerPed(xPlayer.source)
--     local PlayerCoords = GetEntityCoords(PlayerPed)
    
--     local Distance = #(PlayerCoords - Config["Calender"]["BlipsPos"])

--     if (Distance < 50) then
--         if StartGift[PlayerId] == nil then
--             for _, reward in ipairs(CalenderList) do
--                 if reward.day == CurrentDay then
--                     TriggerClientEvent("iZeyy:Noel:StartAnim", xPlayer.source, reward.label)
--                     StartGift[PlayerId] = true
--                     return
--                 end
--             end 
--             xPlayer.showNotification("Aucun cadeau n'est à prendre aujourd'hui")
--         else
--             xPlayer.showNotification("Vous avez déjà pris votre cadeau")
--         end
--     else
--         xPlayer.ban(0, "Tentative de cheat detectée iZeyy:Noel:Gift")
--     end
-- end)


-- RegisterNetEvent("iZeyy:Noel:Reward", function()
--     local xPlayer = ESX.GetPlayerFromId(source)
--     local CurrentDay = tonumber(os.date("%d"))
--     local PlayerId = xPlayer.identifier
--     local PlayerPed = GetPlayerPed(xPlayer.source)
--     local PlayerCoords = GetEntityCoords(PlayerPed)

--     local Distance = #(PlayerCoords - Config["Calender"]["BlipsPos"])

--     if (Distance < 250) then
--         for _, reward in ipairs(CalenderList) do
--             if reward.day == CurrentDay then
--                 if RewardClaimed[PlayerId] == nil then
--                     RewardClaimed[PlayerId] = true
--                     if reward.type == "money" then
--                         local Count = reward.reward
--                         ClaimNoelCashReward(Count)
--                     elseif reward.type == "vehicle" then
--                         local Model = reward.reward
--                         local Label = reward.label
--                         ClaimNoelVehicleReward(Model, Label)
--                     elseif reward.type == "item" then
--                         local Count = reward.count
--                         local Label = reward.label
--                         local Reward = reward.reward
--                         ClaimNoelItemReward(Count, Label, Reward)
--                     elseif reward.type == "coins" then
--                         local Count = reward.reward
--                         ClaimNoelCoinsReward(Count)
--                     end
--                     return 
--                 else
--                     xPlayer.showNotification("Vous avez déjà pris votre cadeau")
--                 end
--             end
--         end
--     else
--         xPlayer.ban(0, "Tentative de cheat detectée iZeyy:Noel:Reward #1")
--     end

-- end)

-- ESX.RegisterUsableItem("chocolat", function(source)
--     local xPlayer = ESX.GetPlayerFromId(source)
--     xPlayer.removeInventoryItem('chocolat', 1)
--     TriggerClientEvent('fowlmas:status:add', source, 'hunger', 300000)
--     TriggerClientEvent('esx_basicneeds:onsandwich', source)
--     TriggerClientEvent('esx:showNotification', source, "Vous avez consommé un Chocolat de Noel")
-- end)