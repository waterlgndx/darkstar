-----------------------------------
-- Area: Windurst Waters (S)
--  NPC: Pelftrix
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/shop");
require("scripts/zones/Windurst_Waters_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,PELFTRIX_SHOP_DIALOG);

    local stock =
    {
        0x1014,4500,        -- Hi-Potion
        0x1024,28000,        -- Hi-Ether
        0x03FC,300,            -- Sickle
        0x03FD,500}            -- Hatchet

    dsp.shop.general(player, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

