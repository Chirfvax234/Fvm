local function hideText()
    exports["seind-ui"]:HideText()
end

local function drawText(text, position)
    if type(position) ~= "string" then position = "left" end

    exports["seind-ui"]:TextDisplay(text, nil, "fas fa-circle", nil)
end

local function changeText(text, position)
    if type(position) ~= "string" then position = "left" end

    exports["seind-ui"]:TextDisplay(text, nil, "fas fa-circle", nil)
end

local function keyPressed()
    CreateThread(function() -- Not sure if a thread is needed but why not eh?
        SendNUIMessage({
            action = 'KEY_PRESSED',
        })
        Wait(500)
        exports["seind-ui"]:HideText()
    end)
end

RegisterNetEvent('qb-core:client:DrawText', function(text, position)
    exports["seind-ui"]:TextDisplay(text, nil, "fas fa-circle", nil)
end)

RegisterNetEvent('qb-core:client:ChangeText', function(text, position)
    exports["seind-ui"]:TextDisplay(text, nil, "fas fa-circle", nil)
end)

RegisterNetEvent('qb-core:client:HideText', function()
    exports["seind-ui"]:HideText()
end)

RegisterNetEvent('qb-core:client:KeyPressed', function()
    exports["seind-ui"]:HideText()
end)

exports('DrawText', drawText)
exports('ChangeText', changeText)
exports('HideText', hideText)
exports('KeyPressed', keyPressed)
