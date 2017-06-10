TUNING.SPEAR_GROWLIE_USES = 150
TUNING.SPEAR_GROWLIE_DAMAGE = 75

PrefabFiles = {
	"growlie",
	"spear_growlie"
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/growlie.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/growlie.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/growlie.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/growlie.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/growlie_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/growlie_silho.xml" ),

    Asset( "IMAGE", "bigportraits/growlie.tex" ),
    Asset( "ATLAS", "bigportraits/growlie.xml" ),
	
	Asset( "IMAGE", "images/map_icons/growlie.tex" ),
	Asset( "ATLAS", "images/map_icons/growlie.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_growlie.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_growlie.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_growlie.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_growlie.xml" ),
	
	Asset("IMAGE", "images/inventoryimages/spear_growlie.tex"),
	Asset("ATLAS", "images/inventoryimages/spear_growlie.xml"),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- The character select screen lines
STRINGS.CHARACTER_TITLES.growlie = "The Demonic Prisoner"
STRINGS.CHARACTER_NAMES.growlie = "Growlie"
STRINGS.CHARACTER_DESCRIPTIONS.growlie = "*Not entirely sane\n*Doesn't need much food\n*Secretes nightmare fuel (after shaving)"
STRINGS.CHARACTER_QUOTES.growlie = "\"Wish I wasn't here.\""

-- Custom speech strings
STRINGS.CHARACTERS.GROWLIE = require "speech_growlie"

-- The character's name as appears in-game 
STRINGS.NAMES.GROWLIE = "Growlie"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.GROWLIE = 
{
	GENERIC = "It's Growlie!",
	ATTACKER = "That Growlie looks shifty...",
	MURDERER = "Murderer!",
	REVIVER = "Growlie, friend of ghosts.",
	GHOST = "Growlie could use a heart.",
}


AddMinimapAtlas("images/map_icons/growlie.xml")

local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local STRINGS = GLOBAL.STRINGS
local TECH = GLOBAL.TECH

GLOBAL.STRINGS.NAMES.SPEAR_GROWLIE = "Growlie's Spear"
GLOBAL.STRINGS.RECIPE_DESC.SPEAR_GROWLIE = "Steal the souls of the lost today!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SPEAR_GROWLIE = "It's Growlie's spear."

local spear_growlie = GLOBAL.Recipe("spear_growlie", { Ingredient("twigs", 3), Ingredient("nightmarefuel", 4), Ingredient("purplegem", 1)}, RECIPETABS.WAR,  TECH.SCIENCE_TWO)
spear_growlie.atlas = "images/inventoryimages/spear_growlie.xml"

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("growlie", "FEMALE")

