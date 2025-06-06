---@type LocalPlayer
LocalPlayer = Class.new(function(class)

    ---@class LocalPlayer: BaseObject
    local self = class

    ---@param playerData Player
    function self:Constructor(playerData)
        self.loaded                 = false
        self.uniqueID               = playerData.character_id
        self.identifier             = playerData.identifier
        self.inventory              = exports["core_nui"]:getInventoryItems()
        self.job                    = playerData.job
        self.job2                   = playerData.job2
        self.maxWeight              = playerData.maxWeight
        self.lastPosition           = playerData.lastPosition
        self.accounts               = playerData.accounts
        self.weaponsList            = playerData.loadout
        self.dead                   = playerData.isDead
        self.name                   = playerData.name
        self.firstName              = playerData.firstName
        self.lastName               = playerData.lastName
        self.money                  = playerData.money.money or 0
        self.dirty                  = playerData.dirty.money or 0
        self.bank                   = playerData.bank.money or 0
        self.ammo                   = playerData.ammo
        self.vip                    = playerData.vip
        self.weaponLicense          = playerData.weaponLicense
        self.weight                 = playerData.weight
        self.busy                   = false
        self.menuAccess             = true
        local cache                 = GetResourceKvpString("engine:player")
        self.data                   = cache and json.decode(cache) or {}
        self.deathHandler           = PlayerDeath()

        SetTimeout(1000, function()
            Shared.Events:Trigger(Engine["Enums"].Player.Events.updateZonesAndBlips)
        end)
        
        -- self:UpdateWeight()

        Shared:Initialized("LocalPlayer")
    end

    ---@param skin string
    ---@param callback function
    function self:LoadSkin(skin, callback)
        local characterModel = skin ~= "default" and GetHashKey(skin) or GetHashKey("mp_m_freemode_01")

        if (skin == "default") then
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                local Male = skin.sex == 0
                TriggerEvent('skinchanger:loadDefaultModel', Male, function()
                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                        TriggerEvent('skinchanger:loadSkin', skin)
                        TriggerEvent('esx:restoreLoadout')
                    end)
                end)
            end)
        else
            RequestModel(characterModel)
            CreateThread(function()
                while not HasModelLoaded(characterModel) do
                    RequestModel(characterModel)
                    Wait(0)
                end

                if IsModelInCdimage(characterModel) and IsModelValid(characterModel) then
                    SetPlayerModel(PlayerId(), characterModel)
                    SetPedDefaultComponentVariation(PlayerPedId())
                end

                SetModelAsNoLongerNeeded(characterModel)

                if (callback) then callback() end
            end)
        end
    end

    ---@param bool boolean
    function self:SetPVPEnabled(bool)
        NetworkSetFriendlyFireOption(bool)
    end

    ---@return number
    function self:GetId()
        return PlayerId()
    end

    ---@return number
    function self:GetUniqueID()
        return self.uniqueID
    end

    ---@return number
    function self:GetServerId()
        return GetPlayerServerId(self:GetId())
    end

    ---@return number
    function self:GetPed()
        return PlayerPedId()
    end

    ---@return string
    function self:GetIdentifier()
        return self.identifier
    end

    ---@return boolean
    function self:IsVIP()
        return exports["core"]:isPlayerVip()
    end

    ---@return string
    function self:GetFirstName()
        return self.firstName
    end

    ---@return string
    function self:GetLastName()
        return self.lastName
    end

    ---@return boolean
    function self:IsNewPlayer()
        if (self.firstName == "" and self.lastName == "") then
            return true
        end

        return false
    end

    ---@return boolean
    function self:GetWeaponLicense()
        return self.weaponLicense
    end

    ---@param bool boolean
    function self:SetWeaponLicense(bool)
        self.weaponLicense = bool
    end

    ---@return string
    function self:GetName()
        return self.name
    end

    ---@return table
    function self:GetInventory()
        local inventory = exports["inventory"]:GetInventoryItems()
        local filtred = {}
        
        for k, v in pairs(inventory) do
            local itemName = v.name

            if (itemName:sub(1, 7) ~= "weapon_" and itemName:sub(1, 4) ~= "cash" and itemName:sub(1, 9) ~= "dirtycash") then
                table.insert(filtred, v)
            end
        end

        return filtred
    end

    ---@return boolean
    function self:IsInventoryEmpty()
        if (self.inventory ~= nil and next(self.inventory)) then
            return false
        end

        return true
    end

    ---@param itemName string
    ---@return table
    function self:GetInventoryItem(itemName)
        local player_inventory = self:GetInventory()

        if (player_inventory == nil) then
            return
        end

        for i = 1, #player_inventory do
            local item_selected = player_inventory[i]

            if (item_selected ~= nil and item_selected.name == itemName and item_selected.count > 0) then
                return item_selected, i
            end
        end

        return false
    end

    --- UPDATE PLAYER INVENTORY WEIGHT
    ---@return number
    function self:UpdateWeight()
        local player_inventory = self:GetInventory()

        if (player_inventory == nil) then
            return
        end

        self.weight = 0

        for i = 1, #player_inventory do
            local item_selected = player_inventory[i]

            if (item_selected ~= nil and item_selected.count > 0) then
                self.weight = self.weight + (item_selected.weight * item_selected.count)
            end
        end

        return self.weight
    end

    ---@return number
    function self:GetWeight()
        return exports["inventory"]:GetWeight()
    end

    ---@param item table
    function self:AddInventoryItem(item)
        table.insert(self.inventory, item)
        self:UpdateWeight()
    end

    ---@param item table
    function self:RemoveInventoryItem(item)
        if (type(item) ~= "table") then
            return
        end

        local item_selected, item_index = self:GetInventoryItem(item.name)
        if (item_selected == nil or item_index == nil) then
            return
        end

        self.inventory[item_index] = nil
        self:UpdateWeight()
    end

    ---@param itemName string
    ---@param amount number
    function self:UpdateItemAmount(itemName, newAmount)
        newAmount = tonumber(newAmount)

        local item_selected, item_index = self:GetInventoryItem(itemName)
        if (type(newAmount) ~= "number" or item_selected == nil or item_index == nil) then
            return
        end

        if (newAmount > 0) then
            self.inventory[item_index].count = newAmount
        else
            self:RemoveInventoryItem({
                name = itemName
            })
        end

        self:UpdateWeight()
    end

    ---@return table
    function self:GetWeaponList()
        local inventory = exports["inventory"]:GetInventoryItems()
        local filtred = {}
        
        for k, v in pairs(inventory) do
            local itemName = v.name

            if (itemName:sub(1, 7) == "weapon_" and itemName:sub(1, 4) ~= "cash" and itemName:sub(1, 9) ~= "dirtycash") then
                table.insert(filtred, v)
            end
        end

        return filtred
    end

    ---@param weaponName string
    ---@return boolean
    function self:HasWeapon(weaponName)
        for i = 1, #self.weaponsList do
            if (self.weaponsList[i].name == weaponName) then
                return true
            end
        end

        return false
    end

    ---@param weaponName string
    ---@return table
    function self:GetWeapon(weaponName)
        for i = 1, #self.weaponsList do
            if (self.weaponsList[i].name == weaponName) then
                return self.weaponsList[i]
            end
        end

        return false
    end

    ---@param weaponName string
    ---@param ammo number
    function self:UpdateAmmo(weaponName, ammo)
        local weaponType = Shared:GetWeaponType(weaponName)

        if (weaponType) then
            self.ammo[weaponType] = ammo or 0
        end
    end

    ---@param weaponType string
    ---@return number
    function self:GetAmmoForWeaponType(weaponType)
        return weaponType and self.ammo[weaponType] or 0
    end

    ---@param weaponName string
    ---@param ammo number
    function self:AddWeapon(weaponName, ammo)
        local hasWeapon = self:HasWeapon(weaponName)

        self:UpdateAmmo(weaponName, ammo)

        if (not hasWeapon) then
            local weaponLabel = ESX.GetWeaponLabel(weaponName)

            self.weaponsList[#self.weaponsList + 1] = {
                name = weaponName,
                label = weaponLabel,
                components = {}
            }
        end
    end

    ---@param weaponName string
    ---@param ammo number
    function self:RemoveWeapon(weaponName, ammo)
        self:UpdateAmmo(weaponName, ammo)

        for i = 1, #self.weaponsList do
            if (self.weaponsList[i].name == weaponName) then
                table.remove(self.weaponsList, i)
                break
            end
        end
    end

    ---@param weaponGroup WeaponsGroup
    ---@return boolean
    function self:HasWeaponOfGroup(weaponGroup)
        local weapons = self:GetWeaponList()
        local ped = self:GetPed()

        for i = 1, #weapons do
            local hash = GetHashKey(weapons[i].name)
            local group = GetWeapontypeGroup(hash)

            if (group == weaponGroup) then
                if (HasPedGotWeapon(ped, hash, false)) then
                    return true
                end
            end
        end

        return false
    end

    ---@param weaponType WeaponsGroup
    ---@return number, table | nil
    function self:GetWeaponsOfType(weaponType)
        local weaponsList = self:GetWeaponList()
        local count = 0
        local weapons = {}
        local weaponGroup = weaponType

        for i = 1, #weaponsList do
            local otherWeapon = weaponsList[i]
            local otherHash = GetHashKey(otherWeapon.name)
            local otherWeaponGroup = GetWeapontypeGroup(otherHash)

            if (otherWeaponGroup == weaponGroup) then
                count = count + 1
                weapons[otherWeapon.name] = otherWeapon
            end
        end

        return count, weapons
    end

    ---@param weaponName string
    ---@param ammo number
    function self:SetWeaponAmmo(weaponName, ammo)
        self:UpdateAmmo(weaponName, ammo)
    end

    ---@param weaponName string
    ---@param component string
    function self:HasWeaponComponent(weaponName, component)
        local weapon = self:GetWeapon(weaponName)

        if (weapon) then
            for i = 1, #weapon.components do
                if (weapon.components[i] == component) then
                    return true
                end
            end
        end

        return false
    end

    ---@param weaponName string
    ---@param component string
    ---@return boolean
    function self:GetWeaponComponent(weaponName, component)
        local weapon = self:GetWeapon(weaponName)

        if (weapon) then
            for i = 1, #weapon.components do
                if (weapon.components[i] == component) then
                    return ESX.GetWeaponComponent(weaponName, component)
                end
            end
        end

        return false
    end

    ---@param weaponName string
    ---@param component string
    function self:AddWeaponComponent(weaponName, component)
        for i = 1, #self.weaponsList do
            if (self.weaponsList[i].name == weaponName) then
                self.weaponsList[i].components[#self.weaponsList[i].components + 1] = component
                break
            end
        end

    end

    ---@param weaponName string
    ---@param component string
    function self:RemoveWeaponComponent(weaponName, component)
        for i = 1, #self.weaponsList do
            if (self.weaponsList[i].name == weaponName) then
                for j = 1, #self.weaponsList[i].components do
                    if (self.weaponsList[i].components[j] == component) then
                        table.remove(self.weaponsList[i].components, j)
                        break
                    end
                end

                break
            end
        end
    end

    ---@return table
    function self:GetJob()
        return self.job
    end

    ---@param job table
    function self:SetJob(job)
        self.job = job
    end

    ---@param jobName string
    ---@return boolean
    function self:HasJob(jobName)
        if (self.job.name == jobName) then
            return true
        end

        return false
    end

    ---@return table
    function self:GetJob2()
        return self.job2
    end

    ---@param job2 table
    function self:SetJob2(job2)
        self.job2 = job2
    end

    ---@param job2Name string
    ---@return boolean
    function self:HasJob2(job2Name)
        if (self.job2.name == job2Name) then
            return true
        end

        return false
    end

    ---@return table
    function self:GetAccounts()
        return self.accounts
    end

    ---@param accountName string
    ---@return boolean
    function self:HasAccount(accountName)
        for i = 1, #self.accounts do
            if (self.accounts[i].name == accountName) then
                return true
            end
        end

        return false
    end

    ---@param accountName string
    ---@return table | boolean
    function self:GetAccount(accountName)
        for i = 1, #self.accounts do
            if (self.accounts[i].name == accountName) then
                return self.accounts[i]
            end
        end

        return false
    end

    ---@return number
    function self:GetMoney()
        return self.money or 0
    end

    ---@return number
    function self:GetBank()
        return self.bank or 0
    end

    ---@return number
    function self:GetDirtyMoney()
        return self.dirty or 0
    end

    function self:SetAccount(account)
        if (account) then
            if (account.name == "cash") then
                self.money = account.money or 0
            elseif (account.name == "bank") then
                self.bank = account.money or 0
            elseif (account.name == "dirtycash") then
                self.dirty = account.money or 0
            end
        end
    end

    ---@param weight number
    function self:SetMaxWeight(weight)
        self.maxWeight = weight
    end

    ---@return number
    function self:GetMaxWeight()
        return self.maxWeight
    end

    ---@return vector3
    function self:GetCoords()
        return GetEntityCoords(self:GetPed())
    end

    ---@return number
    function self:GetHeading()
        return GetEntityHeading(self:GetPed())
    end

    function self:IsInSafeZone()
        return exports["core"]:PlayerIsInSafeZone()
    end

    function self:IsHandcuffed()
        return exports["core"]:isPlayerHandcuff()
    end

    function self:IsInCarry()
        return exports["epicenter"]:IsInPorter()
    end

    function self:IsHostage()
        return exports["epicenter"]:IsInOtage()
    end

    ---@param x number
    ---@param y number
    ---@param z number
    ---@param heading? number
    function self:SetCoords(x, y, z, heading)
        SetEntityCoords(self:GetPed(), x, y, z)
        if (heading) then
            self:SetHeading(heading)
        end
    end

    ---@param heading number
    function self:SetHeading(heading)
        SetEntityHeading(self:GetPed(), heading)
    end

    ---@return number
    function self:GetVehicle()
        if (GetVehiclePedIsIn(self:GetPed(), false) == 0) then
            return nil
        end

        return GetVehiclePedIsIn(self:GetPed(), false)
    end

    ---Teleport The player to the specified coords
    ---@param x number
    ---@param y number
    ---@param z number
    ---@param heading number
    function self:Teleport(x, y, z, heading)
        CreateThread(function()
            DoScreenFadeOut(700)
            Wait(700)
            self:SetCoords(x, y, z)
            if heading then
                SetEntityHeading(self:GetPed(), heading)
            end
            Wait(1200)
            DoScreenFadeIn(700)
        end)
    end

    function self:GetLastPosition()
        return self.lastPosition
    end

    ---@param bool boolean
    function self:FreezePosition(bool)
        return FreezeEntityPosition(self:GetPed(), bool or false)
    end

    ---@param immediatly boolean
    ---@return void
    function self:ClearTasks(immediatly)
        if (immediatly) then
            return ClearPedTasksImmediately(self:GetPed())
        else
            return ClearPedTasks(self:GetPed())
        end
    end

    function self:ClearAreaOfObjects(area)
        ClearAreaOfObjects(GetEntityCoords(self:GetPed()), area, 0)
    end

    ---Clear the player ped tasks
    function self:ClearAllTasks()
        return ClearPedTasksImmediately(self:GetPed())
    end

    ---@param clear boolean
    function self:EditWantedLevel(clear)
        if (clear) then
            return ClearPlayerWantedLevel(self:GetId())
        else
            return SetPlayerWantedLevel(self:GetId(), 0, false)
        end
    end

    ---@param maxWantedLevel number Max is 5
    function self:SetMaxWantedLevel(maxWantedLevel)
        return SetMaxWantedLevel(maxWantedLevel or 5)
    end

    ---@param seat number
    ---@return boolean
    function self:IsInVehicle(seat)
        return self:GetVehicle() and GetPedInVehicleSeat(self:GetVehicle(), seat) == self:GetPed() --IsPedInAnyVehicle(self.getPed(), seat)
    end

    function self:IsInAnyVehicle()
        return IsPedInAnyVehicle(self.GetPed(), false)
    end

    ---@return boolean
    function self:IsDead()
        return self.dead
    end

    ---@param dead boolean
    function self:SetDead(dead)
        self.dead = dead
    end

    ---@param busy boolean
    function self:SetBusy(busy)
        self.busy = busy
    end

    ---@return boolean
    function self:IsBusy()
        return self.busy
    end

    ---@return boolean
    function self:CanOpenMenu()
        return self.menuAccess
    end

    ---@param bool boolean
    function self:SetCanOpenMenu(bool)
        self.menuAccess = bool
    end

    ---@param key string
    ---@return number
    function self:GetData(key)
        return self.data[key]
    end

    ---@param key string
    ---@param value any
    function self:SetData(key, value)
        self.data[key] = value
        SetResourceKvp("engine:player", json.encode(self.data))
    end

    return self
end)