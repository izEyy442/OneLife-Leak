---@type Game
Game = Class.new(function(class)

    ---@class Game: BaseObject
    local self = class;

    function self:Constructor()
        self.Notification = Notification();
        self.Players = GamePlayers();
        self.Object = GameObject();
        self.Peds = GamePeds();
        self.Streaming = GameStreaming();
        self.Zone = Zone;
        self.Blip = Blip;
        self.Prompt = PlayerPromt;
        self.InteractContext = InteractContext();
    end

    ---@param otherPeds boolean
    function self:GetPeds(otherPeds)
        local peds, myPed, pool = {}, PlayerPedId(), GetGamePool('CPed')

        for i = 1, #pool do
            if ((otherPeds and pool[i] ~= myPed) or not otherPeds) then
                peds[#peds + 1] = pool[i]
            end
        end

        return peds;
    end

    function self:DrawText(position, text, font, scale)
        SetTextFont(ServerFontStyle)
        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(text)
        DrawText(position[1], position[2])
    end

    ---@param coords table | vector3
    ---@param text string
    ---@param size number
    ---@param font number
    function self:DrawText3D(coords, text, size, font)
        local vector = type(coords) == "vector3" and coords or vec(coords.x, coords.y, coords.z)

        local camCoords = GetFinalRenderedCamCoord()
        local distance = #(vector - camCoords)

        if not size then size = 1 end
        if not font then font = 0 end

        local scale = (size / distance) * 2
        local fov = (1 / GetGameplayCamFov()) * 100
        scale = scale * fov

        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextFont(ServerFontStyle)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        BeginTextCommandDisplayText('STRING')
        SetTextCentre(true)
        AddTextComponentSubstringPlayerName(text)
        SetDrawOrigin(vector.xyz, 0)
        EndTextCommandDisplayText(0.0, 0.0)
        ClearDrawOrigin()
    end

    return self;
end)();