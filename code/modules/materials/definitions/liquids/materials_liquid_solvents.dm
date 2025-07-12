/decl/material/liquid/acid
	name = "sulfuric acid"
	uid = "liquid_sulfuric_acid"
	lore_text = "A very corrosive mineral acid with the molecular formula H2SO4."
	taste_description = "acid"
	color = "#db5008"
	metabolism = REM * 2
	touch_met = 50 // It's acid!
	value = 1.2
	solvent_power = MAT_SOLVENT_VERY_STRONG
	solvent_melt_dose = 10
	melting_point = 284
	boiling_point = 611
	vaporization_heat = 612

	liquid_density = 1.83
	liquid_specific_heat = 1.42
	molar_mass = 0.098

// Eventually this will be a gas.
/decl/material/liquid/acid/hydrochloric //Like sulfuric, but less toxic and more acidic.
	name = "hydrochloric acid"
	uid = "liquid_hydrochloric_acid"
	lore_text = "A very corrosive mineral acid with the molecular formula HCl."
	taste_description = "stomach acid"
	color = "#808080"
	solvent_power = MAT_SOLVENT_STRONG
	solvent_melt_dose = 8
	solvent_max_damage = 30
	value = 1.5
	boiling_point = 382
	melting_point = 160
	molar_mass = 0.036

	liquid_density = 1.49
	liquid_specific_heat = 1.58

/decl/material/liquid/acid/polyacid
	name = "polytrinic acid"
	uid = "liquid_polytrinic_acid"
	lore_text = "Polytrinic acid is an extremely corrosive chemical substance."
	taste_description = "acid"
	color = "#8e18a9"
	solvent_power = MAT_SOLVENT_STRONGEST
	solvent_melt_dose = 4
	solvent_max_damage = 60
	value = 1.8
	exoplanet_rarity_plant = MAT_RARITY_UNCOMMON
	exoplanet_rarity_gas = MAT_RARITY_UNCOMMON

	liquid_density = 1.8
	liquid_specific_heat = 0.68

/decl/material/liquid/acid/stomach
	name = "stomach acid"
	uid = "liquid_stomach_acid"
	taste_description = "coppery foulness"
	solvent_power = MAT_SOLVENT_MODERATE
	color = "#d8ff00"
	hidden_from_codex = TRUE
	value = 0
	exoplanet_rarity_plant = MAT_RARITY_UNCOMMON
	exoplanet_rarity_gas = MAT_RARITY_EXOTIC

	// This is essentially just hyrochloric acid
	liquid_density = 1.49
	liquid_specific_heat = 1.58

/decl/material/liquid/acetone
	name = "acetone"
	uid = "liquid_acetone"
	lore_text = "A colorless liquid solvent used in chemical synthesis."
	taste_description = "acid"
	color = "#808080"
	metabolism = REM * 0.2
	value = 0.1
	solvent_power = MAT_SOLVENT_MODERATE
	toxicity = 3
	boiling_point = 330
	melting_point = 179
	vaporization_heat = 525
	molar_mass = 0.058

	liquid_density = 0.79
	liquid_specific_heat = 1.54