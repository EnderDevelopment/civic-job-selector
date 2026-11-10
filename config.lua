Config = {}

Config.Command = 'jobs'
Config.InteractionDistance = 2.0
Config.Location = vector3(-269.4, -955.3, 31.2)
Config.Blip = {
    enabled = true,
    sprite = 408,
    color = 3,
    scale = 0.8,
    label = 'Job Center'
}
Config.Marker = {
    type = 1,
    scale = vector3(1.2, 1.2, 0.35),
    color = { r = 55, g = 170, b = 255, a = 160 },
    drawDistance = 20.0
}

Config.Jobs = {
    { id = 'unemployed', label = 'Unemployed', description = 'No assigned occupation.' },
    { id = 'mechanic', label = 'Mechanic', description = 'Repair and maintain vehicles.' },
    { id = 'taxi', label = 'Taxi Driver', description = 'Transport passengers around the city.' },
    { id = 'trucker', label = 'Trucker', description = 'Deliver cargo across the state.' }
}
