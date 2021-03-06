-----------------------------------
-- Area: Behemoth's Dominion
--  HNM: King Behemoth
-----------------------------------
require("scripts/zones/Behemoths_Dominion/MobIDs")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/magic")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.MAGIC_COOL, 60)
end

function onMobSpawn(mob)
    -- Todo: move this to SQL after drop slots are a thing
    if math.random(1,100) <= 5 then -- Hardcoded "this or this item" drop rate until implemented.
        SetDropRate(1936,13566,1000) -- Defending Ring
        SetDropRate(1936,13415,0)
    else
        SetDropRate(1936,13566,0)
        SetDropRate(1936,13415,1000) -- Pixie Earring
    end

    if LandKingSystem_NQ > 0 or LandKingSystem_HQ > 0 then
        GetNPCByID(BEHEMOTH_QM):setStatus(dsp.status.DISAPPEAR)
    end
end

function onSpellPrecast(mob, spell)
    if spell:getID() == 218 then
        spell:setAoE(dsp.magic.aoe.RADIAL)
        spell:setFlag(dsp.magic.spellFlag.HIT_ALL)
        spell:setRadius(30)
        spell:setAnimation(280)
        spell:setMPCost(1)
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.BEHEMOTH_DETHRONER)
end

function onMobDespawn(mob)
    -- Set King_Behemoth's Window Open Time
    if LandKingSystem_HQ ~= 1 then
        local wait = 72 * 3600
        SetServerVariable("[POP]King_Behemoth", os.time() + wait) -- 3 days
        if LandKingSystem_HQ == 0 then -- Is time spawn only
            DisallowRespawn(mob:getID(), true)
        end
    end

    -- Set Behemoth's spawnpoint and respawn time (21-24 hours)
    if LandKingSystem_NQ ~= 1 then
        SetServerVariable("[PH]King_Behemoth", 0)
        DisallowRespawn(BEHEMOTH, false)
        UpdateNMSpawnPoint(BEHEMOTH)
        GetMobByID(BEHEMOTH):setRespawnTime(math.random(75600,86400))
    end
end
