local currentJobs = {}

local function findJob(index)
    if type(index) ~= 'number' or index % 1 ~= 0 then return nil end
    return Config.Jobs[index]
end

RegisterNetEvent('jobselector:requestJobs', function()
    local source = source
    local jobs = {}
    for index, job in ipairs(Config.Jobs) do
        jobs[index] = { id = job.id, label = job.label, description = job.description }
    end
    TriggerClientEvent('jobselector:openMenu', source, jobs, currentJobs[source] or 'unemployed')
end)

RegisterNetEvent('jobselector:selectJob', function(index)
    local source = source
    local job = findJob(tonumber(index))
    if not job then
        TriggerClientEvent('jobselector:result', source, false, 'That job is not available.')
        return
    end

    currentJobs[source] = job.id
    Player(source).state:set('job', job.id, true)
    TriggerClientEvent('jobselector:result', source, true, ('You are now a %s.'):format(job.label))
    TriggerEvent('jobselector:jobChanged', source, job.id, job.label)
end)

AddEventHandler('playerDropped', function()
    currentJobs[source] = nil
end)

exports('GetPlayerJob', function(playerId)
    return currentJobs[tonumber(playerId)] or 'unemployed'
end)
