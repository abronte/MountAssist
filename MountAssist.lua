SLASH_MOUNTASSIST1 = "/mountassist" 

MOUNT1 = 'Sky Golem'
MOUNT2 = 'Glacial Tidestorm'
MOUNT3 = 'Hogrus, Swine of Good Fortune'

local MOUNT1_ZONES = {
    ['Bastion'] = true,
    ['Ardenweald'] = true,
    ['Maldraxxus'] = true,
    ['Revendreth'] = true
}

local MOUNT3_ZONES = {
    ['Halls of Atonement'] = true,
    ['Mists of Tirna Scithe'] = true,
    ['Plaguefall'] = true,
    ['Sanguine Depths'] = true,
    ['Spires of Ascension'] = true,
    ['The Necrotic Wake'] = true,
    ['Theater of Pain'] = true,
    ['De Other Side'] = true
}

SlashCmdList["MOUNTASSIST"] = function(msg)
    if IsMounted() then
        Dismount()
        return
    end

    local map_name = C_Map.GetMapInfo(C_Map.GetBestMapForUnit("player")).name

    print(map_name)

    if MOUNT1_ZONES[map_name] == true then
        cast_mount = MOUNT1
    elseif MOUNT3_ZONES[map_name] then
        cast_mount = MOUNT3
    else
        cast_mount = MOUNT2
    end

    print('Mounting ' .. cast_mount)
    CastSpellByName(cast_mount)
end 