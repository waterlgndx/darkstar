-----------------------------------------
--   Spell: PHALANX
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local enhskill = caster:getSkillLevel(dsp.skill.ENHANCING_MAGIC);
    local final = 0;
    local duration = 180;
    if (caster:hasStatusEffect(dsp.effect.COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    if (enhskill<=300) then
        final = (enhskill/10) -2;
        if (final<0) then
            final = 0;
        end
    elseif (enhskill>300) then
        final = ((enhskill-300)/29) + 28;
    else
        print("Warning: Unknown enhancing magic skill for phalanx.");
    end

    if (final>35) then
        final = 35;
    end

    if (target:addStatusEffect(dsp.effect.PHALANX,final,0,duration)) then
        spell:setMsg(dsp.msg.basic.MAGIC_GAIN_EFFECT);
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT);
    end

    return dsp.effect.PHALANX;
end;
