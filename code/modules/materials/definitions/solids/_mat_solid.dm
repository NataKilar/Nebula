/decl/material/solid
	name = null
	melting_point = 1000
	boiling_point = 30000
	molar_mass = 0.232 //iron Fe3O4
	door_icon_base = "stone"
	icon_base = 'icons/turf/walls/stone.dmi'
	table_icon_base = "stone"
	icon_reinf = 'icons/turf/walls/reinforced_stone.dmi'
	dug_drop_type = /obj/item/stack/material/ore
	default_solid_form = /obj/item/stack/material/brick
	abstract_type = /decl/material/solid
	bakes_into_material = null

	solid_specific_heat = 0.451 // iron
	liquid_specific_heat = null

	vaporization_heat = 6120 //iron

	solid_density = 7.87 // iron
	liquid_density = null

/decl/material/solid/Initialize()
	if(!liquid_name)
		liquid_name = "molten [name]"
	if(!gas_name)
		gas_name = "vaporized [name]"
	if(!solution_name)
		solution_name = "[name] solution"
	if(!ore_compresses_to)
		ore_compresses_to = type

	// Specific heats for liquid states aren't always available, so default to the solid.
	if(!liquid_specific_heat)
		liquid_specific_heat = solid_specific_heat

	// Ditto, assume it's slightly less dense.
	if(!liquid_density)
		liquid_density = 0.8*solid_density

	. = ..()
