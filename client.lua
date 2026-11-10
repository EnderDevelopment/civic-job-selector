local function notify(message)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandThefeedPostTicker(false, false)
end

local function drawText(x, y, text, scale)
    SetTextFont(4)
    SetTextScale(scale, scale)
    SetTextColour(255, 255, 255, 220)
    SetTextCentre(true)
    SetTextOutline()
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(x, y)
end

local function requestJobs()
    TriggerServerEvent('jobselector:requestJobs')
end

RegisterCommand(Config.Command, requestJobs, false)

RegisterNetEvent('jobselector:openMenu', function(jobs, currentJob)
    TriggerEvent('chat:addMessage', {
        color = { 55, 170, 255 },
        multiline = true,
        args = { 'Job Selector', ('Current job: %s\n%s'):format(currentJob or 'unemployed', 'Select with /setjob <number>:') }
    })
    for index, job in ipairs(jobs) do
        TriggerEvent('chat:addMessage', {
            args = { ('%d. %s'):format(index, job.label), job.description or '' }
        })
    end
end)

RegisterCommand('setjob', function(_, args)
    local index = tonumber(args[1])
    if not index or index < 1 then
        notify('Usage: /setjob <number> (use /jobs to view options)')
        return
    end
    TriggerServerEvent('jobselector:selectJob', index)
end, false)

RegisterNetEvent('jobselector:result', function(_, message)
    notify(message)
end)

CreateThread(function()
    if Config.Blip.enabled then
        local blip = AddBlipForCoord(Config.Location.x, Config.Location.y, Config.Location.z)
        SetBlipSprite(blip, Config.Blip.sprite)
        SetBlipColour(blip, Config.Blip.color)
        SetBlipScale(blip, Config.Blip.scale)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(Config.Blip.label)
        EndTextCommandSetBlipName(blip)
    end

    while true do
        local wait = 1000
        local coords = GetEntityCoords(PlayerPedId())
        local distance = #(coords - Config.Location)

        if distance <= Config.Marker.drawDistance then
            wait = 0
            DrawMarker(Config.Marker.type, Config.Location.x, Config.Location.y, Config.Location.z - 0.95,
                0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                Config.Marker.scale.x, Config.Marker.scale.y, Config.Marker.scale.z,
                Config.Marker.color.r, Config.Marker.color.g, Config.Marker.color.b, Config.Marker.color.a,
                false, false, 2, false, nil, nil, false)
            if distance <= Config.InteractionDistance then
                drawText(0.5, 0.88, 'Press ~INPUT_CONTEXT~ to open the job selector', 0.35)
                if IsControlJustReleased(0, 38) then
                    requestJobs()
                end
            end
        end
        Wait(wait)
    end
end)
