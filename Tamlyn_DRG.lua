--Hurin

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "2"
MacroBook = "2"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

-- Set to true to run organizer on job changes
Organizer = false

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assign equipsets for them
state.OffenseMode:options('DT','TP','PDL','MEVA','ACC','SB','CRIT') -- ACC effects WS and TP modes
state.OffenseMode:set('DT')

--Modes for specific to Dragoon
state.WeaponMode:options('Trishula','Savage Blade','Shining One','Unlocked')
state.WeaponMode:set('Trishula')

-- Initialize Player
jobsetup(LockStylePallet,MacroBook,MacroSet)

function get_sets()

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Trishula'] = {
		main="Trishula",
		sub="Utu Grip",
	}

	sets.Weapons['Shining One'] = {
		main="Shining One",
		sub="Utu Grip",
	}

	sets.Weapons['Savage Blade'] = {
		main="Naegling",
	}

	-- This stops GS from chaning weapons (Abyssea Proc etc)
	sets.Weapons['Unlocked'] = {}

	sets.Weapons.Shield = {}

	-- Standard Idle set
	-- Missing
	-- Body Sacro Breastplate
	-- head Peltast's Mezail +2
	-- ear Sanare Earring
	-- ear Eabani Earring
	-- hands Gleti's Boots
	-- legs Gleti's Breeches
	-- feet Gleti's Gauntlets
	sets.Idle = {
		ammo="Staunch Tathlum +1",
		head="Sulevia's Mask +2",
		body="Dagon Breast.",
		hands="Sulev. Gauntlets +2",
		legs="Sulev. Cuisses +2",
		feet="Sulev. Leggings +2",
		neck="Dgn. Collar +2",
		waist="Carrier's Sash",
		left_ear="Genmei Earring",
		right_ear="Sherida Earring",
		left_ring="Shadow Ring",
		right_ring="Defending Ring",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%'}},
	}

	sets.Idle.Pet = set_combine(sets.Idle, {})
	sets.Idle.TP = set_combine(sets.Idle, {})
	sets.Idle.ACC = set_combine(sets.Idle, {})
	sets.Idle.DT = set_combine(sets.Idle, {})
	sets.Idle.PDL = set_combine(sets.Idle, {})
	sets.Idle.CRIT = set_combine(sets.Idle, {})
	sets.Idle.SB = set_combine(sets.Idle, {})
	sets.Idle.MEVA = set_combine(sets.Idle, {
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
	})
	sets.Idle.Resting = set_combine(sets.Idle, {})
	
	sets.Movement = {}

	-- Set to be used if you get 
	sets.Cursna_Received = {
		neck="Nicander's Necklace",
		waist="Gishdubar Sash",
	}

	-- Missing
	-- head Hjarrandi Helm
	-- ammo Coiste Bodhar
	-- body Peltast's plackart +1
	
	sets.OffenseMode = {
		ammo="Ginsen",
		head="Flam. Zucchetto +2",
		body="Dagon Breast.",
		hands="Acro Gauntlets",
		legs="Sulev. Cuisses +2",
		feet="Flam. Gambieras +2",
		neck="Anu Torque",
		waist="Ioskeha Belt +1",
		left_ear="Sherida Earring",
		right_ear="Sroda Earring",
		left_ring="Petrov Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%'}},
	}

	--Base TP set to build off
	sets.OffenseMode.TP = set_combine(sets.OffenseMode, {})

	sets.OffenseMode.DT = set_combine(sets.OffenseMode, {
		head="Hjarrandi Helm",
		hands="Pel. Vambraces +2",
		-- legs="Gleti's Breeches",
		feet="Pelt. Schyn. +2",
		neck="Dgn. Collar +2",
	})
	
	sets.OffenseMode.PDL = set_combine(sets.OffenseMode, {
	    -- head="Gleti's Mask",
		-- body="Gleti's Cuirass",
		-- hands="Gleti's Gauntlets",
		-- legs="Gleti's Breeches",
		-- feet="Gleti's Boots",
	})

	sets.OffenseMode.CRIT = set_combine(sets.OffenseMode, {
	    -- head="Gleti's Mask",
		-- body="Gleti's Cuirass",
		-- hands="Gleti's Gauntlets",
		-- legs="Gleti's Breeches",
		-- feet="Gleti's Boots",
	})

	-- With 29 Auspice 70 Subtle Blow
	sets.OffenseMode.SB =  set_combine(sets.OffenseMode, {
		left_ear="Sherida Earring", -- SB II 5
		body="Dagon Breast.", -- SB II 10
		left_ring="Niqmaddu Ring", -- SB 5
		-- legs="Gleti's Breeches", -- SB 15
	})

	sets.OffenseMode.ACC = set_combine(sets.OffenseMode, {})

	sets.OffenseMode.MEVA = set_combine(sets.OffenseMode, {
		-- head="Peltast's Mezail +2",
		-- body="Gleti's Cuirass",
		hands="Pel. Vambraces +2",
		legs="Pelt. Cuissots +2",
		feet="Pelt. Schyn. +2",
		neck="Dgn. Collar +2",
	})
  
	sets.DualWield = {}

	sets.Precast = {}

	-- Used for Magic Spells (Fast Cast)
	sets.Precast.FastCast = {
	}
		
	sets.Enmity = {}

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {})
	sets.Midcast.Enhancing = set_combine(sets.Idle, {})
	sets.Midcast.Enfeebling = set_combine(sets.Idle, {})
	
	--Job Abilities
	sets.JA = {}
	sets.JA["Berserk"] = {}
	sets.JA["Warcry"] = {}
	sets.JA["Defender"] = {}
	sets.JA["Aggressor"] = {}
	sets.JA["Provoke"] = sets.Precast.Enmity
	sets.JA["Third Eye"] = {}
	sets.JA["Meditate"] = {}
	sets.JA["Warding Circle"] = {}
	sets.JA["Hasso"] = {}
	sets.JA["Seigan"] = {}
	sets.JA['Call Wyvern'] = {
		body="Ptero. Mail +2",
	}
	sets.JA['Spirit Surge'] = {
		body="Ptero. Mail +2",
		legs="Vishap Brais +3",
		--feet={ name="Ptero. Greaves +3", augments={'Enhances "Empathy" effect',}},
		neck="Dgn. Collar +2",
	}
	sets.JA['Ancient Circle'] = {
		legs="Vishap Brais +3",
	}
	sets.JA['Spirit Link'] = {
		head="Vishap Armet +2",
		-- hands="Pel. Vambraces +3",
		-- feet={ name="Ptero. Greaves +3", augments={'Enhances "Empathy" effect',}},
		neck="Dgn. Collar +2",
	}

	-- Missing
	-- feet Maenadic Gambieras
	-- ammo Coiste Bodhar
	-- head Ptero. Armet +3
	-- body Ptero. Mail +3
	sets.Jump = {
		ammo="Ginsen",
		head="Ptero. Armet +1",
		body="Ptero. Mail +2",
		hands="Vis. Fng. Gaunt. +2",
		legs="Ptero. Brais +2",
		feet="Ostro Greaves",
		neck="Vim Torque +1",
		waist="Ioskeha Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Petrov Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%'}},
	}

	sets.JA['Jump'] = set_combine(sets.Jump, {})

	sets.JA['High Jump'] = set_combine(sets.Jump, {})

	sets.JA['Spirit Jump'] = set_combine(sets.Jump, {
		-- legs="Pelt. Cuissots +2",
		-- feet="Pelt. Schyn. +2",
	})

	sets.JA['Soul Jump'] = set_combine(sets.Jump, {
		-- legs="Pelt. Cuissots +2",
	})
	
	sets.JA['Super Jump'] = set_combine(sets.Jump, {
	})
	
	sets.JA['Angon'] = {
		ammo="Angon",
		hands="Ptero. Fin. G. +2",
	}

		-- Wyvern Ability Gear Sets Below
	sets.Pet_Midcast = {}

	sets.Pet_Midcast['Steady Wing'] = {}

	sets.Pet_Midcast['Smiting Breath'] = {
		--head={ name="Ptero. Armet +3", augments={'Enhances "Deep Breathing" effect',}},
		neck="Dgn. Collar +2",
	}

	sets.Pet_Midcast['Restoring Breath'] = {
		head="Ptero. Armet +1",
		legs="Vishap Brais +2",
		--feet={ name="Ptero. Greaves +3", augments={'Enhances "Empathy" effect',}},
		neck="Dgn. Collar +2",
	}

	sets.Pet_Midcast.Breath = {
		head="Ptero. Armet +1",
		neck="Dgn. Collar +2",
	}

	sets.Pet_Midcast['Flame Breath'] = sets.Pet_Midcast.Breath
	sets.Pet_Midcast['Frost Breath'] = sets.Pet_Midcast.Breath
	sets.Pet_Midcast['Sand Breath'] = sets.Pet_Midcast.Breath
	sets.Pet_Midcast['Gust Breath'] = sets.Pet_Midcast.Breath
	sets.Pet_Midcast['Hydro Breath'] = sets.Pet_Midcast.Breath
	sets.Pet_Midcast['Lightning Breath'] = sets.Pet_Midcast.Breath
	 
	-- Used to Tag TH on a mob (TH4 is max in gear non-THF)
	sets.TreasureHunter = {
		waist="Chaac Belt",
	}

	--WS Sets
	sets.WS = {
		ammo="Knobkierrie",
		head="Flam. Zucchetto +2",
		body="Sulevia's Plate. +2",
		hands="Sulev. Gauntlets +2",
		legs="Sulev. Cuisses +2",
		feet="Flam. Gambieras +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Moonshade Earring",
		right_ear="Sherida Earring",
		left_ring="Karieyh Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%'}},
	}

	sets.WS.ACC = set_combine(sets.WS, {})

	sets.WS.PDL = set_combine(sets.WS, {
		-- body="Gleti's Cuirass",
		-- hands="Gleti's Gauntlets",
		-- legs="Gleti's Breeches",
	})

	sets.WS.WSD = set_combine(sets.WS, {
		right_ear="Thrud Earring",
		hands="Ptero. Fin. G. +2",
	})

	sets.WS.CRIT = {
		ammo="Coiste Bodhar",
		-- head="Gleti's Mask",
		-- body="Gleti's Cuirass",
		-- hands="Gleti's Gauntlets",
		-- legs="Gleti's Breeches",
		-- feet="Gleti's Boots",
		neck="Dgn. Collar +2",
		waist="Fotia Belt",
		left_ear="Moonshade Earring",
		right_ear="Sherida Earring",
		left_ring="Karieyh Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%'}},
	}

	-- Impulse Drive
	sets.WS['Impulse Drive'] = set_combine(sets.WS.CRIT, {
		ammo="Knobkierrie",
		head="Peltast's Mezail +2",
		right_ear="Thrud Earring",
		hands="Ptero. Fin. G. +2",
		legs="Pelt. Cuissots +2",
		-- feet="Nyame Sollerets",
		waist="Sailfi Belt +1",
	})
	sets.WS['Impulse Drive']['PDL'] = set_combine(sets.WS.CRIT, {
	})

	-- Savage Blade
	sets.WS['Savage Blade'] = set_combine(sets.WS.WSD, {})
	sets.WS['Savage Blade']['PDL'] = set_combine(sets.WS.WSD, {
	})

	-- Geirskogul
	sets.WS['Geirskogul'] = set_combine(sets.WS, {
		neck="Fotia Gorget",
		left_ear="Sherida Earring",
	})
	sets.WS['Geirskogul']['PDL'] = set_combine(sets.WS, {
	})

	-- Drakesbane
	sets.WS['Drakesbane'] = set_combine(sets.WS, {
	})
	sets.WS['Drakesbane']['PDL'] = set_combine(sets.WS, {
	})

	-- Camlann's Torment
	sets.WS["Camlann's Torment"] = set_combine(sets.WS, {
		waist="Fotia Belt",
	})
	sets.WS["Camlann's Torment"]['PDL'] = set_combine(sets.WS, {
		right_ear="Thrud Earring",
		body="Gleti's Cuirass",
		legs="Gleti's Breeches",
	})

	-- Stardiver
	sets.WS['Stardiver'] = set_combine(sets.WS, {
	})
	sets.WS['Stardiver']['PDL'] = set_combine(sets.WS.CRIT, {
	})

	sets.WS['Sonic Thrust'] = sets.WS.CRIT
	sets.WS['Raiden Thrust'] = sets.WS.WSD
	sets.WS['Thunder Thrust'] = sets.WS.WSD
	sets.WS['Leg Sweep'] = sets.WS.WSD
	sets.WS['Diarmuid'] = sets.WS.WSD
	
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
--Function is called when a lua is unloaded
function user_file_unload()

end

--Function used to automate Job Ability use
function check_buff_JA()
	local buff = 'None'
	local ja_recasts = windower.ffxi.get_ability_recasts()

	if player.sub_job == 'SAM' and player.sub_job_level == 49 then
		if not buffactive['Hasso'] and not buffactive['Seigan'] and ja_recasts[138] == 0 then
			buff = "Hasso"
		elseif not buffactive['Meditate'] and ja_recasts[134] == 0 then
			buff = "Meditate"
		end
	end

	if player.sub_job == 'WAR' and player.sub_job_level == 49 then
		if not buffactive['Berserk'] and ja_recasts[1] == 0 then
			buff = "Berserk"
		elseif not buffactive['Aggressor'] and ja_recasts[4] == 0 then
			buff = "Aggressor"
		elseif not buffactive['Warcry'] and ja_recasts[2] == 0 then
			buff = "Warcry"
		end
	end

	return buff
end

function check_buff_SP()
	local buff = 'None'
	--local sp_recasts = windower.ffxi.get_spell_recasts()
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