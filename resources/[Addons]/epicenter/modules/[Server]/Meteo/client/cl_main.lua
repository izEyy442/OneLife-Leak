-- local CurrenWeather = nil
-- local LastWeather = 'XMAS' -- Change after Noel
-- local LoadedMeteo = false
-- local baseTime = 0
-- local timeOffset = 0
-- local timer = 0

-- RegisterNetEvent("Meteo:updateWeather")
-- AddEventHandler("Meteo:updateWeather", function(newWeather)
--     LoadedMeteo = false
--     CurrenWeather = newWeather

--     if LastWeather ~= newWeather then
--         SetWeatherTypeOvertimePersist(CurrenWeather, 15.0)
--         LastWeather = newWeather
--         Wait(15000)
--         LoadedMeteo = true
--     else
--         LoadedMeteo = true
--     end
-- end)

-- RegisterNetEvent('meteo:uptime')
-- AddEventHandler('meteo:uptime', function(base, offset, freeze)
--     freezeTime = freeze
--     timeOffset = offset
--     baseTime = base
-- end)

-- CreateThread(function()
--     local hour = 0
--     local minute = 0
--     while true do
--         Wait(500)

--         local newBaseTime = baseTime
--         if GetGameTimer() - 500  > timer then
--             newBaseTime = newBaseTime + 0.25
--             timer = GetGameTimer()
--         end
--         if freezeTime then
--             timeOffset = timeOffset + baseTime - newBaseTime			
--         end

--         baseTime = newBaseTime
--         hour = math.floor(((baseTime+timeOffset)/60)%24)
--         minute = math.floor((baseTime+timeOffset)%60)

--         NetworkOverrideClockTime(hour, minute, 0)
--     end
-- end)

-- CreateThread(function()
--     Wait(2500)
--     TriggerServerEvent('Meteo:RetrieveCurrentWeather')

--     while true do
--         Wait(750)
--         if LoadedMeteo then
--             ClearOverrideWeather()
--             ClearWeatherTypePersist()
--             SetWeatherTypePersist(CurrenWeather)
--             SetWeatherTypeNow(CurrenWeather)
--             SetWeatherTypeNowPersist(CurrenWeather)
--         end
--     end
-- end) 
