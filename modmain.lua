PrefabFiles = {
	"waristela",
	"waristela_none",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/waristela.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/waristela.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/waristela.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/waristela.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/waristela_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/waristela_silho.xml" ),

    Asset( "IMAGE", "bigportraits/waristela.tex" ),
    Asset( "ATLAS", "bigportraits/waristela.xml" ),
	
	Asset( "IMAGE", "images/map_icons/waristela.tex" ),
	Asset( "ATLAS", "images/map_icons/waristela.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_waristela.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_waristela.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_waristela.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_waristela.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_waristela.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_waristela.xml" ),
	
	Asset( "IMAGE", "images/names_waristela.tex" ),
    Asset( "ATLAS", "images/names_waristela.xml" ),
	
    Asset( "IMAGE", "bigportraits/waristela_none.tex" ),
    Asset( "ATLAS", "bigportraits/waristela_none.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- The character select screen lines
STRINGS.CHARACTER_TITLES.waristela = "The Monster Ghoul"
STRINGS.CHARACTER_NAMES.waristela = "Waristela"
STRINGS.CHARACTER_DESCRIPTIONS.waristela = "*Eat raw monster meat and become a monster."
STRINGS.CHARACTER_QUOTES.waristela = "\"I wasn't supposed to be here.\""

-- Custom speech strings
STRINGS.CHARACTERS.WARISTELA = require "speech_waristela"

-- The character's name as appears in-game 
STRINGS.NAMES.WARISTELA = "Waristela"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.GROWLIE = 
{
	GENERIC = "Waristela!",
	ATTACKER = "That Waristela looks shifty...",
	MURDERER = "Monster!",
	REVIVER = "Waristela, friend of ghosts.",
	GHOST = "Waristela could use a heart.",
}

AddMinimapAtlas("images/map_icons/waristela.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("waristela", "FEMALE")