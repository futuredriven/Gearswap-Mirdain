-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "3"
MacroBook = "10"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Grape Daifuku"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

-- Set to true to run organizer on job changes
Organizer = true

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assign equipsets for them
state.OffenseMode:options('DT','TP','PDL','ACC','SB') -- ACC effects WS and TP modes
state.OffenseMode:set('TP')

--Weapon Modes
state.WeaponMode:options('Apocalypse','Ragnarok','Naegling','Loxotic Mace','Dolichenus')
state.WeaponMode:set('Ragnarok')

-- Initialize Player
jobsetup(LockStylePallet,MacroBook,MacroSet)

function get_sets()

	sets.Weapons = {}

	sets.Weapons['Apocalypse'] = {
		main="Apocalypse",
		sub="Utu Grip",
	}

	sets.Weapons['Ragnarok'] = {
		main="Ragnarok",
		sub="Utu Grip",
	}

	sets.Weapons['Naegling'] = {
		main="Naegling",
		sub="Ternion Dagger +1",
	}

	sets.Weapons['Loxotic Mace'] = {
		main="Loxotic Mace +1",
		sub="Blurred Shield +1",
	}

	sets.Weapons['Dolichenus'] = {
		main="Dolichenus",
		sub="Ternion Dagger +1",
	}

	sets.Weapons.Shield = 
	{
		sub="Blurred Shield +1",
	}

	-- Missing
	sets.Idle = {
		ammo="Staunch Tathlum +1",
		head="Sulev. Mask +2",
		-- head="Sakpata's Helm",
		body="Dagon Breast.",
		-- body="Sakpata's Plate",
		hands="Sulev. Gauntlets +2",
		-- hands="Sakpata's Gauntlets",
		legs="Sulev. Cuisses +2",
		-- legs="Sakpata's Cuisses",
		feet="Sulev. Leggings +2",
		-- feet="Sakpata's Leggings",
		neck="Abyssal Beads +2",
		waist="Sailfi Belt +1",
		left_ear="Genmei Earring",
		right_ear="Telos Earring",
		left_ring="Moonlight Ring",
		right_ring="Defending Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','\"Dbl.Atk.\"+10','Damage taken-5%',}},
	}

	sets.Idle.TP = set_combine(sets.Idle, {})
	sets.Idle.ACC = set_combine(sets.Idle, {})
	sets.Idle.DT = set_combine(sets.Idle, {})
	sets.Idle.PDL = set_combine(sets.Idle, {})
	sets.Idle.SB = set_combine(sets.Idle, {})
	sets.Idle.Resting = set_combine(sets.Idle, {})
	sets.Idle.MEVA = set_combine(sets.Idle, {
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
	})
	
	sets.Movement = {}

	-- Set to be used if you get 
	sets.Cursna_Received = {
		neck="Nicander's Necklace",
		waist="Gishdubar Sash",
	}

	-- This caps with Auspice from WHM
	sets.Subtle_Blow = {
		body="Dagon Breast.",
		-- feet="Sakpata's Leggings",
		-- hands="Sakpata's Gauntlets",
		right_ring="Niqmaddu Ring",
	}

	-- Max HP for Dread Spikes
	sets.Max_HP = {
		ammo="Staunch Tathlum +1",
		head="Ratri Sallet",
		body="Heath. Cuirass +1",
		hands="Rat. Gadlings",
		legs="Ratri Cuisses",
		feet="Rat. Sollerets",
		neck="Unmoving Collar +1",
		waist="Oneiros Belt",
		left_ear="Odnowa Earring +1",
		right_ear="Tuisto Earring",
		left_ring="Moonlight Ring",
		right_ring="Gelatinous Ring +1",
		back={ name="Ankou's Mantle", augments={'HP+60','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}

	-- Missing
	-- ammo Coiste Bodhar
	sets.OffenseMode = {
		ammo="Ginsen",
		head="Flam. Zucchetto +2",
		body="Flamma Korazin +2",
		hands="Sulev. Gauntlets +2",
		legs="Ig. Flanchard +2",
		feet="Flam. Gambieras +2",
		neck="Abyssal Beads +2",
		waist="Ioskeha Belt +1",
		left_ear="Cessance Earring",
		right_ear="Telos Earring",
		left_ring="Petrov Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','\"Dbl.Atk.\"+10','Damage taken-5%',}},
	}

	--Base TP set to build off
	sets.OffenseMode.TP = set_combine(sets.OffenseMode, {

	})

	sets.OffenseMode.DT = set_combine(sets.OffenseMode, {
		head="Hjarrandi Helm",
		body="Hjarrandi Breast.",
		feet="Sakpata's Leggings",
		-- neck="Null Loop",
		-- left_ring="Lehko's Ring",
	})
	
	--Same TP set but WSD can be altered also
	sets.OffenseMode.PDL = set_combine(sets.OffenseMode, {

	})

	sets.OffenseMode.ACC = set_combine(sets.OffenseMode,{ })
	sets.OffenseMode.PDT = set_combine(sets.OffenseMode, { })
	sets.OffenseMode.MEVA = set_combine(sets.OffenseMode, { })
	sets.OffenseMode.SB =  set_combine(sets.OffenseMode, {
		head="Hjarrandi Helm",
		body="Hjarrandi Breast.",
		feet="Sakpata's Leggings",
		-- neck="Null Loop",
		left_ear="Tuisto Earring",
		-- left_ring="Lehko's Ring",
	})

	sets.DualWield = {}

	sets.Precast = {}

	-- Used for Magic Spells (Fast Cast)
	-- Missing
	sets.Precast.FastCast = {
		ammo="Sapience Orb", -- 2
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, -- 14
		body="Fallen's cuirass +1", -- 10
		hands="Leyline Gloves", -- 5
		legs="Eschite Cuisses", -- 5
		feet={ name="Odyssean Cuisses", augments={'Mag. Acc.+7 "Mag.Atk.Bns."+7','"Fast Cast"+5','CHR+9','Mag. Acc.+4','"Mag.Atk.Bns."+14',}}, -- 10
		neck="Voltsurge Torque", -- 4
		-- left_ear="Malignance Earring", -- 4
		right_ear="Loquac. Earring", -- 1
		-- left_ring="Rahab Ring" -- 2
		left_ring="Lebeche Ring",
		right_ring="Kishar Ring", -- 4
		back={ name="Ankou's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','\"Fast Cast\"+10','Damage taken-5%',}}, -- 10
	}
		
	sets.Enmity = {}

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {})
	sets.Midcast.SIRD = set_combine(sets.Midcast, {})
	sets.Midcast.Enhancing = set_combine(sets.Midcast, {})

	sets.Midcast.Enfeebling = set_combine(sets.Midcast, {})
	sets.Midcast.Enfeebling.MACC = set_combine(sets.Midcast.Enfeebling, {})
	sets.Midcast.Enfeebling.Potency = set_combine(sets.Midcast.Enfeebling, {})
	sets.Midcast.Enfeebling.Duration = set_combine(sets.Midcast.Enfeebling, {})
	sets.Midcast.Enfeebling.Drain = set_combine(sets.Midcast.Enfeebling, {})
	sets.Midcast.Enfeebling.Aspir = set_combine(sets.Midcast.Enfeebling, {})

	sets.Midcast.Dark = set_combine(sets.Midcast.Enfeebling, {})
	sets.Midcast.Dark.MACC = set_combine(sets.Midcast.Enfeebling.MACC, {})
	sets.Midcast.Dark.Absorb = set_combine(sets.Midcast.Enfeebling, {})
	sets.Midcast.Dark.Enhancing = set_combine(sets.Midcast.Enhancing, {})
	
	--Job Abilities
	sets.JA = {}
	sets.JA["Provoke"] = sets.Precast.Enmity
	sets.JA["Blood Weapon"] = {}
	sets.JA["Souleater"] = {}
	sets.JA["Arcane Circle"] = {}
	sets.JA["Weapon Bash"] = {}
	sets.JA["Nether Void"] = {}
	sets.JA["Arcane Crest"] = {}
	sets.JA["Scarlet Delirium"] = {}
	sets.JA["Soul Enslavement"] = {}
	sets.JA["Consume Mana"] = {}


	--WS Sets
	sets.WS = {
		ammo="Knobkierrie",
		head="Ratri Sallet",
		body="Ignominy Cuirass +3",
		hands="Ratri Gadlings",
		legs="Ratri Cuisses",
		feet="Sulev. Leggings +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Ishvara Earring",
		right_ear="Moonshade Earring",
		left_ring="Karieyh Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	}

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = set_combine(sets.WS, {})

	sets.WS.PDL = set_combine(sets.WS, {})

	sets.WS.WSD = set_combine(sets.WS, {})

	sets.WS.CRIT = set_combine(sets.WS, {})

	sets.WS.Multi_Hit = set_combine(sets.WS, {})

	sets.WS.SB = sets.Subtle_Blow

	--Missing
	sets.WS['Catastrophe'] = set_combine(sets.WS, {
		legs="fallen's flanchard +1",
		right_ear="Thrud Earring",
		neck="Abyssal Beads +2",
		waist="Sailfi Belt +1",
		-- left_ring="Regal Ring",
	})

	sets.WS['Origin'] = set_combine(sets.WS, { 
		right_ear="Thrud Earring",
		neck="Abyssal Beads +2",
		waist="Sailfi Belt +1",
	})

	-- Missing
	sets.WS['Entropy'] = set_combine(sets.WS, { 
		-- head="Hjarrandi Helm"
		-- ammo="Coiste Bodhar",
		-- left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
	})

	sets.WS['Quietus'] = set_combine(sets.WS, { 
		neck="Abyssal Beads +2",
		waist="Sailfi Belt +1",
	})

	sets.WS['Cross Reaper'] = set_combine(sets.WS, { 
		right_ear="Thrud Earring",
		neck="Abyssal Beads +2",
		waist="Sailfi Belt +1",
		-- left_ring="Regal Ring",
	})

	sets.WS['Insurgency'] = set_combine(sets.WS, { 
		right_ear="Thrud Earring",
		neck="Abyssal Beads +2",
		waist="Sailfi Belt +1",
		-- left_ring="Regal Ring",
	})

	sets.WS['Torcleaver'] = set_combine(sets.WS, { 
		right_ear="Thrud Earring",
		neck="Abyssal Beads +2",
		waist="Sailfi Belt +1",
	})

	sets.WS['Fimbulvetr'] = set_combine(sets.WS, { 
		right_ear="Thrud Earring",
		neck="Abyssal Beads +2",
		waist="Sailfi Belt +1",
		-- left_ring="Regal Ring",
	})

	sets.WS['Scourge'] = set_combine(sets.WS, { 
		left_ear="Thrud Earring",
		neck="Abyssal Beads +2",
		waist="Sailfi Belt +1",
		-- left_ring="Regal Ring",
	})

	-- Missing
	sets.WS['Resolution'] = set_combine(sets.WS, {
		-- ammo="Aurgelmir Orb +1"
		head="Flam. Zucchetto +2",
		legs="Ig. Flanchard +2",
		neck="Abyssal Beads +2",
		left_ear="Cessance Earring",
		back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','\"Dbl.Atk.\"+10','Damage taken-5%',}},
	})

	sets.WS['Judgment'] = set_combine(sets.WS, { 
		right_ear="Thrud Earring",
		neck="Abyssal Beads +2",
		waist="Sailfi Belt +1",
	})


	-- Used to Tag TH on a mob (TH4 is max in gear non-THF)
	sets.TreasureHunter = {
		waist="Chaac Belt",
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
	if spell.name == "Dread Spikes" then
		equipSet = set_combine( sets.Max_HP, { main="Crepuscular Scythe" })
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