
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {

        Asset( "ANIM", "anim/player_basic.zip" ),
        Asset( "ANIM", "anim/player_idles_shiver.zip" ),
        Asset( "ANIM", "anim/player_actions.zip" ),
        Asset( "ANIM", "anim/player_actions_axe.zip" ),
        Asset( "ANIM", "anim/player_actions_pickaxe.zip" ),
        Asset( "ANIM", "anim/player_actions_shovel.zip" ),
        Asset( "ANIM", "anim/player_actions_blowdart.zip" ),
        Asset( "ANIM", "anim/player_actions_eat.zip" ),
        Asset( "ANIM", "anim/player_actions_item.zip" ),
        Asset( "ANIM", "anim/player_actions_uniqueitem.zip" ),
        Asset( "ANIM", "anim/player_actions_bugnet.zip" ),
        Asset( "ANIM", "anim/player_actions_fishing.zip" ),
        Asset( "ANIM", "anim/player_actions_boomerang.zip" ),
        Asset( "ANIM", "anim/player_bush_hat.zip" ),
        Asset( "ANIM", "anim/player_attacks.zip" ),
        Asset( "ANIM", "anim/player_idles.zip" ),
        Asset( "ANIM", "anim/player_rebirth.zip" ),
        Asset( "ANIM", "anim/player_jump.zip" ),
        Asset( "ANIM", "anim/player_amulet_resurrect.zip" ),
        Asset( "ANIM", "anim/player_teleport.zip" ),
        Asset( "ANIM", "anim/wilson_fx.zip" ),
        Asset( "ANIM", "anim/player_one_man_band.zip" ),
        Asset( "ANIM", "anim/shadow_hands.zip" ),
        Asset( "SOUND", "sound/sfx.fsb" ),
        Asset( "SOUND", "sound/wilson.fsb" ),
        Asset( "ANIM", "anim/beard.zip" ),

        Asset( "ANIM", "anim/growlie.zip" ),
        Asset( "ANIM", "anim/ghost_growlie_build.zip" ),
}
local prefabs = {}
local start_inv = {
	"spear_growlie",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"monstermeat",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap",
	"blue_cap"
}

local function growlie(inst)
 	
 	if TheWorld.state.phase == "day" then
  		inst.components.combat.damagemultiplier = 1
  		inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 0.9)
     	inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 0.9)
  		inst.components.playervision:ForceNightVision(false)
  		inst.components.hunger.hungerrate = 1.0 * TUNING.WILSON_HUNGER_RATE
  		inst.components.combat.min_attack_period = 2.0

 	elseif TheWorld.state.phase == "dusk" then
  		inst.components.combat.damagemultiplier = 1.5
 		inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.4)
     	inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.4)
  		inst.components.playervision:ForceNightVision(false)
  		inst.components.hunger.hungerrate = 1.5 * TUNING.WILSON_HUNGER_RATE
  		inst.components.combat.min_attack_period = 1.3
 		
 	elseif TheWorld.state.phase == "night" then
  		inst.components.combat.damagemultiplier = 2.0
  		inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.9)
     	inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.9)
     	inst.components.hunger.hungerrate = 2.0 * TUNING.WILSON_HUNGER_RATE
  		inst.components.combat.min_attack_period = 0.5
  		inst.components.sanity.night_drain_mult = 0.0

  		local sanitytogain = inst.components.sanity.max * (inst.level * 0.0001)
		--inst.components.sanity.current = sanitytogain + inst.components.sanity.current
		inst.components.sanity:DoDelta(sanitytogain)

		local currentSanity = inst.components.sanity:GetPercent()
		if inst.components.sanity:IsSane() then 
 			inst.components.sanity.sane = true
		else
   			inst.components.sanity.sane = false
		end
  
  		inst.components.playervision:ForceNightVision(true)
		local NIGHTVISION_COLOURCUBES = {
		    day = "images/colour_cubes/night04_cc.tex",
		    dusk = "images/colour_cubes/night04_cc.tex",
		    night = "images/colour_cubes/night04_cc.tex",
		    full_moon = "images/colour_cubes/night04_cc.tex",
		}

  		inst.components.playervision:SetCustomCCTable(NIGHTVISION_COLOURCUBES)
 	end
end

local common_postinit = function(inst) 
	inst.MiniMapEntity:SetIcon( "growlie.tex" )
end

local function applyupgrades(inst)

	local max_upgrades = 30
	local upgrades = math.min(inst.level, max_upgrades)

	local hunger_percent = inst.components.hunger:GetPercent()
	local health_percent = inst.components.health:GetPercent()
	local sanity_percent = inst.components.sanity:GetPercent()

	inst.components.hunger.max = math.ceil (100 + upgrades * 5)
	inst.components.health.maxhealth = math.ceil (150 + upgrades * 5)
	--inst.components.sanity.max = math.ceil (100 + upgrades * 5)
	
	inst.components.talker:Say("Level : ".. (inst.level))
	
	if inst.level >29 then
		inst.components.talker:Say("Level : Max!")
	end

	inst.components.hunger:SetPercent(hunger_percent)
	inst.components.health:SetPercent(health_percent)
	inst.components.sanity:SetPercent(sanity_percent)
	
end

local function oneat(inst, food)
	
	if food and food.components.edible and food.prefab == "monstermeat" then
		inst.level = inst.level + 1
		applyupgrades(inst)	
		inst.SoundEmitter:PlaySound("dontstarve/sound/wendy.fsb")
	end
end

local function onpreload(inst, data)
	if data then
		if data.level then
			inst.level = data.level
			applyupgrades(inst)
			if data.health and data.health.health then inst.components.health.currenthealth = data.health.health end
			if data.hunger and data.hunger.hunger then inst.components.hunger.current = data.hunger.hunger end
			if data.sanity and data.sanity.current then inst.components.sanity.current = data.sanity.current end
			inst.components.health:DoDelta(0)
			inst.components.hunger:DoDelta(0)
			inst.components.sanity:DoDelta(0)
		end
	end

end

local function onsave(inst, data)
	data.level = inst.level
end

local master_postinit = function(inst)
	inst.soundsname = "wendy"	
	
	inst.components.health:SetMaxHealth(100)
	inst.components.hunger:SetMax(100)
	inst.components.sanity:SetMax(100)
	inst.components.eater.stale_hunger = 1
    inst.components.eater.stale_health = 1

    inst.level = 0
	inst.components.eater:SetOnEatFn(oneat)
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload

	local refreshTime = 1/5
 	inst:DoPeriodicTask(refreshTime, function() growlie(inst, refreshTime) end)
	
end

return MakePlayerCharacter("growlie", prefabs, assets, common_postinit, master_postinit, start_inv)
