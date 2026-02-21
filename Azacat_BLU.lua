-- Luthien
-- Load and initialize the include file.
include('Mirdain-Include')

--Set to ingame lockstyle and Macro Book/Set
LockStylePallet = "11"
MacroBook = "8"
MacroSet = "2"

-- Use "gs c food" to use the specified food item 
Food = "Sublime Sushi"

--Uses Items Automatically
AutoItem = false

--Upon Job change will use a random lockstyleset
Random_Lockstyle = false

-- 'TP','ACC','DT' are standard Default modes.  You may add more and assign equipsets for them ( Idle.X and OffenseMode.X )
state.OffenseMode:options('TP','ACC','DT','PDL','SB','MEVA') -- ACC effects WS and TP modes

--Set default mode (TP,ACC,DT)
state.OffenseMode:set('DT')

--Lockstyle sets to randomly equip
Lockstyle_List = {1,2,6,12}

--Command to Lock Style and Set the correct macros
jobsetup (LockStylePallet,MacroBook,MacroSet)

BlueNuke = S{'Spectral Floe','Entomb', 'Magic Hammer', 'Tenebral Crush','Embalming Earth'}
BlueACC = S{'Cruel Joke','Dream Flower'}
BlueHealing = S{'Magic Fruit','Healing Breeze','Wild Carrot','Plenilune Embrace'}
BlueSkill = S{'Occultation','Erratic Flutter','Nature\'s Meditation','Cocoon','Barrier Tusk','Matellic Body','Mighty Guard'}
BlueTank = S{}

--Weapons specific to Blue Mage
state.WeaponMode:options('Tizona','Naegling','Maxentius','Learn')
state.WeaponMode:set('Tizona')

--Enable JobMode for UI
UI_Name = 'Mode'

--Modes for specific to Blue Mage
state.JobMode:options('AoE','Melee')
state.JobMode:set('Melee')

function get_sets()

	--Set the weapon options.  This is set below in job customization section

	-- Weapon setup
	sets.Weapons = {}

	sets.Weapons['Tizona'] = {
		main="Tizona",
		sub="Thibron",
	}

	sets.Weapons['Naegling'] = {
		main="Naegling",
		sub="Thibron",
	}

	sets.Weapons['Maxentius'] = {
		main="Maxentius",
		sub="Bunzi's Rod",
	}

	sets.Weapons['Learn'] = {
		main="Extinction",
		sub="Feline Hagoita",
	}

	sets.Weapons.Shield = {
		sub="Genmei Shield",
	}

	sets.Weapons.Sleep = {}

	-- Standard Idle set with -DT,Refresh,Regen and movement gear
	-- Missing
	sets.Idle = {
		ammo="Staunch Tathlum +1",
		-- head="Malignance Chapeau",
		head="Gleti's Mask",
		-- body="Hashishin Mintan +3",
		body="Gleti's Cuirass",
		-- hands="Hashi. Bazu. +3",
		hands="Gleti's Gauntlets",
		-- legs="Hashishin Tayt +3",
		legs="Gleti's Breeches",
		-- feet="Hashi. Basmak +3",
		feet="Gleti's Boots",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Etiolation Earring",
		right_ear="Ethereal Earring",
		left_ring={name="Stikini Ring +1"},
		right_ring={name="Stikini Ring +1"},
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	}
	sets.Idle.TP = set_combine(sets.Idle, {})
	sets.Idle.ACC = set_combine(sets.Idle, {})
	sets.Idle.DT = set_combine(sets.Idle, {})
	sets.Idle.PDL = set_combine(sets.Idle, {})
	sets.Idle.SB = set_combine(sets.Idle, {})
	sets.Idle.Resting = set_combine(sets.Idle, {})
	sets.Idle.MEVA = set_combine(sets.Idle, {
		-- head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Leyline Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
		left_ear="Etiolation Earring",
		right_ear="Sanare Earring",
		left_ring="Vengeful Ring",
		right_ring="Purity Ring",
	})

	sets.Movement = {}

	-- Set to be used if you get cursna casted on you
	sets.Cursna_Received = {
	    neck="Nicander's Necklace",
		waist="Gishdubar Sash",
	}

	sets.Subtle_Blow = {
		neck="Bathy Choker +1",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
	}

	sets.OffenseMode = {}

	sets.OffenseMode.TP = {
	    ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Mirage Stole +2",
		waist="Sailfi Belt +1",
		left_ear="Dedition Earring",
		right_ear="Eabani Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

	sets.OffenseMode.DT = set_combine(sets.OffenseMode.TP, {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		left_ring="Defending Ring",
		left_ear="Odnowa Earring +1",
	})

	sets.OffenseMode.ACC = set_combine(sets.OffenseMode.DT, {
	
	})

	sets.OffenseMode.PDL = set_combine(sets.OffenseMode.DT, {
	
	})

	sets.OffenseMode.MEVA = set_combine(sets.OffenseMode.DT, {
		ammo="Coiste Bodhar",
		head="Gleti's Mask",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		neck="Warder's Charm +1",
		waist="Reiki Yotai",
		left_ear="Telos Earring",
		right_ear="Eabani Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
	})

	sets.OffenseMode.SB = set_combine(sets.OffenseMode.TP, {
		left_ring={ name="Chirich Ring +1"},
		right_ring={ name="Chirich Ring +1"},
	})

	sets.DualWield = {
		right_ear="Eabani Earring",
		waist="Reiki Yotai",
	}

	sets.Precast = {}

	-- Used for Magic Spells
	-- 10% FC from sword
	sets.Precast.FastCast = {
		ammo="Impatiens", -- Quick Magic 2
		head="Carmine Mask +1", --14
		hands="Leyline Gloves", -- 8
		legs="Aya. Cosciales +2", --6
		feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}}, --8
		neck="Voltsurge Torque", -- 4
		waist="Witful Belt", -- Quick Magic 3
		left_ear="Etiolation Earring", --1
		right_ear="Loquac. Earring", --2
		left_ring="Kishar Ring", -- Quick Magic 2
		right_ring="Prolix Ring", --5 Quick Magic 3
		back="Perimede Cape", --10
	} -- 79 and 10% Quick Magic

	sets.Precast.BlueMagic = set_combine(sets.Precast.FastCast, {
		--body="Hashishin Mintan +3", -- 16
	})

	-- Job Abilities
	sets.JA = {}
	sets.JA["Azure Lore"] = {}
	sets.JA["Chain Affinity"] = {}
	sets.JA["Burst Affinity"] = {}
	sets.JA["Diffusion"] = {}
	sets.JA["Efflux"] = {}
	sets.JA["Unbridled Learning"] = {}
	sets.JA["Unbridled Wisdom"] = {}

	-- Subjob JA (e.g. DNC)

	sets.Flourish = set_combine(sets.Idle.DT, {})
	sets.Jig = set_combine(sets.Idle.DT, { })
	sets.Step = set_combine(sets.OffenseMode.DT, {})
	sets.Samba = set_combine(sets.Idle.DT, {})
	sets.Waltz = set_combine(sets.OffenseMode.DT, {})


	--Base set for midcast - if not defined will notify and use your idle set for surviability
	sets.Midcast = set_combine(sets.Idle, {})

	--This set is used as base as is overwrote by specific gear changes (Spell Interruption Rate Down)
	sets.Midcast.SIRD = { --Total = 15 merits + 84 gear = 99 - Cap is 105
		ammo="Staunch Tathlum +1", -- 11
		hands="Amalric Gages +1", --11
		legs="Carmine Cuisses +1", -- 20
		feet="Amalric Nails +1", --16
		waist="Rumination Sash", --10
	}

	-- Cure Set
	sets.Midcast.Cure = {
		ammo="Staunch Tathlum +1",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body="Vrikodara Jupon",
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},
		neck="Loricate Torque +1",
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Mendi. Earring",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Menelaus's Ring",
		back="Oretan. Cape +1",
    } --35 %

	-- Enhancing Skill
	sets.Midcast.Enhancing = {
	    ammo="Hasty Pinion +1",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Andoaa Earring",
		right_ear="Gifted Earring",
		left_ring={name="Stikini Ring +1"},
		right_ring={name="Stikini Ring +1"},
		back="Perimede Cape",
	}

	-- High MACC for landing spells
	sets.Midcast.Enfeebling = {}

	sets.Midcast.Nuke = {
		ammo="Ghastly Tathlum +1",
		head="Jhakri Coronal +2",
		body="Amalric Doublet +1",
		hands="Amalric Gages +1",
		legs="Luhlaza Shalwar +3",
		feet="Amalric Nails +1",
		neck="Baetyl Pendant",
		waist="Orpheus's Sash",
		left_ear="Regal Earring",
		right_ear="Friomisi Earring",
		left_ring="Shiva Ring +1",
		right_ring="Shiva Ring +1",
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
	}

	-- Blue Magic
	sets.Midcast.BlueMagic = {
		ammo="Crepuscular Pebble",
		head="Jhakri Coronal +2",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +2",
		neck="Mirage Stole +2",
		waist="Prosilio Belt +1",
		left_ear="Regal Earring",
		right_ear="Telos Earring",
		left_ring="Ifrit Ring +1",
		right_ring="Ilabrat Ring",
		back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
	sets.Midcast.BlueMagic.Skill = set_combine(sets.Midcast.Enhancing, {})
	sets.Midcast.BlueMagic.Nuke = {
		ammo="Ghastly Tathlum +1",
		head="Jhakri Coronal +2",
		body="Amalric Doublet +1",
		hands="Amalric Gages +1",
		legs="Luhlaza Shalwar +1",
		feet="Amalric Nails +1",
		neck="Baetyl Pendant",
		waist="Yamabuki-no-Obi",
		left_ear="Regal Earring",
		right_ear="Friomisi Earring",
		left_ring="Metamor. Ring +1",
		right_ring="Shiva Ring +1",
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
	}
	sets.Midcast.BlueMagic.Healing = set_combine(sets.Midcast.Cure, {})
	sets.Midcast.BlueMagic.Enmity = set_combine(sets.Enmity, {})
	sets.Midcast.BlueMagic.ACC = set_combine(sets.Midcast.BlueMagic, {
		ammo="Falcon Eye",
		feet="Malignance Boots",
		left_ring="Ramuh Ring +1",
	})

	-- Specific gear for spells
	sets.Midcast["Stoneskin"] = set_combine(sets.Midcast.Enhancing, {
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		waist="Siegel Sash",
		neck="Nodens Gorget",
	})

    sets.Midcast["Refresh"] = set_combine(sets.Midcast.Enhancing, {
		waist="Gishdubar Sash"
	})

    sets.Midcast["Aquaveil"] = set_combine(sets.Midcast.Enhancing, {
	})

	sets.Midcast["Feather Tickle"] = set_combine(sets.Midcast.BlueMagic.ACC, {
	})

	sets.Midcast["Reaving Wind"] = set_combine(sets.Midcast.BlueMagic.ACC, {
	})

	sets.Midcast["Cruel Joke"] = set_combine(sets.Midcast.BlueMagic.ACC, {
	})

	sets.Midcast['Entomb'] = set_combine(sets.Midcast.BlueMagic.Nuke, {
	})

	sets.WS = {
		ammo="Crepuscular Pebble",
		head="Nyame Helm",
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Moonshade Earring",
		right_ear="Ishvara Earring",
		left_ring="Ifrit Ring +1",
		right_ring="Ifrit Ring +1",
		back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}

	--This set is used when OffenseMode is ACC and a WS is used (Augments the WS base set)
	sets.WS.ACC = {}

	-- This will augment the WS sets when in the Subtle Blow stance
	sets.WS.SB = sets.Subtle_Blow

	sets.WS['Black Halo'] = set_combine(sets.WS, {
	})

	sets.WS['Expiacion'] = set_combine(sets.WS, {
	})

	sets.WS['Chant du Cygne'] = set_combine(sets.WS, {
	})

	-- Note that the Mote library will unlock these gear spots when used.
	sets.TreasureHunter = {
		ammo="Per. Lucky Egg",
		head="Volte Cap",
		hands="Volte Bracers",
		waist="Chaac Belt",
	}

	sets.Diffusion = {}

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
	if spell.type == 'WeaponSkill' then
		if state.OffenseMode.value == "MEVA" then
			equipSet = set_combine(equipSet, { neck="Warder's Charm +1", })
		end
	end
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
	if command == 'jobmode' then
		if state.JobMode.value == 'AoE' then
			send_command('input //aset spellset magic;input /macro book 8;wait .1; input /macro set 2')
		else
			send_command('input //aset spellset tp;input /macro book 8;wait .1; input /macro set 1')
		end
	end
end

-- Function is called when the job lua is unloaded
function user_file_unload()

end

function check_buff_JA()
	buff = 'None'
	--local ja_recasts = windower.ffxi.get_ability_recasts()
	return buff
end

function check_buff_SP()
	buff = 'None'
	local sp_recasts = windower.ffxi.get_spell_recasts()
	if not buffactive['Phalanx'] and sp_recasts[517] == 0 and player.mp >= 19 then
		buff = "Metallic Body"
	elseif not buffactive['Aquaveil'] and sp_recasts[55] == 0 and player.mp > 12 then
		buff = "Aquaveil"
	elseif not buffactive['Defense Boost'] and sp_recasts[547] == 0 and player.mp > 10 then
		buff = "Cocoon"
	end
	return buff
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