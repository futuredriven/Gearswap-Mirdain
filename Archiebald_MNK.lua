
--Turin

-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "3"
MacroBook = "7"
MacroSet = "1"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them ( Idle.X and OffenseMode.X )
state.OffenseMode:options('TP','ACC','DT','PDL','SB','MEVA','CRIT') -- ACC effects WS and TP modes

--Set Mode to Damage Taken as Default
state.OffenseMode:set('DT')

--Modes for weapons.  You must define the set in sets.Weapons['X']
state.WeaponMode:options('Godhands','Pole')
state.WeaponMode:set('Godhands')

-- Initialize Player
jobsetup(LockStylePallet,MacroBook,MacroSet)

function get_sets()

	-- Weapon sets
	sets.Weapons['Godhands'] = {
		main="Godhands",
	}
	sets.Weapons['Pole'] = {
		main="Malignance Pole",
		sub="Kupayopl",
	}

	sets.Weapons.Shield = {}
	sets.Weapons.Sleep = {}

	-- Idle sets
	-- Missing
	sets.Idle = {
		ammo="Staunch Tathlum +1",
		head="Mpaca's Cap",
		--head="Null Masque",
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Bathy Choker +1",
		waist="Moonbow Belt +1",
		left_ear="Infused Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Chirich Ring +1",
		right_ring="Karieyh Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}
	sets.Idle.Resting = set_combine(sets.Idle, {})
	sets.Idle.TP = set_combine(sets.Idle, {})
	sets.Idle.ACC = set_combine(sets.Idle, {})
	sets.Idle.DT = set_combine(sets.Idle, {})
	sets.Idle.PDL = set_combine(sets.Idle, {})
	sets.Idle.SB = set_combine(sets.Idle, {})
	sets.Idle.CRIT = set_combine(sets.Idle, {})
	sets.Idle.MEVA = set_combine(sets.Idle, {
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
	})

	-- Engaged Sets
	sets.OffenseMode = {}
	sets.OffenseMode.TP = {
		ammo="Coiste Bodhar",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		legs="Mpaca's Hose",
		feet="Malignance Boots",
		neck="Mnk. Nodowa +2",
		waist="Moonbow Belt +1",
		left_ear="Sherida Earring",
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
	}

	sets.OffenseMode.ACC = set_combine(sets.OffenseMode.TP,{
		body="Bhikku Cyclas +2",
	})

	sets.OffenseMode.DT = set_combine(sets.OffenseMode.TP,{})

	sets.OffenseMode.PDL = set_combine(sets.OffenseMode.DT,{
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	})

	--This set is used when OffenseMode is SB and Enaged (Augments the TP base set)
	-- MNK gets 35 Native Subtle Blow
	-- Cap is 75% - 50% caps either I or II
	sets.OffenseMode.SB = set_combine(sets.OffenseMode[state.OffenseMode.value], {
		waist="Moonbow Belt +1", -- SB II 15
		left_ear="Sherida Earring", -- SB II 5
		left_ring="Niqmaddu Ring", -- SB II 5
		right_ring="Chirich Ring +1", -- SB 10
		ammo="Coiste Bodhar", -- SB 3
		right_ear="Mache Earring +1",
	}) -- 35 + 16% SB I + %25 SB II = 76 one under

	sets.OffenseMode.MEVA = set_combine(sets.OffenseMode.DT,{
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
	})

	sets.OffenseMode.CRIT = set_combine(sets.OffenseMode,{})

	-- Augments the OffenseMode when in DT stance
	sets.Foot_Work = { feet="Anch. Gaiters +3", }

	--Used to swap into movement gear when the player is detected movement when not engaged
	sets.Movement = {}

	--Impetus set has priority over any other modes
	sets.Impetus = {
		body="Bhikku Cyclas +2",
	}

	sets.Boost = {
		waist="Ask Sash",
	}

	-- Set to be used if you get cursed
	sets.Cursna_Received = {
		neck="Nicander's Necklace",
		waist="Gishdubar Sash",
	}

	sets.Enmity = {
		ammo="Sapience Orb", -- 2
		neck="Moonlight Necklace", -- 15
		body="Emet Harness +1", -- 10
		hands="Kurys Gloves", -- 9
		legs="Bhikku Hose +2",
		--feet="Ahosi Leggings", -- 7
		left_ear="Cryptic Earring", -- 4
		right_ear="Trux Earring", -- 5
		left_ring="Eihwaz Ring", -- 5
		right_ring="Petrov Ring", -- 4
	} -- 61

	-- Used for Magic Spells
	sets.Precast = {}
	sets.Precast.FastCast = {
		ammo="Sapience Orb", -- 2
		head={ name="Herculean Helm", augments={'"Fast Cast"+6','INT+2',}}, --13
		body={ name="Taeon Tabard", augments={'"Fast Cast"+5',}}, --9
		hands="Leyline Gloves", --8
		legs={ name="Herculean Trousers", augments={'"Fast Cast"+5','INT+1','Mag. Acc.+2',}}, --6
		left_ear="Etiolation Earring", --1
		right_ear="Loquac. Earring", --2
		left_ring="Prolix Ring", --3
		back={ name="Segomo's Mantle", augments={'"Fast Cast"+10',}}, --10
	} -- FC 54

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {
	
	})

	sets.JA = {}
	sets.JA["Hundred Fists"] = {legs="Hes. Hose +3"}
	sets.JA["Berserk"] = {}
	sets.JA["Warcry"] = {}
	sets.JA["Defender"] = {}
	sets.JA["Aggressor"] = {}
	sets.JA["Provoke"] = sets.Enmity
	sets.JA["Focus"] = {}
	sets.JA["Dodge"] = {}
	-- Missing
	sets.JA["Chakra"] = {
		-- ammo="Aurgelmir Orb +1",
		-- head="Null Masque",
		body="Anch. Cyclas +2",
		hands="Hes. Gloves +3",
		legs="Nyame Flanchard",
		feet="Bhikku Gaiters +2",
		neck="Unmoving Collar +1",
		-- waist="Latria sash",
		left_ear="Tuisto Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Regal Ring",
		right_ring="Gelatinous Ring +1",
		back={ name="Segomo's Mantle", augments={'VIT+20','VIT+10',}},
	}
	sets.JA["Boost"] = {}
	sets.JA["Counterstance"] = {}
	sets.JA["Chi Blast"] = {
		head="Hes. Crown",
	}
	sets.JA["Mantra"] = {}
	sets.JA["Footwork"] = {}
	sets.JA["Perfect Counter"] = {}
	sets.JA["Impetus"] = {}
	sets.JA["Inner Strength"] = {}

	--Default WS set base
	sets.WS = { -- VS Base with Impetus Down
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear="Schere Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	}

	-- 35% SB I for MNK
	-- Belt SB II 15%
	-- Mpaca Legs -- SB II 5%
	-- Earring / Ring SB II 10%
	-- Need 4% SB
	sets.WS.SB = set_combine( sets.WS, { -- This maximize SB
		waist="Moonbow Belt +1", -- SB II 15
		left_ear="Sherida Earring", -- SB II 5
		left_ring="Niqmaddu Ring", -- SB II 5
		legs="Mpaca's Hose", -- SB II 5
		ammo="Coiste Bodhar", -- SB 3
		right_ear="Schere Earring", -- SB 3
	})

	sets.WS.MEVA = set_combine( sets.WS, {
		neck="Warder's Charm +1",
		left_ring="Defending Ring",
	})

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = set_combine(sets.WS,{})

	sets.WS.PDL = set_combine(sets.WS,{})

	sets.WS.Kicks = {}

	--WS Sets
	sets.WS["Combo"] = set_combine(sets.WS,{})
	sets.WS["Shoulder Tackle"] = set_combine(sets.WS,{})
	sets.WS["One Inch Punch"] = set_combine(sets.WS,{})
	sets.WS["Backhand Blow"] = set_combine(sets.WS,{})
	sets.WS["Raging Fists"] = set_combine(sets.WS,{
		body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		neck="Mnk. Nodowa +2",
		waist="Moonbow Belt +1",
		right_ear="Moonshade Earring",
	})
	sets.WS["Spinning Attack"] = set_combine(sets.WS,{})
	sets.WS["Howling Fist"] = set_combine(sets.WS,{
		neck="Fotia Gorget",
		waist="Moonbow Belt +1",
	})
	sets.WS["Dragon Kick"] = sets.WS.Kicks
	sets.WS["Asuran Fists"] = set_combine(sets.WS,{})
	sets.WS["Tornado Kick"] = sets.WS.Kicks
	sets.WS["Victory Smite"] = set_combine(sets.WS,{})
	-- Missing
	sets.WS["Shijin Spiral"] = set_combine(sets.WS,{
		-- ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",
		-- body="Malignance Tabard",
		-- hands="Malignance Gloves",
		legs="Hes. Hose +3",
		waist="Moonbow Belt +1",
		right_ear="Mache Earring +1",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}},
	})

	sets.TreasureHunter = {
		ammo="Per. Lucky Egg",
		-- body="Volte Jupon",
		feet="Volte Boots",
		hands="Volte Bracers",
		head="Volte Cap",
		legs="Volte Hose",
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
	if spell.type == 'WeaponSkill' then
		if buffactive.Impetus then
			equipSet = sets.Impetus
		end	
	end
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

	return choose_gear()
end

-- Called when the pet dies or is summoned
function pet_change_custom(pet,gain)
	local equipSet = {}

	return equipSet
end

-- Called during a pet midcast
function pet_midcast_custom(spell)
	local equipSet = {}

	return equipSet
end

-- Called after the performs an action
function pet_aftercast_custom(spell)
	local equipSet = {}

	return equipSet
end

--Function is called when the player gains or loses a buff
function buff_change_custom(name,gain)
	local equipSet = {}

	return choose_gear()
end

--This function is called when a update request the correct equipment set
function choose_set_custom()
	local equipSet = {}

	return choose_gear()
end

--Function is called when the player changes states
function status_change_custom(new,old)
	local equipSet = {}

	return choose_gear()
end

--Function is called when a self command is issued
function self_command_custom(command)

end

--Custom Function
function choose_gear()
	local equipSet = {}
	if player.status == "Engaged" then
		if buffactive['Impetus'] then
			equipSet = sets.Impetus
		end	
		if buffactive['Footwork'] then
			equipSet = set_combine(equipSet, sets.Foot_Work)
		end	
	end
	if buffactive['Boost'] then
		equipSet = set_combine(equipSet, sets.Boost)
	end
	return equipSet
end

function check_buff_JA()
	local buff = 'None'
	local ja_recasts = windower.ffxi.get_ability_recasts()

	-- Sub job has least priority
	if player.sub_job == 'WAR' then
		if not buffactive['Berserk'] and ja_recasts[1] == 0 then
			buff = "Berserk"
		elseif not buffactive['Aggressor'] and ja_recasts[4] == 0 then
			buff = "Aggressor"
		elseif not buffactive['Warcry'] and ja_recasts[2] == 0 then
			buff = "Warcry"
		end
	end

	-- Mantra Max priority
	if player.hpp < 51 and ja_recasts[15] == 0 then
		buff = "Chakra"
	elseif not buffactive.Impetus and ja_recasts[31] == 0 then
		buff = "Impetus"
	elseif not buffactive.Footwork and ja_recasts[21] == 0 then
		buff = "Footwork"
	elseif not buffactive.Mantra and ja_recasts[19] == 0 then
		buff = "Mantra"
	elseif not buffactive.Dodge and ja_recasts[14] == 0 then
		buff = "Dodge"
	elseif not buffactive.Focus and ja_recasts[13] == 0 then
		buff = "Focus"
	end

	return buff
end

function check_buff_SP()
	local buff = 'None'
	--local sp_recasts = windower.ffxi.get_spell_recasts()
	return buff
end

-- This function is called when the job file is unloaded
function user_file_unload()

end