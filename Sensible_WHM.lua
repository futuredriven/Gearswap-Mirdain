
--Yavanna

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "1"
MacroBook = "4"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Miso Ramen"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them ( Idle.X and OffenseMode.X )
state.OffenseMode:options('TP','ACC','DT','PDT','MEVA')
state.OffenseMode:set('TP')

-- Set to true to run organizer on job changes
Organizer = false

--Weapons options
state.WeaponMode:options('Tishtrya','Unlocked')
state.WeaponMode:set('Unlocked')

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

function get_sets()

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Tishtrya'] = {
		main="Tishtrya",
		sub="Izcalli",		
	}

	sets.Weapons['Shield'] = {
		sub="Genmei Shield",
	}

	sets.Weapons['Sleep'] ={
		main="Lorg Mor",
	}

	-- Missing
	-- sub Giuoco Grip
	sets.Weapons['Light Bonus'] = {
		main="Chatoyant Staff",
		sub="Enki Strap",
		waist="Hachirin-no-Obi",
	}

	sets.Weapons['Unlocked'] = {}

	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	-- Missing
	-- sub Oneiros Grip
	-- waist Null Belt or Moglesse Oblige
	-- back Null Shawl
	sets.Idle = {
		main="Queller Rod",
		sub="Genmei Shield",
		ammo="Homiliary",
		head="Bunzi's Hat",
		body="Ebers Bliaut +2",
		hands="Bunzi's Gloves",
		legs="Ebers Pant. +2",
		feet="Ebers Duckbills +2",
		neck="Warder's Charm +1",
		waist="Fucho-no-obi",
		left_ear="Eabani Earring",
		right_ear="Moonshade Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10','Damage taken-5%'}},
	}

	-- 'TP','PDL','ACC','DT','PDT','MEVA'
	sets.Idle.TP = set_combine(sets.Idle, {})
	sets.Idle.ACC = set_combine(sets.Idle, {})
	-- Missing
	-- ear Etiolation earring
	sets.Idle.DT = set_combine(sets.Idle, {
		main="Malignance Pole",
		sub="Umbra Strap",
		ammo="Staunch Tathlum +1",		
		body="Bunzi's Robe",	
		waist="Fucho-no-obi",
		left_ring="Defending Ring",		
	})
	sets.Idle.PDT = set_combine(sets.Idle, {})
	-- Missing
	-- main Daybreak
	sets.Idle.MEVA = set_combine(sets.Idle.DT, {
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
		legs="Bunzi's Pants",
		feet="Bunzi's Sabots",
		right_ring="Inyanga Ring",		
	})
	-- Set is only applied when sublimation is charging
	sets.Idle.Sublimation = set_combine(sets.Idle, {
		waist="Embla Sash", -- +3 Submlimation when active
	})
	-- Set to swap out when MP is low
	-- Missing
	-- neck Sibyl scarf
	-- sub Oneiros Grip
	sets.Idle.Refresh = set_combine(sets.Idle, {
		main="Mpaca's Staff",
		sub="Umbra Strap",	
		head="Inyanga Tiara +2",
		legs="Assid. Pants +1",
		feet="Inyan. Crackows +2",
		right_ring="Inyanga Ring",			
	})
	sets.Idle.Resting = set_combine(sets.Idle, {})

	-- Movement Gear
	sets.Movement = {}

	-- Set to be used if you get 
	sets.Cursna_Received = {
		neck="Nicander's Necklace",
		waist="Gishdubar Sash",
	}

	-- Engaged Sets
	sets.OffenseMode = {}

	sets.OffenseMode.TP = set_combine(sets.OffenseMode,{ })
	sets.OffenseMode.DT = set_combine(sets.OffenseMode,{ })
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode,{ })
	sets.OffenseMode.PDT = set_combine(sets.OffenseMode, { })
	sets.OffenseMode.MEVA = set_combine(sets.OffenseMode, { })

	-- ===================================================================================================================
	--		sets.Precast
	-- ===================================================================================================================

	sets.Precast = {}

	-- Used for Magic Spells (Cap 80%)
	-- Missing
	-- ear Etiolation earring
	sets.Precast.FastCast = {
		main="Marin Staff +1", -- FC 3%
		sub="Clerisy Strap +1", -- FC 3%
		ammo="Impatiens", -- Quick Cast 2%
		head="Ebers Cap +2", -- FC 10%
		body="Inyanga Jubbah +2", -- FC 14%
		hands="Fanatic Gloves", -- FC 5%
		legs="Aya. Cosciales +2", -- FC 6%
		feet="Regal Pumps +1", -- FC 5%
		neck={ name="Clr. Torque +2", augments={'Path: A',}}, -- FC 10%
		waist="Witful Belt", -- FC 3%
		left_ear="Malignance Earring", -- FC 4%
		right_ear="Loquac. Earring",  -- FC 2%
		left_ring="Lebeche Ring", -- Quick Cast 2%
		right_ring="Kishar Ring", -- FC 4%
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10','Damage taken-5%'}}, -- FC 10%
	} -- 80% FC 25% Haste

	-- Used for Cure cast
	-- 80% Cast Speed, 25% gear haste
	sets.Precast.Cure = set_combine(sets.Precast.FastCast, { })

	-- Used for Enhancing cast
	sets.Precast.Enhancing = set_combine(sets.Precast.FastCast, { })

	sets.Precast.Healing = set_combine(sets.Precast.FastCast, { })

	-- ===================================================================================================================
	--		sets.Midcast
	-- ===================================================================================================================

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, sets.Idle.DT, { })

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {}

	-- Cure Set
	sets.Midcast.Cure = {
		main="Queller Rod",
		sub="Thuellaic Ecu +1",
		ammo="Staunch Tathlum +1",
		head={ name="Kaykaus Mitra", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
		body="Ebers Bliaut +2",
		hands="Theo. Mitts +2",
		legs="Ebers Pant. +2",
		feet={ name="Kaykaus Boots", augments={'MP+60','"Cure" spellcasting time -5%','Enmity-5',}},
		neck={ name="Clr. Torque +2", augments={'Path: A',}},
		waist="Austerity Belt +1",
		left_ear="Mendi. Earring",
		right_ear="Glorious Earring",
		left_ring="Lebeche Ring",
		right_ring="Janniston Ring",
		back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10','Damage taken-5%'}},
	}

	-- For AoE cure
	sets.Midcast.Curaga = set_combine(sets.Midcast.Cure, { body="Theo. Bliaut +2",})

	-- For Cura
	sets.Midcast.Cura = set_combine(sets.Midcast.Cure, {
		body="Theo. Bliaut +2",
	})

	-- Enhancing Skill

	-- Used for base duration
	-- Missing
	-- back Fi Follet Cape +1
	sets.Midcast.Enhancing = {
		main="Gada",
		sub="Ammurapi Shield",
		ammo="Staunch Tathlum +1",
		-- head={ name="Telchine Cap", augments={'"Regen"+2','Enh. Mag. eff. dur. +10',}},
		-- body={ name="Telchine Chas.", augments={'"Regen"+2','Enh. Mag. eff. dur. +10',}},
		-- hands={ name="Telchine Gloves", augments={'"Regen"+2','Enh. Mag. eff. dur. +10',}},
		-- legs={ name="Telchine Braconi", augments={'"Regen"+2','Enh. Mag. eff. dur. +10',}},
		feet="Theo. Duckbills +2",
		neck="Incanter's Torque",
		waist="Embla Sash",
		left_ear="Andoaa Earring",
		right_ear="Mimir Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Damage taken-5%',}},
	}
	sets.Midcast.Enhancing.Others = set_combine(sets.Midcast.Enhancing, {})

	-- Caps at 500 for bar spells
	--'Barsleepra','Barpoisonra','Barparalyzra','Barblindra','Barvira','Barpetra','Baramnesra','Barsilencera','Barsleep','Barpoison','Barparalyze','Barblind','Barvirus','Barpetrify','Baramnesia','Barsilence'
	sets.Midcast.Enhancing.Status = set_combine(sets.Midcast.Enhancing, {
		main="Beneficus",
		head="Ebers Cap +2",
		body="Ebers Bliaut +2",
		hands="Ebers Mitts +2",
		legs="Piety Panta. +2",
		feet="Ebers Duckbills +2",
	})

	--'Barfire','Barblizzard','Baraero','Barstone','Barthunder','Barwater','Barfira','Barblizzara','Baraera','Barstonra','Barthundra','Barwatera'
	sets.Midcast.Enhancing.Elemental = set_combine(sets.Midcast.Enhancing.Status, {	})

	-- This caps at 500 for Gain spells
	--'Temper','Temper II','Enaero','Enstone','Enthunder','Enwater','Enfire','Enblizzard','Boost-STR','Boost-DEX','Boost-VIT','Boost-AGI','Boost-INT','Boost-MND','Boost-CHR'
	sets.Midcast.Enhancing.Skill = set_combine(sets.Midcast.Enhancing, { })

	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {
		head="Inyanga Tiara +2",
		body="Inyanga Jubbah +2",
		hands="Inyan. Dastanas +2",
		legs="Inyanga Shalwar +2",
		feet="Inyan. Crackows +2",
		-- neck="Null Loop",
		waist="Rumination sash",
		left_ear="Malignance Earring",
		right_ear="Ebers Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		-- 	back="Null Shawl",
	}

	-- Skill Based ('Dispel','Aspir','Aspir II','Aspir III','Drain','Drain II','Drain III','Frazzle','Frazzle II','Stun','Poison','Poison II','Poisonga')
	sets.Midcast.Enfeebling.MACC = set_combine(sets.Midcast.Enfeebling, {})

	-- Potency Basted ('Paralyze','Paralyze II','Slow','Slow II','Addle','Addle II','Distract','Distract II','Distract III','Frazzle III','Blind','Blind II')
	sets.Midcast.Enfeebling.Potency = set_combine(sets.Midcast.Enfeebling, { })

	-- Duration Based ('Sleep','Sleep II','Sleepga','Sleepga II','Diaga','Dia','Dia II','Dia III','Bio','Bio II','Bio III','Silence','Gravity','Gravity II','Inundation','Break','Breakaga', 'Bind', 'Bind II')
	sets.Midcast.Enfeebling.Duration = set_combine(sets.Midcast.Enfeebling, { })

	sets.Midcast.Phalanx = set_combine(sets.Midcast.Enhancing.Skill, { })
	sets.Midcast.Dark = set_combine(sets.Midcast.Enfeebling, {})
	sets.Midcast.Dark.MACC = set_combine(sets.Midcast.Enfeebling.MACC, {})
	sets.Midcast.Dark.Absorb = set_combine(sets.Midcast.Enfeebling, {})

	sets.Midcast["Cursna"] = {
		main="Yagrush",
		sub="Ammurapi Shield",
		ammo="Staunch Tathlum +1",
		head="Vanya Hood",
		body="Ebers Bliaut +2",
		hands="Fanatic Gloves",
		legs="Th. Pant. +2",
		feet="Vanya Clogs",
		neck="Debilis Medallion",
		waist="Bishop's Sash",
		left_ear="Beatific Earring",
		right_ear="Ebers Earring",
		left_ring="Haoma's Ring",
		right_ring="Haoma's Ring",
		back={ name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Damage taken-5%',}},
	}

	sets.Midcast["Erase"] = set_combine(sets.Midcast, {
		main="Yagrush",
		neck={ name="Clr. Torque +2", augments={'Path: A',}},
	})

	sets.Midcast["Esuna"] = set_combine(sets.Midcast, {
		main="Yagrush",
	})

	sets.Midcast["Silena"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +2",
		main="Yagrush"
	})

	sets.Midcast["Poisona"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +2",
		main="Yagrush"
	})

	sets.Midcast["Paralyna"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +2",
		main="Yagrush"
	})

	sets.Midcast["Stona"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +2",
		main="Yagrush"
	})

	sets.Midcast["Blindna"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +2",
		main="Yagrush"
	})

	sets.Midcast["Viruna"] = set_combine(sets.Midcast, {
		hands="Ebers Mitts +2",
		main="Yagrush"
	})

	sets.Midcast["Auspice"] = set_combine(sets.Midcast.Enhancing, {
		feet="Ebers Duckbills +2",
	})

	-- Missing
	-- main Vadose Rod
	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
		-- main="Vadose Rod",
		-- sub="Ammurapi Shield",
		waist="Emphatikos Rope",
	})

	-- Regen Set
	sets.Midcast.Regen = {
		main="Bolelabunga",
		sub="Ammurapi Shield",
		head="Inyanga Tiara +2",
		body="Piety Bliaut +2",
		hands="Ebers Mitts +2",
		legs="Th. Pant. +2",
		feet="Bunzi's Sabots",
		waist="Embla Sash",		
	}

	-- Specific gear for spells
	-- Missing
	-- waist Siegel Sash
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		neck="Nodens Gorget",
		-- waist="Siegel Sash",
		right_ear="Earthcry Earring",
	})

	sets.Midcast.Refresh = {}

	-- Job Abilities
	sets.JA = {}
	sets.JA["Benediction"] = {
		body={ name="Piety Bliaut +2", augments={'Enhances "Benediction" effect',}},
	}
	sets.JA["Divine Seal"] = {}
	sets.JA["Convert"] = {}
	sets.JA["Devotion"] = {
		head={ name="Piety Cap +1", augments={'Enhances "Devotion" effect',}},
	}
	sets.JA["Afflatus Solace"] = {}
	sets.JA["Afflatus Misery"] = {}
	sets.JA["Sacrosanctity"] = {}
	sets.JA["Asylum"] = {}

	-- ===================================================================================================================
	--		sets.aftercast
	-- ===================================================================================================================

	sets.WS = {
	}

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}

	-- Note that the Mote library will unlock these gear spots when used.
	sets.TreasureHunter = {
		ammo="Per. Lucky Egg",
		head="Wh. Rarab Cap +1",
	}

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
	local equipSet = {}

	return equipSet
end
-- Augment basic equipment sets
function midcast_custom(spell)
	local equipSet = {}

	return equipSet
end
-- Augment basic equipment sets
function aftercast_custom(spell)
	local equipSet = {}
	if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
		add_to_chat(8,'You are not in a stance')
	end
	return equipSet
end
--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	local equipSet = {}

	return equipSet
end
--This function is called when a update request the correct equipment set
function choose_set_custom()
	local equipSet = {}

	return equipSet
end
--Function is called when the player changes states
function status_change_custom(new,old)
	local equipSet = {}

	return equipSet
end
--Function is called when a self command is issued
function self_command_custom(command)

end
-- Function is called when the job lua is unloaded
function user_file_unload()

end

--Function used to automate Job Ability use - Checked first
function check_buff_JA()
	local buff = 'None'
	return buff
end

--Function used to automate Spell use
function check_buff_SP()
	local buff = 'None'
	return buff
end

function pet_change_custom(pet,gain)
	local equipSet = {}
	
	return equipSet
end

function pet_aftercast_custom(spell)
	local equipSet = {}

	return equipSet
end

function pet_midcast_custom(spell)
	local equipSet = {}

	return equipSet
end