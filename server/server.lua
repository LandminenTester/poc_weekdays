local VORPcore = exports.vorp_core:GetCore()

-- Den Tag einmal zu Beginn speichern
local dayStorage = os.date("%w") + 1

--Callback um beim Connecten vom Client einmal den Wochentag zu holen
VORPcore.Callback.Register('poc_weekdays:getWeekDay', function(source, cb, bankName)
    local _source = source
    local currentDay = os.date("%w") + 1
    cb(currentDay)
end)

--Schleife der den Wochentag jede Minute überprüft und falls sich der Tag geändert hat, wird dies dem Client mitgeteilt
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000)
        local currentDay = os.date("%w") + 1
        if currentDay ~= dayStorage then
            dayStorage = currentDay
            TriggerClientEvent("poc_weekdays:recieveWeekday", -1, currentDay)
        end
    end
end)

