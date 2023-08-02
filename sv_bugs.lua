local QBCore = exports['qb-core']:GetCoreObject()
local hook = 'https://discord.com/api/webhooks/1066262917344919592/-fATlVvVp15wZ1aWLbqbHKMdCSpNcOghgjBU7QdDV5UIWn4I2KVDRWuUjJNZ7zmn3aPs'

RegisterCommand('bug', function(source, args, msg)
    local xPlayer       = QBCore.Functions.GetPlayer(source)
    local identifier	= xPlayer.PlayerData.name
    local message       = msg
    sendToDiscord(16753920, "bugs", 'Reporting bug: '..message, "Identifier: "..identifier)
end)

function sendToDiscord(color, name, message, footer)
    local embed = {
        {
            ['color']       = color,
            ['title']       = '**'..name..'**',
            ['description'] = message,
            ['footer']      = {
                ['text']    = footer,
            },
        }
    }
    PerformHttpRequest(hook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end