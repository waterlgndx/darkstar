-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Faulpie
-- Type: Leathercraft Guild Master
-- !pos -178.882 -2 9.891 230
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria/TextIDs");
require("scripts/globals/crafting");
require("scripts/globals/missions");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    local newRank = tradeTestItem(player,npc,trade,dsp.skill.LEATHERCRAFT);

    if (newRank ~= 0) then
        player:setSkillRank(dsp.skill.LEATHERCRAFT,newRank);
        player:startEvent(649,0,0,0,0,newRank);
    end
end;

function onTrigger(player,npc)
    local getNewRank = 0;
    local craftSkill = player:getSkillLevel(dsp.skill.LEATHERCRAFT);
    local testItem = getTestItem(player,npc,dsp.skill.LEATHERCRAFT);
    local guildMember = isGuildMember(player,7);
    if (guildMember == 1) then guildMember = 150995375; end
    if (canGetNewRank(player,craftSkill,dsp.skill.LEATHERCRAFT) == 1) then getNewRank = 100; end

    if (player:getCurrentMission(ASA) == THAT_WHICH_CURDLES_BLOOD and guildMember == 150995375 and
        getNewRank ~= 100) then
        local item = 0;
        local asaStatus = player:getVar("ASA_Status");

        -- TODO: Other Enfeebling Kits
        if (asaStatus == 0) then
            item = 2779;
        else
            printf("Error: Unknown ASA Status Encountered <%u>", asaStatus);
        end

        -- The Parameters are Item IDs for the Recipe
        player:startEvent(944, item, 2773, 917, 917, 2776, 4103);
    else
        player:startEvent(648,testItem,getNewRank,30,guildMember,44,0,0,0);
    end
end;

-- 648  649  0x02f8  0x02f9  0x02fa  0x02fb  0x02fc  0x02fd  0x0302  0x0303  0x0304  0x0305  0x0306  0x0307  944  0x0392
function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 648 and option == 1) then
        local crystal = 4103; -- dark crystal

        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,crystal);
        else
            player:addItem(crystal);
            player:messageSpecial(ITEM_OBTAINED,crystal);
            signupGuild(player, guild.leathercraft);
        end
    end
end;