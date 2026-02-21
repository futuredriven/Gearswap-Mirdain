
--Turin

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "5"
MacroBook = "6"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

--Set default mode (TP,ACC,DT,PDL)
state.OffenseMode:set('DT')

--Weapons options
state.WeaponMode:options('Unlocked')
state.WeaponMode:set('Unlocked')

-- Initialize Player
jobsetup (LockStylePallet,MacroBook,MacroSet)

function get_sets()

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Unlocked'] = {}


	sets.Weapons.Shield = {}
	sets.Weapons.Sleep = {}

	-- Standard Idle set with -DT, Refresh, Regen and movement gear
	sets.Idle = {}
	sets.Idle.Resting = set_combine(sets.Idle, {})
	sets.Idle.TP = set_combine(sets.Idle, {})
	sets.Idle.ACC = set_combine(sets.Idle, {})
	sets.Idle.DT = set_combine(sets.Idle, {})
	sets.Idle.PDL = set_combine(sets.Idle, {})
	sets.Idle.SB = set_combine(sets.Idle, {})
	sets.Idle.MEVA = set_combine(sets.Idle, {})

	sets.Movement = {}

	-- Set to be used if you get 
	sets.Cursna_Received = {}

	sets.OffenseMode = {}

	--Base TP set to build off
	sets.OffenseMode.TP = {}

	--This set is used when OffenseMode is DT and Enaged (Augments the TP base set)
	sets.OffenseMode.DT = set_combine(sets.OffenseMode.TP, {})

	--This set is used when OffenseMode is ACC and Enaged (Augments the TP base set)
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode.TP, {})

	--Dual Wield need only 6 if not getting haste samba
	sets.DualWield = { 
	    --left_ear="Eabani Earring",
	    --waist="Reiki Yotai",
	}

	sets.Precast = {}

	-- Used for Magic Spells
	sets.Precast.FastCast = {}

	sets.Enmity = {}

	-- Used for Raises and Cure spells
	sets.Precast.QuickMagic = set_combine( sets.Precast.FastCast, {

	});

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})
	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {}
	-- Cure Set
	sets.Midcast.Cure = {}
	-- Enhancing Skill
	sets.Midcast.Enhancing = {}
	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {}
	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = {}
	sets.JA = {}
	sets.JA["Perfect Dodge"] = {}
	sets.JA["Steal"] = {}
	sets.JA["Flee"] = {}
	sets.JA["Hide"] = {}
	sets.JA["Sneak Attack"] = {}
	sets.JA["Mug"] = {}
	sets.JA["Trick Attack"] = {}
	sets.JA["Accomplice"] = {}
	sets.JA["Feint"] = {}
	sets.JA["Despoil"] = {}
	sets.JA["Collaborator"] = {}
	sets.JA["Conspirator"] = {}
	sets.JA["Bully"] = {}
	sets.JA["Larceny"] = {}

	-- Dancer JA Section

	sets.Flourish = set_combine(sets.Idle.DT, {})

	sets.Jig = set_combine(sets.Idle.DT, {})

	sets.Step = set_combine(sets.OffenseMode.DT, {})

	sets.Samba = set_combine(sets.Idle.DT, {})

	-------------------------------------------------------------------------------
	-- Waltz Potency gear caps at 50%, while Waltz received potency caps at 30%. -- 
	-------------------------------------------------------------------------------
	sets.Waltz = set_combine(sets.OffenseMode.DT, {})

	--Default WS set base
	sets.WS = {}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}

	sets.WS.MAB = set_combine( sets.WS, {})
	--WS Sets
	sets.WS["Wasp Sting"] = {}
	sets.WS["Viper Bite"] = {}
	sets.WS["Shadowstich"] = {}
	sets.WS["Gust Slash"] = {}
	sets.WS["Cyclone"] = {}
	sets.WS["Energy Steal"] = {}
	sets.WS["Energy Drain"] = {}
	sets.WS["Dancing Edge"] = {}
	sets.WS["Shark Bite"] = {}
	sets.WS["Evisceration"] = {}
	sets.WS["Aeolian Edge"] = set_combine( sets.WS.MAB, {})

	--Custome sets for each jobsetup
	sets.Custom = {}

	sets.TreasureHunter = {}
end

-------------------------------------------------------------------------------------------------------------------
-- DO NOT EDIT BELOW THIS LINE UNLESS YOU NEED TO MAKE JOB SPECIFIC RULES
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's subjob changes.
function sub_job_change_custom(new, old)
	-- Typically used for Macro pallet changing
end

--Adjust custom precast actions
function pretarget_custom(spell,action)

end
-- Augment basic equipment sets
function precast_custom(spell)
	equipSet = {}

	return equipSet
end
-- Augment basic equipment sets
function midcast_custom(spell)
	equipSet = {}

	return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
	equipSet = {}

	return equipSet
end
--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	equipSet = {}

	return equipSet
end
--This function is called when a update request the correct equipment set
function choose_set_custom()
	equipSet = {}

	return equipSet
end
--Function is called when the player changes states
function status_change_custom(new,old)
	equipSet = {}

	return equipSet
end
--Function is called when a self command is issued
function self_command_custom(command)

end

function check_buff_JA()
	buff = 'None'
	--local ja_recasts = windower.ffxi.get_ability_recasts()
	return buff
end

function check_buff_SP()
	buff = 'None'
	--local sp_recasts = windower.ffxi.get_spell_recasts()
	return buff
end

-- This function is called when the job file is unloaded
function user_file_unload()

end

function pet_change_custom(pet,gain)
	equipSet = {}
	
	return equipSet
end

function pet_aftercast_custom(spell)
	equipSet = {}

	return equipSet
end

function pet_midcast_custom(spell)
	equipSet = {}

	return equipSet
end