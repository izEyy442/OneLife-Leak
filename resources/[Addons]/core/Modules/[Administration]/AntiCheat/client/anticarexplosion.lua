local _PlayerId = PlayerId
local _PlayerPedId = PlayerPedId
local _IsPedDeadOrDying = IsPedDeadOrDying
local _IsEntityDead = IsEntityDead
local _GetEntityType = GetEntityType
local _SetVehicleFixed = SetVehicleFixed
local _StopEntityFire = StopEntityFire
local _GetVehiclePedIsIn = GetVehiclePedIsIn
local _GetWeaponDamageType = GetWeaponDamageType
local _GetVehicleEngineHealth = GetVehicleEngineHealth
local _GetVehicleBodyHealth = GetVehicleBodyHealth
local _NetworkGetEntityOwner = NetworkGetEntityOwner
local _SetVehicleUndriveable = SetVehicleUndriveable
local _SetVehicleEngineHealth = SetVehicleEngineHealth
local _SetVehicleDeformationFixed = SetVehicleDeformationFixed
local _SetVehicleOnGroundProperly = SetVehicleOnGroundProperly
local _NetworkHasControlOfEntity = NetworkHasControlOfEntity
local _NetworkRequestControlOfEntity = NetworkRequestControlOfEntity
local secuCode = Config["AntiCheat"]["SecuCode"]

Client:SubscribeToGameEvent("CEventNetworkVehicleUndrivable", function(data)
    local victimEntity, _, weaponHash = table.unpack(data)
    local ped = _PlayerPedId()
    local entityOwner = _NetworkGetEntityOwner(victimEntity)
    local isOwner = entityOwner == _PlayerId()
    local explosionHashs = joaat("WEAPON_EXPLOSION")
    local damageType = _GetWeaponDamageType(weaponHash)
    local isEntityAVehicle = _GetEntityType(victimEntity) == 2
    local pedCoords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local victimEntityCoords = GetEntityCoords(victimEntity)
    local victimEntityCoordsHeading = GetEntityHeading(victimEntity)
    local dist = #(pedCoords - victimEntityCoords)
    local triesRequest = 0

    if (isEntityAVehicle and not isOwner and entityOwner == -1 and (weaponHash == 0 or explosionHash == weaponHash or damageType == 5)) then

        while not _NetworkHasControlOfEntity(victimEntity) and triesRequest < 500 do
            triesRequest = triesRequest + 1
            _NetworkRequestControlOfEntity(victimEntity)

            if (triesRequest == 500 and not _NetworkHasControlOfEntity(victimEntity)) then
                Shared.Log:Warn("^7[^1BETA^7] ^7[^4Anti Grief^7] Cannot get control of entity. Aborting...")
                break
            end

            Wait(0)
        end

    end

    if (isEntityAVehicle and isOwner and (weaponHash == 0 or explosionHash == weaponHash or damageType == 5)) then

        Shared.Log:Warn("^7[^1BETA^7] ^7[^4Anti Grief^7] ^3Vehicle damaged by explosion, trying to fix it...")
        Shared.Events:ToServer("core:explosion:sendLogs", secuCode, damageType)

        local isInVehicle = _GetVehiclePedIsIn(ped, false) == victimEntity

        local tries = {}
        tries["health"] = 0

        CreateThread(function()
            while tries["health"] < 500 and DoesEntityExist(victimEntity) do

                tries["health"] = tries["health"] + 1
                _StopEntityFire(victimEntity)

                for i = 1, GetVehicleNumberOfWheels(victimEntity) do
                    SetVehicleTyreFixed(victimEntity, i)
                end
                
                _SetVehicleUndriveable(victimEntity, false)
                _SetVehicleEngineHealth(victimEntity,1000.0) 
                _SetVehicleDeformationFixed(victimEntity)
                _SetVehicleFixed(victimEntity)
                SetEntityCoords(victimEntity, victimEntityCoords.x, victimEntityCoords.y, victimEntityCoords.z)
                SetEntityHeading(victimEntity, victimEntityCoordsHeading)
                _SetVehicleOnGroundProperly(victimEntity)

                if (tries["health"] == 500) then
                    break
                end

                Wait(0)
                
            end

        end)

    end

end)

