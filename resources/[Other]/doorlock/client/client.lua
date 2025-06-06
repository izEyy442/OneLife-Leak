local _CreateThread, _Wait, SendNUIMessage = CreateThread, Wait, SendNUIMessage
local showedEntity = nil
local _enabledDoors, _doorState = {}, {}
local DrawTxt = DrawTxt
local pulsed = false
local nearId = ""
local _coordsToShow = nil
local text = ""

-- Configuration vars

TriggerEvent("chat:addSuggestion", "/createdoor", ("Doors builder"), {})

ESX = nil 

Citizen.CreateThread(function() 
    while ESX == nil do 
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
        Citizen.Wait(0) 
    end 
end)

local function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    blockinput = true
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Wait(0)
    end 
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        blockinput = false
        return result
    else
        Wait(500)
        blockinput = false
        return nil
    end
end

function DrawText3D(x, y, z, text, scale)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())

	SetTextScale(scale, scale)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextColour(255, 255, 255, 215)

	AddTextComponentString(text)
	DrawText(_x, _y)

end


local _doorType, _distToDoor, allowedJobs, doorPin, item = "normal", 2, {}, "", ""


_CreateThread(function()
    _Wait(500)
    ESX['TriggerServerCallback']('guille_doorlock:cb:getDoors', function(doors, state)
        _enabledDoors = doors
        _doorState = state
    end)
end)

local Action = {
    Door = {'Double','Normal','Glissante'}, Liste = 1,
}

function OpenDoorlock()
	local door_main = RageUI.CreateMenu("Doors", "Lock")

        RageUI.Visible(door_main, not RageUI.Visible(door_main))
            while door_main do
            Citizen.Wait(0)
            RageUI.IsVisible(door_main, true, true, true, function()

                RageUI.List("Type de porte : ", Action.Door, Action.Liste, nil, {}, true, function(Hovered, Active, Selected, Index)
                    if (Selected) then 
                        if Index == 1 then
                            _doorType = "double"
                            RageUI.CloseAll()
                            ExecuteCommand("createdoor")
                            ESX['ShowNotification']('~s~Double porte')
                        elseif Index == 2 then
                            _doorType = "normal"
                            RageUI.CloseAll()
                            ExecuteCommand("createdoor")
                            ESX['ShowNotification']('~s~Simple porte')
                        elseif Index == 3 then
                            _doorType = "slider"
                            RageUI.CloseAll()
                            ExecuteCommand("createdoor")
                            ESX['ShowNotification']('~s~Porte glissante')
                            end
                        end
                    Action.Liste = Index;              
                end)

                RageUI.ButtonWithStyle("Distance d'ouverture :", nil, {RightLabel = _distToDoor}, true, function(Hovered, Active, Selected)
                    if Selected then
                        -- Utilisation de lib.inputDialog pour demander la distance
                        local success, input = pcall(function()
                            return lib.inputDialog("Distance d'ouverture", {
                                {type = "number", label = "Distance entre 1 et 15"}
                            })
                        end)
                
                        -- Vérification si le dialogue a été ouvert avec succès
                        if not success then
                            -- print("Erreur lors de l'ouverture du dialogue : " .. tostring(input))
                            return
                        elseif input == nil or input[1] == nil then
                            ESX.ShowNotification("Erreur : Le dialogue a été annulé")
                            return
                        end
                
                        local dist = tonumber(input[1]) -- Convertir l'entrée en nombre
                
                        -- Vérification de la validité de la distance
                        if dist and dist >= 1 and dist <= 15 then
                            _distToDoor = dist
                            RageUI.CloseAll()
                            ExecuteCommand("createdoor")
                        else
                            ESX.ShowNotification("Distance invalide. Veuillez entrer un nombre entre 1 et 15.")
                        end
                    end
                end)
                

                RageUI.ButtonWithStyle("Job autorisée :", nil, {RightLabel = Job}, true, function(Hovered, Active, Selected)
                    if Selected then 
                        -- Utilisation de lib.inputDialog pour demander le nom du job
                        local success, input = pcall(function()
                            return lib.inputDialog("Job autorisée", {
                                {type = "input", label = "Nom du job"}
                            })
                        end)
                
                        -- Vérification si le dialogue a été ouvert avec succès
                        if not success then
                            -- print("Erreur lors de l'ouverture du dialogue : " .. tostring(input))
                            return
                        elseif input == nil or input[1] == nil or input[1] == "" then
                            ESX.ShowNotification("Erreur : Le dialogue a été annulé ou le champ est vide")
                            return
                        end
                
                        Job = input[1] -- Récupérer le nom du job
                
                        -- Ajout du job à la liste des jobs autorisés
                        table.insert(allowedJobs, Job)
                        RageUI.CloseAll()
                        ExecuteCommand("createdoor")
                    end
                end)                

                RageUI.ButtonWithStyle("~s~Confirmer la création", nil, {RightLabel = "→→→"}, true, function(Hovered, Active, Selected)
                    if Selected then 
                        addDoor(_doorType, _distToDoor, allowedJobs, doorPin, item)
                        RageUI.CloseAll()
                        _doorType = "normal"
                        _distToDoor = 2
                        doorPin = ""
                        allowedJobs = {}
                        Job = nil
                        pin = nil
                    end
                end)

            end, function()
            end)

            if not RageUI.Visible(door_main) then
            door_main = RMenu:DeleteType("door_main", true)
        end
    end
end

RegisterNetEvent("guille_doorlock:client:setUpDoor", function()
    OpenDoorlock()
end)

RegisterNetEvent("guille_doorlock:client:deleteDoor", function()
    _CreateThread(function()
        while true do
            local _wait = 0
            local _ped = PlayerPedId()
            local _coords = GetEntityCoords(_ped)
            local hit, coords, entity = RayCastGamePlayCamera(5000.0)
            local _found = false

            DrawLine(_coords, coords, 255, 0, 0, 255)
            RageUI.Text({message = "~s~Appuyez sur [E] pour retirer la porte"})
            for k, v in pairs(_enabledDoors) do
                if v['_type'] ~= "double" then
                    local _doorCoords = vector3(v['doorCoords']['x'], v['doorCoords']['y'], v['doorCoords']['z'])
                    DrawMarker(28, _doorCoords, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.18, 0.18, 0.18, 255, 0, 0, 255, false, true, 2, nil, nil, false)
                else
                    local _doorCoords = vector3(v['_textCoords']['x'], v['_textCoords']['y'], v['_textCoords']['z'])
                    DrawMarker(28, _doorCoords, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.18, 0.18, 0.18, 255, 0, 0, 255, false, true, 2, nil, nil, false)
                end
            end
            if IsControlJustPressed(1, 38) then
                for k, v in pairs(_enabledDoors) do
                    if v['_type'] ~= "double" then
                        local _doorCoords = vector3(v['doorCoords']['x'], v['doorCoords']['y'], v['doorCoords']['z'])
                        local _distTo = #(coords - _doorCoords)
                        if _distTo < 1 then
                            TriggerServerEvent("guille_doorlock:server:syncRemove", k)
                            _found = true
                        end
                    else
                        local _doorCoords = vector3(v['_textCoords']['x'], v['_textCoords']['y'], v['_textCoords']['z'])
                        local _distTo = #(coords - _doorCoords)
                        if _distTo < 1 then
                            TriggerServerEvent("guille_doorlock:server:syncRemove", k)
                            _found = true
                        end
                    end
                end
                if _found then
                    RageUI.Text({message = "<C>~s~La porte a été supprimer"})
                    break
                else
                    RageUI.Text({message = "<C>~s~La porte existe pas"})
                end
            end
            _Wait(_wait)
        end
    end)
end)

RegisterNetEvent("guille_doorlock:client:removeGlobDoor", function(id)
    table['remove'](_enabledDoors, id)
end)

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        SetEntityDrawOutline(showedEntity, false)
    end
end)

addDoor = function(type, dist, jobs, pin, item)
    dist = tonumber(dist)
    if not dist then
        dist = 2
    end
    if type ~= "double" then 
        _CreateThread(function()
            while true do
                local _wait = 0
                local _ped = PlayerPedId()
                local _coords = GetEntityCoords(_ped)
                local hit, coords, entity = RayCastGamePlayCamera(5000.0)   
                if IsEntityAnObject(entity) then
                    RageUI.Text({message = "Appuyez sur ~s~[~s~E~s~]~s~ pour ajouter cette porte"})
                    DrawLine(_coords, coords, 0, 255, 34, 255)
                    if showedEntity ~= entity then
                        SetEntityDrawOutline(showedEntity, false)
                        showedEntity = entity
                    end
                    if IsControlJustPressed(1, 38) then
                        local _doorCoords = GetEntityCoords(entity)
                        local _doorModel = GetEntityModel(entity)
                        local _heading = GetEntityHeading(entity)
                        local _textCoords = coords
                        TriggerServerEvent("guille_doorlock:server:addDoor", _doorCoords, _doorModel, _heading, type, _textCoords, dist, jobs, pin, item)
                        SetEntityDrawOutline(entity, false)
                        break
                    end
                    SetEntityDrawOutline(entity, true)
                else
                    if showedEntity ~= entity then
                        SetEntityDrawOutline(showedEntity, false)
                        showedEntity = entity
                    end
                end
                _Wait(_wait)
            end
        end)
    else
        local _doorsDobule, entities = {}, {}
        _CreateThread(function()
            while true do
                local _wait = 0
                local _ped = PlayerPedId()
                local _coords = GetEntityCoords(_ped)
                local hit, coords, entity = RayCastGamePlayCamera(5000.0)   
                if IsEntityAnObject(entity) then
                    for k, v in pairs(entities) do
                        SetEntityDrawOutline(v, true)
                    end
                    if #_doorsDobule ~= 2 then
                        DrawLine(_coords, coords, 0, 255, 34, 255)
                        RageUI.Text({message = "~s~Appuyez sur ~s~[~s~E~s~]~s~ ~s~pour ajouter la porte"})
                    else
                        DrawLine(_coords, coords, 0, 255, 34, 255)
                        RageUI.Text({message = "~s~Appuyez sur ~s~[~s~E~s~]~s~ ~s~pour confirmer"})
                    end
                    showedEntity = entity
                    if IsControlJustPressed(1, 38) then
                        local _doorCoords = GetEntityCoords(entity)
                        local _doorModel = GetEntityModel(entity)
                        local _heading = GetEntityHeading(entity)
                        local _textCoords = coords
                        if #_doorsDobule == 2 then
                            for k, v in pairs(entities) do
                                SetEntityDrawOutline(v, false)
                            end
                            entities = {}
                            TriggerServerEvent("guille_doorlock:server:addDoubleDoor", _doorsDobule, type, _textCoords, dist, jobs, pin)
                            _doorsDobule = {}
                            break
                        else
                            table['insert'](_doorsDobule, {coords = _doorCoords, model = _doorModel, heading = _heading})
                            table['insert'](entities, entity)
                        end
                    end
                end
                _Wait(_wait)
            end
        end)
    end
end

RegisterNetEvent("guille_doorlock:client:refreshDoors", function(tableToIns)
    table['insert'](_enabledDoors, tableToIns)
end)

local _selectedDoorJobs, pin, object = {}, nil, nil

_CreateThread(function()
    while true do
        local isNearToDoor = false
        local _wait = 1000
        for k, v in pairs(_enabledDoors) do
            local _doorHash = GetHashKey(v["_doorModel"])
            local _ped = PlayerPedId()
            local _coords = GetEntityCoords(_ped)
            
            if v['_type'] == "normal" then
                local _doorCoords = vector3(v['doorCoords']['x'], v['doorCoords']['y'], v['doorCoords']['z'])
                local _distTo = #(_coords - _doorCoords)
                if _distTo < 10 then
                    door = GetClosestObjectOfType(v['doorCoords']['x'], v['doorCoords']['y'], v['doorCoords']['z'], 1.0, v["_doorModel"], false, false, false)
                    if _doorState[k] ~= nil then
                        FreezeEntityPosition(door, false)
                    else
                        FreezeEntityPosition(door, true)
                    end
                end

                if _distTo < v['dist'] then
                    _wait = 0

                    door = GetClosestObjectOfType(v['doorCoords']['x'], v['doorCoords']['y'], v['doorCoords']['z'], 1.0, v["_doorModel"], false, false, false)
                    _coordsToShow = vector3(v['_textCoords']['x'], v['_textCoords']['y'], v['_textCoords']['z'])
                    isNearToDoor = true
                    _selectedDoorJobs = v['jobs']

                    if v['usePin'] then
                        pin = v['pin']
                    else
                        pin = nil
                    end

                    if v['useitem'] then
                        object = v['item']
                    else
                        object = nil
                    end

                    if _doorState[k] ~= nil then
                        ESX.Game.Utils.DrawText3D(_coordsToShow, "✅", 0.8)
                        FreezeEntityPosition(door, false)
                        if pulsed then
                            TriggerServerEvent("guille_doorlock:server:updateDoor", k, nil)
                            animatePlyDoor()
                            pulsed = false
                        end
                    else
                        ESX.Game.Utils.DrawText3D(_coordsToShow, "❌", 0.8)
                        FreezeEntityPosition(door, true)
                        if pulsed then
                            
                            TriggerServerEvent("guille_doorlock:server:updateDoor", k, "locked")
                            animatePlyDoor()
                            pulsed = false
                        end
                        if v['_type'] == "normal" then
                            SetEntityHeading(door, v['_heading'])
                        end
                    end
                end
            elseif v['_type'] == "double" then
                local _doorCoords = vector3(v['_doorsDouble'][1]['coords']['x'], v['_doorsDouble'][1]['coords']['y'], v['_doorsDouble'][1]['coords']['z'])
                local _doorCoords2 = vector3(v['_doorsDouble'][2]['coords']['x'], v['_doorsDouble'][2]['coords']['y'], v['_doorsDouble'][2]['coords']['z'])
                local _distTo = #(_coords - vector3(v['_textCoords']['x'], v['_textCoords']['y'], v['_textCoords']['z']))
                if _distTo < 10 then
                    _coordsToShow = vector3(v['_textCoords']['x'], v['_textCoords']['y'], v['_textCoords']['z'])
                    door1 = GetClosestObjectOfType(_doorCoords, 1.0, v['_doorsDouble'][1]['model'], false, false, false)
                    door2 = GetClosestObjectOfType(_doorCoords2, 1.0, v['_doorsDouble'][2]['model'], false, false, false)
                    if _doorState[k] ~= nil then
                        FreezeEntityPosition(door1, false)
                        FreezeEntityPosition(door2, false)
                    else
                        FreezeEntityPosition(door1, true)
                        FreezeEntityPosition(door2, true)
                        SetEntityHeading(door1, v['_doorsDouble'][1]['heading'])
                        SetEntityHeading(door2, v['_doorsDouble'][2]['heading'])
                    end
                    if _distTo < v['dist'] then
                        if v['usePin'] then
                            pin = v['pin']
                        else
                            pin = nil
                        end
                        if v['useitem'] then
                            object = v['item']
                        else
                            object = nil
                        end
                        _selectedDoorJobs = v['jobs']
                        if _doorState[k] ~= nil then
                            isNearToDoor = true
                            ESX.Game.Utils.DrawText3D(_coordsToShow, "✅", 0.8)
                            FreezeEntityPosition(door1, false)
                            FreezeEntityPosition(door2, false)
                            if pulsed then
                                TriggerServerEvent("guille_doorlock:server:updateDoor", k, nil)
                                animatePlyDoor()
                                pulsed = false
                                pin = nil
                            end
                        else
                            isNearToDoor = true
                            FreezeEntityPosition(door1, true)
                            FreezeEntityPosition(door2, true)
                            ESX.Game.Utils.DrawText3D(_coordsToShow, "❌", 0.8)
                            if pulsed then
                                TriggerServerEvent("guille_doorlock:server:updateDoor", k, "locked")
                                animatePlyDoor()
                                pulsed = false
                                pin = nil
                            end
                            SetEntityHeading(door1, v['_doorsDouble'][1]['heading'])
                            SetEntityHeading(door2, v['_doorsDouble'][2]['heading'])
                        end
                        _wait = 0
                    end
                end
            else 
                local _doorCoords = vector3(v['doorCoords']['x'], v['doorCoords']['y'], v['doorCoords']['z'])
                local _distTo = #(_coords - _doorCoords)
                if _distTo < 10 then
                    door = GetClosestObjectOfType(v['doorCoords']['x'], v['doorCoords']['y'], v['doorCoords']['z'], 1.0, v["_doorModel"], false, false, false)
                    if not IsDoorRegisteredWithSystem(v['_doorModel'].. "door"..k) then
                        AddDoorToSystem(v['_doorModel'].. "door"..k, v['_doorModel'], _doorCoords, false, false, false)
                    end
                    if _doorState[k] ~= nil then
                        DoorSystemSetDoorState(v['_doorModel'].. "door"..k, 0, false, false) 
                        DoorSystemSetAutomaticDistance(v['_doorModel'].. "door"..k, 30.0, false, false)
                    else
                        DoorSystemSetAutomaticDistance(v['_doorModel'].. "door"..k, 0.0, false, false)
                        DoorSystemSetDoorState(v['_doorModel'].. "door"..k, 4, false, false)
                    end
                end
                if _distTo < v['dist'] then
                    door = GetClosestObjectOfType(v['doorCoords']['x'], v['doorCoords']['y'], v['doorCoords']['z'], 1.0, v["_doorModel"], false, false, false)
                    _coordsToShow = vector3(v['_textCoords']['x'], v['_textCoords']['y'], v['_textCoords']['z'])
                    isNearToDoor = true
                    _selectedDoorJobs = v['jobs']
                    if v['usePin'] then
                        pin = v['pin']
                    else
                        pin = nil
                    end
                    if v['useitem'] then
                        object = v['item']
                    else
                        object = nil
                    end
                    if _doorState[k] ~= nil then
                        TriggerEvent("ui:showInteraction", "E", "INTERAGIR POUR FERMER")
                        DoorSystemSetDoorState(v['_doorModel'].. "door"..k, 0, false, false) 
                        DoorSystemSetAutomaticDistance(v['_doorModel'].. "door"..k, 30.0, false, false)
                        if pulsed then
                            TriggerServerEvent("guille_doorlock:server:updateDoor", k, nil)
                            animatePlyDoor()
                            pulsed = false
                        end
                    else
                        DoorSystemSetDoorState(v['_doorModel'].. "door"..k, 4, false, false)
                        DoorSystemSetAutomaticDistance(v['_doorModel'].. "door"..k, 0.0, false, false)
                        TriggerEvent("ui:showInteraction", "E", "INTERAGIR POUR OUVRIR")
                        if pulsed then
                            TriggerServerEvent("guille_doorlock:server:updateDoor", k, "locked")
                            animatePlyDoor()
                            pulsed = false
                        end
                    end

                    _wait = 120
                end
            end
        end

        if isNearToDoor then
            show = true
        else
            show = false
        end

        _Wait(_wait)
    end
end)

animatePlyDoor = function()
	_CreateThread(function()
        while not HasAnimDictLoaded("anim@heists@keycard@") do
            RequestAnimDict("anim@heists@keycard@")
            _Wait(1)
        end
        TaskPlayAnim(PlayerPedId(), "anim@heists@keycard@", "exit", 8.0, 1.0, -1, 16, 0, 0, 0, 0)
        _Wait(200)
        ClearPedTasks(PlayerPedId())
	end)
end

local _nuiDone = false

_CreateThread(function()
    while true do
        local _wait = 800
        if show then

            _wait = 3
            DrawTxt(_coordsToShow, text, 0.7, 8)
        else
            if Config['enableNuiIndicator'] then
                if not _nuiDone then
                    SendNUIMessage({
                        show = false;
                    })
                    _nuiDone = true
                end
            end
        end
        _Wait(_wait)
    end
end)

DrawTxt = function(coords, text, size, font) -- Lirol chuchatumare
    local coords = vector3(coords.x, coords.y, coords.z)

    local camCoords = GetGameplayCamCoords()
    local distance = #(coords - camCoords)

    if not size then size = 1 end
    if not font then font = 0 end

    local scale = (size / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov

    SetTextScale(0.0 * scale, 0.55 * scale)
    SetTextFont(font)
    SetTextColour(255, 255, 255, 215)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(true)

    SetDrawOrigin(coords, 0)
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

RegisterNetEvent("guille_doorlock:client:updateDoorState", function(id, type, h)
    _doorState[id] = type
end)

RegisterCommand("lockdoor", function()
    if show then
        local _allowed = false
        for k, v in pairs(_selectedDoorJobs) do
            if v == ESX['GetPlayerData']()['job']['name'] then
                _allowed = true
            end
        end
        if _allowed then
            pulsed = true
            return
        end


        if not allowed then

            if object then
                ESX.TriggerServerCallback('guille_doorlock:cb:hasObj', function(has)
                    if has then
                        pulsed = true
                        object = nil
                    end
                end, object)
            end

        end


    end
end)

RegisterKeyMapping("lockdoor", "Lock a door", 'keyboard', 'e')

RayCastGamePlayCamera = function(distance)
    -- https://github.com/Risky-Shot/new_banking/blob/main/new_banking/client/client.lua
    local cameraRotation = GetGameplayCamRot()
	local cameraCoord = GetGameplayCamCoord()
	local direction = RotationToDirection(cameraRotation)
	local destination =
	{
		x = cameraCoord.x + direction.x * distance,
		y = cameraCoord.y + direction.y * distance,
		z = cameraCoord.z + direction.z * distance
	}
	local a, b, c, d, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, PlayerPedId(), 0))
	return b, c, e
end


replaceColorText = function(text)
    text = text:gsub("~s~", "<span class='red'>") 
    text = text:gsub("~s~", "<span class='blue'>")
    text = text:gsub("~s~", "<span class='green'>")
    text = text:gsub("~s~", "<span class='yellow'>")
    text = text:gsub("~s~", "<span class='purple'>")
    text = text:gsub("~s~", "<span class='grey'>")
    text = text:gsub("~m~", "<span class='darkgrey'>")
    text = text:gsub("~u~", "<span class='black'>")
    text = text:gsub("~s~", "<span class='gold'>")
    text = text:gsub("~s~", "</span>")
    text = text:gsub("~w~", "</span>")
    text = text:gsub("~s~", "<b>")
    text = text:gsub("~n~", "<br>")
    text = "<span>" .. text .. "</span>"
    return text
end

RotationToDirection = function(rotation)
    -- https://github.com/Risky-Shot/new_banking/blob/main/new_banking/client/client.lua
	local adjustedRotation =
	{
		x = (math.pi / 180) * rotation.x,
		y = (math.pi / 180) * rotation.y,
		z = (math.pi / 180) * rotation.z
	}
	local direction =
	{
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		z = math.sin(adjustedRotation.x)
	}
	return direction
end
