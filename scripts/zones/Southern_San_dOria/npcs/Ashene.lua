-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Ashene
-- Standard Merchant NPC
-- @zone 230
-- !pos 70 0 61
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end;

function onTrigger(player,npc)

    player:showText(npc,ASH_THADI_ENE_SHOP_DIALOG);

    local stock = {0x4047,4309,1,        --Baselard
             0x4094,16934,1,    --Gladius
             0x40a1,21067,1,    --Broadsword
             0x40c0,35769,1,    --Hunting Sword
             0x408c,13406,1,    --Fleuret

             0x4001,129,2,        --Cesti
             0x4042,1827,2,        --Dagger
             0x4098,7128,2,        --Iron Sword
             0x40b6,8294,2,        --Longsword

             0x4040,140,3,        --Bronze Dagger
             0x4041,837,3,        --Brass Dagger
             0x4093,3523,3,        --Brass Xiphos
             0x4097,241,3,        --Bronze Sword
             0x40b5,1674,3}        --Spatha

    dsp.shop.nation(player, stock, dsp.nation.SANDORIA);

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
