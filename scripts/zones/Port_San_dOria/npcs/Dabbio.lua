-----------------------------------
-- Area: Port San d'Oria
--   NPC: Dabbio
-- Type: Standard NPC
-- @zone 232
-- !pos -7.819 -15 -106.990
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(722);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

