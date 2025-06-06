-- drugs = {}

-- local cooldownPerPlayer = {}

-- local function isOnCooldown(source)
--     return cooldownPerPlayer[source]
-- end

-- local function getDrugInfos(drugID)
--     return drugs[drugID]
-- end

-- local function onInteract(source)
--     cooldownPerPlayer[source] = true
--     Citizen.SetTimeout(Config.DrugConfig.delayBetweenActions, function() cooldownPerPlayer[source] = false end)
-- end

-- local actions = {
--     ["Harvest"] = function(source, drug, xPlayer)
--         local harvestItem = drug.rawItem
--         xPlayer.addInventoryItem(harvestItem, 1)
--     end,

--     ["Transform"] = function(source, drug, xPlayer)
--         local requieredItem = drug.rawItem
--         local requieredCount = tonumber(drug.treatmentCount)
--         local rewardItem = drug.treatedItem
--         local rewardCount = tonumber(drug.treatmentReward)
--         local actualCount = xPlayer.getInventoryItem(requieredItem)

--         if not actualCount then
--             TriggerClientEvent("esx:showNotification", source, "~s~Vous n'avez pas assez pour faire la transformation !")
--             return
--         end

--         if actualCount then
--             if actualCount.quantity < requieredCount then
--                 -- TriggerClientEvent("esx:showNotification", source, (Config.DrugConfig.messages.transform.onNoEnough):format(xPlayer.getInventoryItem(requieredItem).label, requieredCount - actualCount, xPlayer.getInventoryItem(requieredItem).label))
--                 return
--             end
--         end

--         xPlayer.removeInventoryItem(requieredItem, requieredCount)
--         xPlayer.addInventoryItem(rewardItem, rewardCount)
--         --TriggerClientEvent("esx:showNotification", source, (Config.DrugConfig.messages.transform.onDone):format(requieredCount, xPlayer.getInventoryItem(requieredItem).label, rewardCount, xPlayer.getInventoryItem(rewardItem).label))
--     end,

--     ["Sell"] = function(source, drug, xPlayer)
--         local requieredCount = tonumber(drug.sellCount)
--         local requieredItem = drug.treatedItem
--         local reward = tonumber(drug.sellRewardPerCount)
--         local sale = tonumber(drug.sale)

--         local actualCount = xPlayer.getInventoryItem(requieredItem)

--         if not actualCount then
--             local actualCount = 0
--             -- TriggerClientEvent("esx:showNotification", source, (Config.DrugConfig.messages.sell.onNoEnough):format(requieredItem, requieredCount - actualCount, requieredItem))
--             return
--         end

--         if actualCount then
--             if actualCount.quantity < requieredCount then
--                 -- TriggerClientEvent("esx:showNotification", source, (Config.DrugConfig.messages.sell.onNoEnough):format(requieredItem, requieredCount - actualCount.count, requieredItem))
--                 return
--             end
--         end
        
--         xPlayer.removeInventoryItem(requieredItem, requieredCount)
--         if sale == 0 then
--             xPlayer.addAccountMoney("cash", reward);
--         elseif sale == 1 then
--             local multiplier = 1 * reward;
--             if (
--                 not xPlayer.job2.name == "yakuza" 
--                 or not xPlayer.job2.name == "madrazo" 
--                 or not xPlayer.job2.name == "marabunta" 
--                 or not xPlayer.job2.name == "mafiamarocaine"
--                 or not xPlayer.job2.name == "bloods"
--                 or not xPlayer.job2.name == "families"
--             ) 
--             then
--                 xPlayer.addAccountMoney("dirtycash", reward);
--             else
--                 multiplier = 2.0 * reward;
--                 xPlayer.addAccountMoney("dirtycash", reward);
--             end
--         else
--             xPlayer.addMoney(reward)
--         end

--         --TriggerClientEvent("esx:showNotification", source, (Config.DrugConfig.messages.sell.onDone):format(requieredCount, xPlayer.getInventoryItem(requieredItem).label, reward))
--     end
-- }

-- for k,execute in pairs(actions) do
--     RegisterNetEvent("exedrugs_on"..k, function(drugID)
--         local src = source;
        
--         if isOnCooldown(src) then return end

--         local xPlayer = ESX.GetPlayerFromId(src);
--         execute(src, getDrugInfos(drugID), xPlayer);
--         onInteract(src);
--     end)
-- end

-- local function updateDrugs()
--     drugs = {}
--     MySQL.Async.fetchAll("SELECT * FROM drugss", {}, function(result)
--         for k,v in pairs(result) do
--             drugs[v.id] = json.decode(v.drugsInfos)
--         end
--         TriggerClientEvent("exedrugs_updateDrugs", -1, drugs)
--     end)

-- end

-- local function getLicense(source) 
--     for k,v in pairs(GetPlayerIdentifiers(source))do      
--         if string.sub(v, 1, string.len("license:")) == "license:" then
--             return v
--         end
--     end
--     return ""
-- end


-- RegisterCommand("drugsbuilder", function(source)
--     if source == 0 then return end
    
--     local xPlayer = ESX.GetPlayerFromId(source)

--     local license = xPlayer.identifier

--     if not Config.DrugConfig.allowedLicense[license] then
--         print("^1[DrugsBuilder] ^7Player ^2".. GetPlayerName(source) .. "^7 aptempt to use drugsbuilder.") 
--         return
--     end

--     TriggerClientEvent("exedrugs_openMenu", source, drugs)
-- end, false)

-- RegisterNetEvent("exedrugs_deletedrug")
-- AddEventHandler("exedrugs_deletedrug", function(drugID)
--     local source = source
--     local license = getLicense(source)
--     if not Config.DrugConfig.allowedLicense[license] then
--         -- print("^1[DrugsBuilder] ^7Une personne a tenté de supprimer une drogue sans autorisation : ^1"..GetPlayerName(source).." ^7/ ^1"..license.."^7")
--         return
--     end
--     if not drugs[drugID] then
--         TriggerClientEvent("esx:showNotification", source, "~s~Cette drogue n'existe plus")
--         return
--     end
--     MySQL.Async.execute("DELETE FROM drugss WHERE id = @a", {['a'] = drugID}, function(rslt)
--         updateDrugs()
--         TriggerClientEvent("esx:showNotification", source, "~s~Drogue supprimée avec succès")
--     end)
-- end)

-- RegisterNetEvent("exedrugs_create")
-- AddEventHandler("exedrugs_create", function(builderInfos)
--     local source = source
--     local license = getLicense(source)
--     if not Config.DrugConfig.allowedLicense[license] then
--         -- print("^1[DrugsBuilder] ^7Une personne a tenté de créer une drogue sans autorisation : ^1"..GetPlayerName(source).." ^7/ ^1"..license.."^7")
--         return
--     end

--     local itemsAreValid = false
--     local serverItems = {}
    
--     MySQL.Async.fetchAll("SELECT * FROM items", {}, function(items)
--         for k,v in pairs(items) do
--             serverItems[v.name] = true
--         end
--         -- if not serverItems[builderInfos.rawItem] or not serverItems[builderInfos.treatedItem] then
--         --     TriggerClientEvent("esx:showNotification", source, "~s~Un des item du drugsbuilder est invalide, création abandonnée")
--         --     return
--         -- end
--         MySQL.Async.execute("INSERT INTO drugss (createdBy, createdAt, label, drugsInfos) VALUES (@a,@b,@c,@d)", {
--             ["a"] = "none",
--             ["b"] = "none",
--             ["c"] = builderInfos.name,
--             ["d"] = json.encode(builderInfos)
--         }, function()
--             updateDrugs()
--             TriggerClientEvent("esx:showNotification", source, "~s~Drogue ajoutée avec succès")
--         end)
--     end)
-- end)

-- RegisterNetEvent("exedrugs_requestDrugs")
-- AddEventHandler("exedrugs_requestDrugs", function()
--     local source = source
--     TriggerClientEvent("exedrugs_updateDrugs", source, drugs)
-- end)

-- Citizen.CreateThread(function()
--     updateDrugs()
-- end)