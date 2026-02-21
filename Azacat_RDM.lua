
--Yavanna

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "6"
MacroBook = "3"
MacroSet = "1"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

-- Use "gs c food" to use the specified food item 
Food = "Tropical Crepe"

--Set default mode (TP,ACC,DT)
state.OffenseMode:options('TP','ACC','DT','PDL','SB','CRIT','Enspell')
state.OffenseMode:set('DT')

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

--Modes for TP
state.WeaponMode:options('Naegling','EnSpell','Maxentius','Ullr','Unlocked')
state.WeaponMode:set('Unlocked')

function get_sets()

	-- ===================================================================================================================
	--		sets.Weapons
	-- ===================================================================================================================

	--Set the weapon options.  This is set below in job customization section
	sets.Weapons = {}

	sets.Weapons['Enspell'] ={
		main="Pukulatmuj +1",
		sub="Pukulatmuj",
	}

	sets.Weapons['Naegling'] ={
		main="Naegling",
		sub="Thibron",
	}

	sets.Weapons['Maxentius'] ={
		main="Maxentius",
		sub="Thibron",
	}

	sets.Weapons['Ullr'] = {
		range="Ullr",
		ammo="Beryllium Arrow",
	}

	sets.Weapons['Unlocked'] = {}

	--Shield used when melee and not dual wield.
	sets.Weapons.Shield = {
		sub="Sacro Bulwark",
	}

	sets.Weapons.Sleep = {
		-- sub="Caliburnus",
	}

	--Default arrow to use
	Ammo.RA = "Beryllium Arrow"
	Ammo.ACC = "Beryllium Arrow"

	-- ===================================================================================================================
	--		sets.Idle
	-- ===================================================================================================================

	-- Standard Idle set
	sets.Idle = {
		main="Colada",
		sub="Sacro Bulwark",
		ammo="Homiliary",
		head="Atrophy Chapeau +3",
		body="Shamash Robe",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Etiolation Earring",
		right_ear="Ethereal Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10','Phys. dmg. taken-10%',}},
	}
	sets.Idle.TP = sets.Idle
	sets.Idle.ACC = sets.Idle
	sets.Idle.DT = sets.Idle
	sets.Idle.PDL = sets.Idle
	sets.Idle.SB = sets.Idle
	sets.Idle.MEVA = sets.Idle
	sets.Idle.CRIT = sets.Idle
	sets.Idle.Enspell = sets.Idle
	sets.Idle.Resting = sets.Idle

	-- Set is only applied when sublimation is charging
	sets.Idle.Sublimation = set_combine(sets.Idle, {
		waist="Embla Sash", -- +3 Submlimation when active
	})

	-- Gear to swap out for Movement
	sets.Movement = {}

	-- Set to be used if you get 
	sets.Cursna_Received = {
		neck="Nicander's Necklace",
		waist="Gishdubar Sash",
	}

	-- ===================================================================================================================
	--		sets.OffenseMode
	-- ===================================================================================================================

	-- 'TP','ACC','DT','PDL','SB','Enspell'
	sets.OffenseMode = {
		ammo="Ginsen",
		head={ name="Taeon Chapeau", augments={'Accuracy+25','"Triple Atk."+2','DEX+10',}},
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Anu Torque",
		waist="Kentarch Belt +1",
		left_ear="Eabani Earring",
		right_ear="Sherida Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	
	sets.OffenseMode.TP = set_combine(sets.OffenseMode, { 
		ammo="Ginsen",
		head={ name="Taeon Chapeau", augments={'Accuracy+25','"Triple Atk."+2','DEX+10',}},
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Anu Torque",
		waist="Kentarch Belt +1",
		left_ear="Eabani Earring",
		right_ear="Sherida Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	})
	sets.OffenseMode.DT = set_combine(sets.OffenseMode, { 
		neck="Loricate Torque +1",
		right_ear="Sherida Earring",
		body="Malignance Tabard",
		hands="Nyame Gauntlets",
		legs="Malignance Tights",
		waist="Windbuffet Belt +1",
		left_ring="Defending Ring",
		right_ring="Patricius Ring",
	})
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode, { 
		neck="Anu Torque",
		right_ear="Sherida Earring",
		body="Ayanmo Corazza +2",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Carmine Greaves +1",
		waist="Windbuffet Belt +1",
		left_ring="Petrov Ring",
		right_ring="Ilabrat Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	})
	sets.OffenseMode.PDT = set_combine(sets.OffenseMode, { })
	sets.OffenseMode.MEVA = set_combine(sets.OffenseMode, { })

	sets.OffenseMode.SB = set_combine(sets.OffenseMode, { })

	sets.OffenseMode.CRIT = set_combine(sets.OffenseMode, { })

	sets.OffenseMode.Enspell = set_combine(sets.OffenseMode, {
		sub="Ammurapi Shield",
		range="Ullr",
		head="Aya. Zucchetto +2",
		body="Ayanmo Corazza +2",
		hands="Aya. Manopolas +2",
		legs="Carmine Cuisses +1",
		feet="Carmine Greaves +1",
		neck="Dls. Torque +2",
		waist="Windbuffet Belt +1",
		left_ear="Eabani Earring",
		right_ear="Digni. Earring",
		left_ring="Metamor. Ring +1",
		right_ring="Metamor. Ring +1",
		back="Ghostfyre Cape",
	})

	sets.DualWield = {
		waist="Reiki Yotai",
		left_ear="Eabani Earring",
	}

	sets.Enspell = {}

	sets.Saboteur = {hands="Leth. Ganth. +2",}

	sets.TreasureHunter = {
		ammo="Per. Lucky Egg",
		head="Volte Cap",
		hands="Volte Bracers",
		waist="Chaac Belt",
	}

	-- ===================================================================================================================
	--		sets.Precast
	-- ===================================================================================================================

	-- Used for Magic Spells
	sets.Precast = {}

	-- 42% Fast Cast is needed on RDM (Fast Cast IX - 38%)
	-- 10% is Quick Magic limit
	sets.Precast.FastCast = {
		ammo="Hasty Pinion +1",
		head="Viti. Chapeau +2",
		body="Atrophy Tabard +3",
		hands="Leyline Gloves",
		feet={name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
		neck="Unmoving Collar +1",
		waist="Witful Belt",
		left_ear="Loquac. Earring",
		right_ear="Malignance Earring",
		left_ring="Lebeche Ring",
		right_ring="Etana Ring",
		back="Perimede Cape",
	}

	-- Used for Enhancing Magic
	sets.Precast.Enhancing = set_combine(sets.Precast.FastCast, {})

	-- Used for Healing Magic
	sets.Precast.Cure = set_combine(sets.Precast.FastCast, {})

	sets.Precast.RA = set_combine(sets.Precast, {
		ammo=Ammo.RA,
	})

	-- Flurry
	sets.Precast.RA.Flurry = set_combine(sets.Precast.RA, {}) 

	-- Flurry II
	sets.Precast.RA.Flurry_II = set_combine( sets.Precast.RA.Flurry, {})

	sets.Precast.BlueMagic = set_combine (sets.Precast.FastCast, {})

	-- ===================================================================================================================
	--		sets.midcast
	-- ===================================================================================================================

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {})

	sets.Midcast.Utsusemi = set_combine(sets.Midcast, {})

	-- Ranged Attack Gear (Normal Midshot)
	sets.Midcast.RA = set_combine(sets.Midcast, {})

	-- Ranged Attack Gear (High Accuracy Midshot)
	sets.Midcast.RA.ACC = set_combine(sets.Midcast.RA, {
		ammo=Ammo.ACC,
	})

	-- Ranged Attack Gear (Physical Damage Limit)
	sets.Midcast.RA.PDL = set_combine(sets.Midcast.RA, {})

	-- Ranged Attack Gear (Critical Build)
	sets.Midcast.RA.CRIT = set_combine(sets.Midcast.RA, {})

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = {}

	-- Cure Set
	sets.Midcast.Cure = {
		main="Bunzi's Rod",
		sub="Sors Shield",
		ammo="Hasty Pinion +1",
		head="Kaykaus Mitra +1",
		body="Kaykaus Bliaut +1",
		hands="Kaykaus Cuffs +1",
		legs="Kaykaus Tights +1",
		feet="Kaykaus Boots +1",
		neck="Incanter's Torque",
		waist="Luminary Sash",
		left_ear="Beatific Earring",
		right_ear="Roundel Earring",
		left_ring="Menelaus's Ring",
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10','Phys. dmg. taken-10%',}},
	}

	sets.Midcast.Curaga = set_combine(sets.Midcast.Cure, {})

	-- Regen
	sets.Midcast.Regen = {
		feet="Bunzi's Sabots",
	}

	-- Enhancing Duration on SELF
	sets.Midcast.Enhancing = {
		main="Colada",
		sub="Ammurapi Shield",
		ammo="Staunch Tathlum +1",
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
		body="Atrophy Tabard +3",
		hands="Atrophy Gloves +3",
		legs="",
		feet="Leth. Houseaux +2",
		neck="Dls. Torque +2",
		waist="Olympus Sash",
		left_ear="Andoaa Earring",
		right_ear="Leth. Earring +1",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Ghostfyre Cape",
	}

	-- Enhancing Duration on OTHERS
	sets.Midcast.Enhancing.Others = set_combine(sets.Midcast.Enhancing, {
		head="Leth. Chappel +1",
		body="Lethargy Sayon +1",
		legs="Leth. Fuseau +2",
	})

	-- Spells that require SKILL - RDM only needs 500 or more except Temper II
	sets.Midcast.Enhancing.Skill = set_combine(sets.Midcast.Enhancing, {
		main="Pukulatmuj +1",
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
		hands="Atrophy Gloves +3",
		legs="",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Andoaa Earring",
		right_ear="Mimir Earring",
		back="Ghostfyre Cape",
	})

	-- used to boost Gain Spells
	sets.Midcast.Enhancing.Gain = set_combine(sets.Midcast.Enhancing, {
		hands="Viti. Gloves +2",
	})

	-- Elemental
	sets.Midcast.Enhancing.Elemental = set_combine(sets.Midcast.Enhancing, {})

	-- Status
	sets.Midcast.Enhancing.Status = set_combine(sets.Midcast.Enhancing, {})

	-- Blue Magic
	sets.Midcast.BlueMagic = {}
	sets.Midcast.BlueMagic.Skill = set_combine(sets.Midcast.Enhancing, {})
	sets.Midcast.BlueMagic.Nuke = set_combine(sets.Midcast.Enhancing, {})
	sets.Midcast.BlueMagic.Healing = set_combine(sets.Midcast.Cure, {})
	sets.Midcast.BlueMagic.ACC = set_combine(sets.Midcast.Enhancing, {})
	sets.Midcast.BlueMagic.Enmity = set_combine(sets.Enmity, {})

	-- Enfeebling
	sets.Midcast.Enfeebling = {
		main="Maxentius",
		sub="Ammurapi Shield",
		ammo="Regal Gem",
		head="Viti. Chapeau +2",
		body="Lethargy Sayon +1",
		hands="Kaykaus Cuffs +1",
		legs="Chironic Hose",
		feet="Vitiation Boots +2",
		neck="Dls. Torque +2",
		waist="Obstin. Sash",
		left_ear="Snotra Earring",
		right_ear="Malignance Earring",
		left_ring="Kishar Ring",
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	-- Skill Based ('Dispel','Aspir','Aspir II','Aspir III','Drain','Drain II','Drain III','Frazzle','Frazzle II','Stun','Poison','Poison II','Poisonga')
	sets.Midcast.Enfeebling.MACC = set_combine(sets.Midcast.Enfeebling, {
		range="Ullr",
		ammo=empty,
		head="Atrophy Chapeau +3",
		feet="Atrophy Boots",
		waist="Luminary Sash",
		left_ring="Stikini Ring +1",
	})

	-- Potency Basted ('Paralyze','Paralyze II','Slow','Slow II','Addle','Addle II','Distract','Distract II','Distract III','Frazzle III','Blind','Blind II')
	sets.Midcast.Enfeebling.Potency = set_combine(sets.Midcast.Enfeebling, {
		head="Atrophy Chapeau +3",
	})

	-- Duration Based ('Sleep','Sleep II','Sleepga','Sleepga II','Diaga','Dia','Dia II','Dia III','Bio','Bio II','Bio III','Silence','Gravity','Gravity II','Inundation','Break','Breakaga', 'Bind', 'Bind II')
	sets.Midcast.Enfeebling.Duration = set_combine(sets.Midcast.Enfeebling, { })

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		head="Umuthi Hat",
		legs="Shedir Seraweels",
		neck="Nodens Gorget",
		waist="Siegel Sash",
		left_ear="Earthcry Earring",
	})

	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1",
		waist="Emphatikos Rope",
		legs="Shedir Seraweels",
	})

	-- Spells that require SKILL - RDM only needs +500 skill except Temper II
	sets.Midcast["Temper II"] = set_combine(sets.Midcast.Enhancing, {
		hands="Viti. Gloves +2",
		legs="Atrophy Tights +3",
		neck="Incanter's Torque",
		left_ear="Mimir Earring",
		right_ear="Andoaa Earring",
		waist="Olympus Sash",
		back="Perimede Cape",
	})

	sets.Midcast["Diaga"] = set_combine (sets.Midcast.Enfeebling, sets.TreasureHunter)
	sets.Midcast["Dispelga"] = set_combine (sets.Midcast.Enfeebling, sets.TreasureHunter)

	sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {
		head="Amalric Coif +1",
		body="Viti. Tabard +2",
		legs="Leth. Fuseau +2",
	})

	sets.Midcast.Phalanx = set_combine(sets.Midcast.Enhancing.Skill, { })

	sets.Midcast.Dark = set_combine(sets.Midcast.Enfeebling, {})

	sets.Midcast.Dark.MACC = set_combine(sets.Midcast.Enfeebling.MACC, {})

	sets.Midcast.Dark.Absorb = set_combine(sets.Midcast.Enfeebling, {})

	sets.Midcast.Nuke = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		range=empty,
		ammo="Pemphredo Tathlum",
		head="Amalric Coif +1",
		body="Amalric Doublet +1",
		hands="Amalric Gages +1",
		legs="Amalric Slops +1",
		feet="Amalric Nails +1",
		neck="Sanctity Necklace",
		waist="Sacro Cord",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Metamor. Ring +1",
		right_ring="Freke Ring",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
	}

	sets.Midcast.Burst = set_combine(sets.Midcast.Nuke, {
		left_ring="Mujin Band",
		neck="Mizu. Kubikazari",
	})

	-- ===================================================================================================================
	--		sets.JA
	-- ===================================================================================================================

	-- Job Abilities
	sets.JA = {}
	sets.JA["Chainspell"] = {body="Viti. Tabard +2"}
	sets.JA["Saboteur"] = {hands="Leth. Ganth. +2"}
	sets.JA["Spontaneity"] = {}
	sets.JA["Stymie"] = {}
	sets.JA["Convert"] = {}
	sets.JA["Composure"] = {}

	-- Dancer JA Section
	sets.Flourish = set_combine(sets.Idle.DT, {})

	sets.Jig = set_combine(sets.Idle.DT, { })

	sets.Step = set_combine(sets.OffenseMode.DT, {})

	sets.Samba = set_combine(sets.Idle.DT, {})

	-------------------------------------------------------------------------------
	-- Waltz Potency gear caps at 50%, while Waltz received potency caps at 30%. -- 
	-------------------------------------------------------------------------------
	sets.Waltz = set_combine(sets.OffenseMode.DT, {})

	-- ===================================================================================================================
	--		sets.WS
	-- ===================================================================================================================

	sets.WS = {
		range=empty,
		ammo="Regal Gem",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Malignance Gloves",
		legs="Nyame Flanchard",
		feet="Leth. Houseaux +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Moonshade Earring",
		right_ear="Ishvara Earring",
		left_ring="Rufescent Ring",
		right_ring="Karieyh Ring",
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}

	sets.WS.ACC = set_combine(sets.WS, {})

	sets.WS.PDL = set_combine(sets.WS, {})

	sets.WS.WSD = set_combine(sets.WS, {})

	sets.WS.MAB = set_combine(sets.WS, {
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		body="Amalric Doublet +1",
		hands="Jhakri Cuffs +2",
		legs="Amalric Slops +1",
		feet="Amalric Nails +1",
		neck="Sanctity Necklace",
		waist="Refoccilation Stone",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Metamor. Ring +1",
		right_ring="Archon Ring",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
	})

	sets.WS.CRIT = set_combine(sets.WS,{})

	sets.WS.RA = set_combine(sets.WS,{})

	sets.WS.SB = sets.Subtle_Blow

	sets.WS["Seraph Blade"] =  set_combine(sets.WS.MAB, {})

	sets.WS["Sanguine Blade"] = set_combine(sets.WS.MAB, {})

	sets.WS["Aeolian Edge"] = set_combine(sets.WS.MAB, {})

	sets.WS["Red Lotus Blade"] = sets.WS.MAB

	sets.WS["Chant du Cygne"] = sets.WS.CRIT

	sets.WS["Savage Blade"] = set_combine(sets.WS.WSD, {
		neck="Dls. Torque +2",
		waist="Sailfi Belt +1",
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	})

	sets.WS["Black Halo"] = sets.WS.WSD

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
	if buffactive['Saboteur'] and spell.skill == 'Enfeebling Magic' then
		equipSet = sets.Saboteur
	end
	return equipSet
end

-- Augment basic equipment sets
function aftercast_custom(spell)
	local equipSet = {}

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

-- This function is called when the job file is unloaded
function user_file_unload()

end

--Function used to automate Job Ability use
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