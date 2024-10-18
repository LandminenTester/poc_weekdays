local VORPcore = exports.vorp_core:GetCore()

-- Die Ingame Uhrzeit holen
local timeHour = GetClockHours()
local timeMinute = GetClockMinutes()

--Den Wochentag vom Server holen der gerade in der Echten Welt ist (Diese Funktion ersetzt die GetClockDayOfWeek() Funktion die ebenfalls auch den Tag aus der Echten Welt ausgibt)
local day = VORPcore.Callback.TriggerAwait('poc_weekdays:getWeekDay')

--Wochentag vom Server empfangen und speichern, falls sich der Tag geändert hat
RegisterNetEvent("poc_weekdays:recieveWeekday")
AddEventHandler("poc_weekdays:recieveWeekday", function(recievedDay)
    day = recievedDay
end)

--Schleife die die Uhrzeit vom Ingame Server abruft und speichert
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(15000)
        timeHour = GetClockHours()
        timeMinute = GetClockMinutes()
    end
end)

