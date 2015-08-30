-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------

-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.

-- Initialization function for this job file.
function get_sets()
	mote_include_version = 2
	-- Load and initialize the include file.
	include('Mote-Include.lua')
end

-- Setup vars that are user-independent.
function job_setup()
	state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
	state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
end


-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
	state.OffenseMode:options('None', 'Normal')
	state.CastingMode:options('Normal', 'Resistant', 'Dire')
	state.IdleMode:options('Normal', 'PDT')

	-- Default macro set/book
	set_macro_page(4, 14)
end


-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {ammo="Incantor Stone",
		head="Nahtirah Hat",neck="Orunmila's Torque",ear2="Loquacious Earring",
		body="Anhur Robe",hands="Gendewitha Gages",ring1="Prolix Ring",
		back="Swith Cape",waist="Witful Belt",legs="Theophany Pantaloons +1",feet="Regal Pumps +1"}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat"})

	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Orison Pantaloons +2"})

	sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

	sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		main="Tamaxchi",sub="Sors Shield",ammo="Impatiens",
		head="Theophany Cap +1",ear1="Nourishing Earring +1",
		back="Medala Cape",feet="Hygieia Clogs"})

	sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.Impact = {head=empty,body="Twilight Cloak"}

	-- Precast sets to enhance JAs
	sets.precast.JA.Benediction = {}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {
		head="Nahtirah Hat",ear1="Roundel Earring",
		back="Refraction Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}


	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	gear.default.weaponskill_neck = "Asperity Necklace"
	gear.default.weaponskill_waist = ""
	sets.precast.WS = {
		head="Nahtirah Hat",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
		back="Refraction Cape",waist=gear.ElementalBelt,legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

	sets.precast.WS['Flash Nova'] = {
		head="Nahtirah Hat",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
		body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="Strendu Ring",
		back="Toro Cape",waist="Thunder Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}


	-- Midcast Sets

	sets.midcast.FastRecast = {
		head="Nahtirah Hat",ear2="Loquacious Earring",
		ring1="Prolix Ring",
		back="Swith Cape",waist="Witful Belt",legs="Theophany Pantaloons +1",feet="Regal Pumps +1"}

	sets.midcast.Impact = {head=empty,body="Twilight Cloak"}

	-- Cure sets
	gear.default.obi_waist = "Witful Belt"
	gear.default.obi_back = "Mending Cape"

	sets.midcast.CureSolace = {main="Tamaxchi",sub="Sors Shield",ammo="Incantor Stone",
		head="Gendewitha Caubeen",neck="Colossus's Torque",ear1="Nourishing Earring +1",ear2="Glorious Earring",
		body="Orison Bliaud +2",hands="Theophany Mitts +1",ring1="Haoma's Ring",ring2="Sirona's Ring",
		back="Mending Cape",waist="Bishop's Sash",legs="Orison Pantaloons +2",feet="Piety Duckbills +1"}

	sets.midcast.Cure = sets.midcast.CureSolace

	sets.midcast.Curaga = sets.midcast.CureSolace

	sets.midcast.CureMelee = {ammo="Incantor Stone",
		head="Gendewitha Caubeen",neck="Orison Locket",ear1="Roundel Earring",ear2="Orison Earring",
		body="Orison Bliaud +2",hands="Theophany Mitts +1",ring1="Prolix Ring",ring2="Sirona's Ring",
		back="Tempered Cape",waist="Bishop's Sash",legs="Orison Pantaloons +2",feet="Piety Duckbills +1"}

	sets.midcast.Cursna = {main="Beneficus",sub="Sors Shield",
		head="Orison Cap +2",neck="Malison Medallion",
		body="Orison Bliaud +2",hands="Hieros Mittens",ring1="Ephedra Ring",ring2="Haoma's Ring",
		back="Mending Cape",waist="Goading Belt",legs="Theophany Pantaloons +1",feet="Gendewitha Galoshes"}

	sets.midcast.StatusRemoval = {
		head="Orison Cap +2",legs="Orison Pantaloons +2"}

	-- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {main="Beneficus",sub="Sors Shield",
		head="Umuthi Hat",neck="Colossus's Torque",
		hands="Augur's Gloves",
		back="Mending Cape",waist="Olympus Sash",legs="Piety Pantaloons",feet="Orison Duckbills +2"}

	sets.midcast.Stoneskin = {
		head="Nahtirah Hat",neck="Stone Gorget",ear1="Lifestorm Earring",ear2="Earthcry Earring",
		body="Gendewitha Bliaut",hands="Carapacho Cuffs",ring1="Sirona's Ring",
		back="Swith Cape",waist="Siegel Sash",legs="Haven Hose",feet="Gendewitha Galoshes"}

	sets.midcast.Auspice = {feet="Orison Duckbills +2"}

	sets.midcast.BarElement = {main="Beneficus",sub="Sors Shield",
		head="Orison Cap +2",neck="Colossus's Torque",
		body="Orison Bliaud +2",hands="Orison Mitts +2",
		back="Mending Cape",waist="Olympus Sash",legs="Piety Pantaloons",feet="Orison Duckbills +2"}

	sets.midcast.Regen = {main="Bolelabunga",sub="Sors Shield",
		body="Clr. Briault +2",hands="Orison Mitts +2",
		legs="Theophany Pantaloons +1"}

	sets.midcast.Protectra = {ring1="Sheltered Ring",feet="Piety Duckbills +1"}

	sets.midcast.Shellra = {ring1="Sheltered Ring",legs="Piety Pantaloons"}


	sets.midcast['Divine Magic'] = {main="Bolelabunga",sub="Sors Shield",
		head="Nahtirah Hat",neck="Colossus's Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		hands="Piety Mitts",ring2="Sangoma Ring",
		back="Refraction Cape",waist=gear.ElementalObi,legs="Theophany Pantaloons +1",feet="Gendewitha Galoshes"}

	sets.midcast['Dark Magic'] = {main="Bolelabunga", sub="Sors Shield",
		head="Nahtirah Hat",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		hands="Augur's Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
		back="Refraction Cape",}

	-- Custom spell classes
	sets.midcast.MndEnfeebles = {main="Tamaxchi", sub="Sors Shield",
		head="Nahtirah Hat",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Rubeus Jacket",hands="Piety Mitts",ring1="Aquasoul Ring",ring2="Sangoma Ring",
		back="Refraction Cape",waist="Cascade Belt",legs="Augur's Brais",feet="Piety Duckbills +1"}

	sets.midcast.IntEnfeebles = {main="Tamaxchi", sub="Sors Shield",
		head="Nahtirah Hat",ear1="Psystorm Earring",ear2="Lifestorm Earring",
		body="Rubeus Jacket",hands="Piety Mitts",ring1="Aquasoul Ring",ring2="Sangoma Ring",
		back="Refraction Cape",waist="Cascade Belt",legs="Augur's Brais",feet="Piety Duckbills +1"}


	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {main="Bolelabunga",sub="Sors Shield",range="Aureole",
		head="Wivre Hairpin",neck="Wiglen Gorget",
		body="Gendewitha Bliaut",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Shadow Mantle",waist="Austerity Belt",legs="Stearc Subligar",feet="Herald's Gaiters"}


	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main="Bolelabunga",sub="Sors Shield",range="Aureole",
		head="Telchine Cap",neck="Wiglen Gorget",ear1="Dawn Earring",ear2="Colossus's Earring",
		body="Theophany Briault +1",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Shneddick Ring",
		back="Kumbira Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Serpentes Sabots"}

	sets.idle.PDT = {main="Bolelabunga",sub="Sors Shield",range="Aureole",
		head="Wivre Hairpin",neck="Wiglen Gorget",ear1="Dawn Earring",ear2="Colossus's Earring",
		body="Gendewitha Bliaut",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
		back="Kumbira Cape",waist="Fucho-no-obi",legs="Stearc Subligar",feet="Herald's Gaiters"}

	-- Defense sets

	sets.defense.PDT = {}

	sets.defense.MDT = {}

	sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Basic set for if no TP weapon is defined.
	sets.engaged = {}


	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	sets.buff['Divine Caress'] = {hands="Orison Mitts +2",back="Mending Cape"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	if spell.english == "Paralyna" and buffactive.Paralyzed then
		-- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
		eventArgs.handled = true
	end

	if spell.skill == 'Healing Magic' then
		gear.default.obi_back = "Mending Cape"
	else
		gear.default.obi_back = "Toro Cape"
	end

	if state.Buff[spell.english] ~= nil then
		state.Buff[spell.english] = true
	end
end


function job_post_midcast(spell, action, spellMap, eventArgs)
	-- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
	if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
		equip(sets.buff['Divine Caress'])
	end
end


-- Return true if we handled the aftercast work.  Otherwise it will fall back
-- to the general aftercast() code in Mote-Include.
--function job_aftercast(spell, action, spellMap, eventArgs)
--	if state.Buff[spell.english] ~= nil then
--		state.Buff[spell.english] = not spell.interrupted or buffactive[spell.english]
--	end
--end


-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
	if spell.action_type == 'Magic' then
		if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') and player.status == 'Engaged' then
			return "CureMelee"
		elseif default_spell_map == 'Cure' and state.Buff['Afflatus Solace'] then
			return "CureSolace"
		elseif spell.skill == "Enfeebling Magic" then
			if spell.type == "WhiteMagic" then
				return "MndEnfeebles"
			else
				return "IntEnfeebles"
			end
		end
	end
end


function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
	return idleSet
end


-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	if state.Buff[buff] ~= nil then
		state.Buff[buff] = gain
	end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
	if cmdParams[1] == 'user' and not areas.Cities:contains(world.area) then
		local needsArts =
			player.sub_job:lower() == 'sch' and
			not buffactive['Light Arts'] and
			not buffactive['Addendum: White'] and
			not buffactive['Dark Arts'] and
			not buffactive['Addendum: Black']

		if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
			if needsArts then
				send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
			else
				send_command('@input /ja "Afflatus Solace" <me>')
			end
		end
	end
end


-- Handle notifications of general user state change.
--function job_state_change(stateField, newValue, oldValue)
--	if stateField == 'OffenseMode' then
--		if newValue == 'Normal' then
--			disable('main','sub')
--		else
--			enable('main','sub')
--		end
--	elseif stateField == 'Reset' then
--		if state.OffenseMode == 'None' then
--			enable('main','sub')
--		end
--	end
--end


-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
	display_current_caster_state()
	eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
