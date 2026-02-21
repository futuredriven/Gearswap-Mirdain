
--Turin

-- Load and initialize the include file.
include('Mirdain-Include')

-- Use "gs c food" to use the specified food item 
Food = "Miso Ramen"

BlueNuke = S{'Spectral Floe','Entomb', 'Magic Hammer', 'Tenebral Crush'}
BlueHealing = S{'Magic Fruit'}
BlueSkill = S{'Occultation','Erratic Flutter','Nature\'s Meditation','Cocoon','Barrier Tusk','Metallic Body','Mighty Guard'}
BlueTank = S{'Jettatura','Geist Wall','Blank Gaze','Sheep Song','Sandspin','Healing Breeze'}

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assigne equipsets for them
state.OffenseMode:options('TP','ACC','DT','MEVA','Parry') -- ACC effects WS and TP modes

--Set Mode to Damage Taken as Default
state.OffenseMode:set('DT')

-- Function used to change pallets based off sub job and modes
function Macro_Sub_Job()
	local macro = 1
	if player.sub_job == "BLU" then
		state.OffenseMode:set('DT')
		--Set you macro pallet for when you are /BLU
		macro = 1
		send_command('wait 2;aset set tanking')
	else
		state.OffenseMode:set('TP')
		--Set you macro pallet for when you are NOT /BLU
		macro = 1
	end
	return macro
end

Buff_Delay = 5 -- Used this to slow down auto buffing
Tank_Delay = 5 -- delays between tanking actions (only used when auto-buffing enabled and target locked on)

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "12"
MacroBook = "12"
MacroSet = Macro_Sub_Job()

--Modes for specific to Paladin.  These are defined below in "Weapons".
state.WeaponMode:options('Epeolatry','Lionheart','Aettir')
state.WeaponMode:set('Epeolatry')

--Enable JobMode for UI.
UI_Name = 'Runes'
UI_Name2 = 'Auto Tank'

--Modes for specific to RUN
state.JobMode:options('None','Fire','Ice','Wind','Earth','Lightning','Water','Light','Dark') -- Modes used to use Rune Enhancement
state.JobMode:set('None')

Runes = {
	Fire = {Name = "Ignis", Description = "[ICE RESISTANCE] and deals [FIRE DAMAGE]"},
	Ice = {Name = "Gelus", Description = "[WIND RESISTANCE] and deals [ICE DAMAGE]"},
	Wind = {Name = "Flabra", Description = "[EARTH RESISTANCE] and deals [WIND DAMAGE]"},
	Earth = {Name = "Tellus", Description = "[LIGHTNING RESISTANCE] and deals [EARTH DAMAGE]"},
	Lightning = {Name = "Sulpor", Description = "[WATER RESISTANCE] and deals [LIGHTNING DAMAGE]"},
	Water = {Name = "Unda", Description = "[FIRE RESISTANCE] and deals [WATER DAMAGE]"},
	Light = {Name = "Lux", Description = "[DARK RESISTANCE] and deals [LIGHT DAMAGE]"},
	Dark = {Name = "Tenebrae", Description = "[LIGHT RESISTANCE] and deals [DARKNESS DAMAGE]"},
	None = {Name = 'None', Description = "None"}
}






jobsetup (LockStylePallet,MacroBook,MacroSet)

-- HP balancing: 3000 HP
-- MP balancing: 950 MP

function get_sets()

	sets.Weapons = {}

	sets.Weapons['Epeolatry'] = {
		main="Epeolatry",
		sub="Utu Grip",
	}

	sets.Weapons['Lionheart'] = {
		main="Lionheart",
		sub="Utu Grip",
	}

	sets.Weapons['Aettir'] = {
		main="Aettir",
		sub="Utu Grip",
	}

	sets.Weapons.Shield = {}
	sets.Weapons.Sleep = {}

	-- Standard Idle set
	-- Missing:
	sets.Idle = {
		ammo="Homiliary",
		head="Nyame Helm",
		-- head="Null Masque",
		body="Runeist's Coat +3",
		hands="Erilaz Gauntlets +2",
		legs="Eri. Leg Guards +2",
		feet="Erilaz Greaves +2",
		neck="Futhark Torque +2",
		waist="Engraved Belt",
		left_ear="Tuisto Earring",
		right_ear="Genmei Earring",
		left_ring="Stikini Ring +1",
		right_ring="Moonlight Ring",
		back={name="Ogma's cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
	}

	sets.Idle.PDT = set_combine( sets.Idle, {
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ring="Gelatinous Ring +1",
	})

	sets.Idle.MEVA = set_combine( sets.Idle, {
		ammo="Staunch Tathlum +1",
		neck="Warder's Charm +1",
		head="Erilaz Galea +2",
		left_ear="Odnowa Earring +1",
		right_ear="Sanare Earring",
	})

	sets.Idle.DT = set_combine( sets.Idle, {
		ammo="Yamarang",
		head="Erilaz Galea +2",
		left_ring="Defending Ring",
	})

	-- Set is used for midcast during MEVA OffenseMode
	sets.MEVA = {
		ammo="Staunch Tathlum +1",
		neck="Warder's Charm +1",
		body="Runeist's Coat +3",
		hands="Erilaz Gauntlets +2",
		legs="Eri. Leg Guards +2",
		feet="Erilaz Greaves +2",
		right_ring="Moonlight Ring",
		left_ear="Odnowa Earring +1",
		right_ear="Sanare Earring",
	}

	sets.Idle.TP = set_combine(sets.Idle, {})
	sets.Idle.ACC = set_combine(sets.Idle, {})
	sets.Idle.SB = set_combine(sets.Idle, {})
	sets.Idle.Resting = set_combine(sets.Idle, {})

	-- This gear will be equiped when the player is moving and not engaged
	sets.Movement = {}

	-- Set to be used if you get 
	sets.Cursna_Received = {
	    neck="Nicander's Necklace",
		waist="Gishdubar Sash",
	}

	sets.Embolden = { back={ name="Evasionist's Cape", augments={'Enmity+3','"Embolden"+12','"Dbl.Atk."+5','Damage taken-4%',}},}

	sets.OffenseMode = {}

	--DPS set for tanking
	sets.OffenseMode.Parry = {
		ammo="Staunch Tathlum +1",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Turms Mittens +1",
		legs="Eri. Leg Guards +2",
		feet="Turms Leggings +1",
		neck="Futhark Torque +2",
		waist="Engraved Belt",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back={name="Ogma's cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},		
	}

	--DPS set for TP
	sets.OffenseMode.TP = {
		ammo="Coiste Bodhar",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'"Triple Atk."+3','STR+6','Accuracy+15','Attack+8',}},
		neck="Anu Torque",
		waist="Windbuffet Belt +1",
		left_ear="Cessance Earring",
		right_ear="Telos Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Epona's Ring",
		back={name="Ogma's cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}},		
	}

	-- Gear to swap in for ACC when TP
	sets.OffenseMode.ACC = set_combine(sets.OffenseMode.TP, {
		ammo="Yamarang",
		head="Erilaz Galea +2",
		body="Erilaz Surcoat +2",
		legs="Nyame Flanchard",
		feet="Turms Leggings +1",
		left_ear="Digni. Earring",
		left_ring="Ilabrat Ring",
		waist="Kentarch Belt +1",

	 })

	--Magic Evasion set for tanking
	sets.OffenseMode.MEVA = set_combine(sets.Idle.MEVA, {
	}) -- Focus on Magic Evasion with some DPS mixed in

	-- Standard Tanking TP set
	sets.OffenseMode.DT = {	
		ammo="Staunch Tathlum +1",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Erilaz Gauntlets +2",
		legs="Eri. Leg Guards +2",
		feet="Erilaz Greaves +2",
		waist="Engraved Belt",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Warden's Ring",
		right_ring="Moonlight Ring",
		back={name="Ogma's cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

	-- Set used for hate generation on Job abilities
	sets.Enmity = { -- 23 Epo
		ammo="Sapience Orb",
		head="Halitus Helm",
		body="Emet Harness +1",
		hands="Kurys Gloves",
		legs="Eri. Leg Guards +2",
		feet="Erilaz Greaves +2",
		neck="Futhark Torque +2",
		waist="Kasari Belt",
		left_ear="Tuisto Earring",
		right_ear="Trux Earring",
		left_ring="Murky Ring",
		right_ring="Moonlight Ring",
		back={name="Ogma's cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
	} 

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.SIRD = {
		ammo="Staunch Tathlum +1",
		head="Erilaz Galea +2",
		body="Nyame Mail",
		hands="Rawhide Gloves",
		legs="Carmine Cuisses +1",
		feet="Erilaz Greaves +2",
		neck="Moonlight Necklace",
		waist="Audumbla Sash",
		right_ear="Halasz Earring",
		left_ear="Magnetic Earring",
		left_ring="Gelatinous Ring +1",
		right_ring="Defending Ring",
		back={name="Ogma's cape",augments={'HP+60','HP+20','Enmity+10','Spell interruption rate down-10%',}},
	}

	sets.Precast = {}
	-- Used for Magic Spells

	sets.Precast.FastCast = {
		ammo="Sapience Orb",
		head="Rune. Bandeau +3",
		body="Erilaz Surcoat +2",
		hands="Leyline Gloves",
		legs="Agwu's Slops",
		feet="Carmine Greaves +1",
		neck="Orunmila's Torque",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Kishar Ring",
		right_ring="Moonlight Ring",
		back={name="Ogma's cape",augments={'HP+60','HP+8','"Fast Cast"+10','Phys. dmg. taken-10%',}},
	} --65 FC

	sets.Precast.Enhancing = set_combine(sets.Precast.FastCast, {
		head="Erilaz Galea +2",
		legs="Futhark Trousers +3", -- 7  (15 - 8)
		waist="Siegel Sash", -- 8
	}) -- 80+ FC

	sets.Precast.BlueMagic = set_combine (sets.Precast.FastCast, {})

	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, sets.Enmity, sets.SIRD, {})

	-- Enhancing Skill
	sets.Midcast.Enhancing = {
		head="Carmine Mask +1",
		body="Manasa Chasuble",
		hands="Runeist's Mitons +3",
		legs="Carmine Cuisses +1",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Mimir Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring +1",
		back="Merciful Cape",
	}

	-- Elemental
	sets.Midcast.Enhancing.Elemental = set_combine(sets.Midcast.Enhancing, {})

	-- Enhancing Duration on OTHERS
	sets.Midcast.Enhancing.Others = set_combine(sets.Midcast.Enhancing, {})

	-- Status
	sets.Midcast.Enhancing.Status = set_combine(sets.Midcast.Enhancing, {})

	-- Skill
	sets.Midcast.Enhancing.Skill = set_combine(sets.Midcast.Enhancing, {})

	-- Regen Sets
	sets.Midcast.Regen = set_combine(sets.Midcast.Enhancing, {
		head="Rune. Bandeau +3",
		body={ name="Taeon Tabard", augments={'"Regen" potency+3',}},
		legs="Futhark Trousers +3",
		feet={ name="Taeon Boots", augments={'"Regen" potency+3',}},
		neck="Sacro Gorget",
	})

	sets.Midcast.Refresh = set_combine(sets.Midcast.Enhancing, {})

	sets.Midcast.Cure = {}

	-- Blue Magic
	sets.Midcast.BlueMagic = {}
	sets.Midcast.BlueMagic.Skill = set_combine(sets.Midcast.Enhancing, {})
	sets.Midcast.BlueMagic.Nuke = set_combine(sets.Midcast.Enhancing, {})
	sets.Midcast.BlueMagic.Healing = set_combine(sets.Midcast.Cure, {})
	sets.Midcast.BlueMagic.ACC = set_combine(sets.Midcast.Enhancing, {})
	sets.Midcast.BlueMagic.Enmity = set_combine(sets.Enmity, {})

	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {}

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		waist="Siegel Sash",
	})

	sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, sets.SIRD, {
		body="Runeist's Coat +3",
	})

	sets.Midcast["Phalanx"] = set_combine(sets.Midcast.Enhancing, {
		head="Futhark Bandeau +2",
		body={ name="Taeon Tabard", augments={'Phalanx +3',}},
		hands={ name="Taeon Gloves", augments={'Phalanx +3',}},
		legs={ name="Taeon Tights", augments={'Phalanx +3',}},
		feet={ name="Taeon Boots", augments={'Phalanx +3',}},
	})

	sets.Midcast["Flash"] = set_combine(sets.Enmity, {})

	sets.Midcast["Foil"] = set_combine(sets.Enmity, {})

	-- JOB ABILITIES --
	sets.JA = {}
    sets.JA["Elemental Sforzo"] = set_combine(sets.Enmity, { body="Futhark Coat +2" })
    sets.JA["Gambit"] = set_combine(sets.Enmity, { hands="Runeist's Mitons +3",})
    sets.JA["Rayke"] = set_combine(sets.Enmity, { feet="Futhark Boots +1" })
    sets.JA["Liement"] = set_combine(sets.Enmity, { body="Futhark Coat +2" })
    sets.JA["One For All"] = sets.Idle
    sets.JA["Valiance"] = set_combine(sets.Enmity, {
        body="Runeist's Coat +3",
		back={name="Ogma's cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}, -- 5/5
        legs="Futhark Trousers +3"
    })
    sets.JA["Vallation"] = set_combine(sets.Enmity, {
        body="Runeist's Coat +3",
		back={name="Ogma's cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}, -- 5/5
        legs="Futhark Trousers +3"
    })
    sets.JA["Pflug"] = set_combine(sets.Enmity, { feet="Runeist's Bottes +2" })
    sets.JA["Battuta"] = set_combine(sets.Enmity, { head="Futhark Bandeau +2" })
    sets.JA["Vivacious Pulse"] = set_combine(sets.Precast.Divine, { head="Erilaz Galea +2" })
    sets.JA["Embolden"] = set_combine(sets.Enmity, sets.Embolden)
    sets.JA["Swordplay"] = set_combine(sets.Enmity, { hands="Futhark Mitons +1" })
	sets.JA["Provoke"] = sets.Enmity


	--Default WS set base
	sets.WS = {
		ammo="Knobkierrie",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Fotia Gorget",
		waist="Kentarch Belt +1",
		left_ear="Moonshade Earring",
		right_ear="Sherida Earring",
		left_ring="Ilabrat Ring",
		right_ring="Regal Ring",
		back={name="Ogma's cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	}
	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}
	sets.WS.WSD = {}
	sets.WS.CRIT = {}

	--Great Sword WS
	sets.WS["Hard Slash"] = {}
	sets.WS["Frostbite"] = {}
	sets.WS["Freezebite"] = {}
	sets.WS["Shockwave"] = {}
	sets.WS["Crescent Moon"] = {}
	sets.WS["Sickle Moon"] = {}
	sets.WS["Spinning Slash"] = {}
	sets.WS["Herculean Slash"] = {}
	sets.WS["Resolution"] = {}
	sets.WS["Dimidiation"] = {}

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


buff_time = os.clock()
tank_time = os.clock()

JA_Delay = os.clock()


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
	equipSet = set_combine(equipSet, Embolden_Check(spell))

	if state.OffenseMode.value == 'MEVA' then
		equipSet = set_combine(equipSet, sets.MEVA)
	end

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

--Function used to automate Job Ability use - Checked first
function check_buff_JA()
	buff = 'None'
	if os.clock() - buff_time > Buff_Delay then
		local ja_recasts = windower.ffxi.get_ability_recasts()
		local delay = os.clock() - JA_Delay

		if player.sub_job == 'SAM' then
			if not buffactive['Hasso'] and not buffactive['Seigan'] and ja_recasts[138] == 0 then
				buff = "Hasso"
			end
		end

		if player.sub_job == 'WAR' then
			if not buffactive['Berserk'] and ja_recasts[1] == 0 then
				buff = "Berserk"
			elseif not buffactive['Aggressor'] and ja_recasts[4] == 0 then
				buff = "Aggressor"
			elseif not buffactive['Warcry'] and ja_recasts[2] == 0 then
				buff = "Warcry"
			end
		end

		if buffactive[Runes[state.JobMode.value].Name] == 3 and windower.ffxi.get_player().target_locked then
			if not buffactive['Valiance'] and not buffactive['Vallation'] and not buffactive['Liement'] and ja_recasts[23] == 0 and delay > 3 then
				buff = "Vallation" -- Next Single Target DT and FC
			end
			if not buffactive['Valiance'] and not buffactive['Vallation'] and not buffactive['Liement'] and ja_recasts[113] == 0 then
				buff = "Valiance" -- AoE DT and FC
				JA_Delay = os.clock() -- Need to give Valiance a chance to register before Vallation is used
			end
		end

		--Rune sets
		if Runes[state.JobMode.value].Name ~= "None" then
			if ja_recasts[92] == 0 and buffactive[Runes[state.JobMode.value].Name] ~= 3 then
				buff = Runes[state.JobMode.value].Name
				info(Runes[state.JobMode.value].Description)
			end

		end

		if buff ~= 'None' then
			buff_time = os.clock()
		end
	end
	return buff
end

--Function used to automate Spell use
function check_buff_SP()
	buff = 'None'
	if os.clock() - buff_time > Buff_Delay then
		local sp_recasts = windower.ffxi.get_spell_recasts()

		if not buffactive['Enmity Boost'] and sp_recasts[476] == 0 and player.mp > 100 then
			buff = "Crusade"
		elseif not buffactive['Phalanx'] and sp_recasts[106] == 0 and player.mp > 100 then
			buff = "Phalanx"
		elseif not buffactive['Aquaveil'] and sp_recasts[55] == 0 and player.mp > 100 then
			buff = "Aquaveil"
		elseif not buffactive['Multi Strikes'] and sp_recasts[493] == 0 and player.mp > 36 then
			buff = "Temper"
		elseif not buffactive['Ice Spikes'] and sp_recasts[250] == 0 and player.mp > 16 then
			buff = "Ice Spikes"
		end

		if player.sub_job == "BLU" and player.sub_job_level > 8 then 
			if not buffactive['Defense Boost'] and sp_recasts[547] == 0 and player.mp > 10 then
				buff = "Cocoon"
			end
		end

		if buff ~= 'None' then
			buff_time = os.clock()
		else
			buff = check_tank()
		end
	end
	return buff
end


function check_tank()
	buff = 'None'
	if os.clock() - tank_time > Tank_Delay then
				log('tank check')
		if (player.status == "Engaged" or windower.ffxi.get_player().target_locked) and state.JobMode2.value == "ON" then
			local sp_recasts = windower.ffxi.get_spell_recasts()
			if sp_recasts[112] == 0 and player.mp > 25 then
				buff = "Flash"
			end
			if sp_recasts[840] == 0 and player.mp > 48 then
				buff = "Foil"
			end
		end
	end

	if buff ~= 'None' then
		tank_time = os.clock()
	end
	return buff
end

-- This function is called when the job file is unloaded
function user_file_unload()

end

-- Swaps back when embolden buff is active to extend duration
function Embolden_Check(spell)
	equipSet = {}
	if spell.target.id == player.id then
		if buffactive['Embolden'] then
			equipSet = sets.Embolden
			info('Embolden Set')
		end
	end
	return equipSet
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