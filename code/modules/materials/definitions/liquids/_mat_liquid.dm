/decl/material/liquid
	name = null
	melting_point = T0C
	boiling_point = T100C
	opacity = 0.5
	molar_mass = 0.018 //water
	liquid_specific_heat = 4.18
	liquid_density = 1
	vaporization_heat = 2258
	abstract_type = /decl/material/liquid
	accelerant_value = FUEL_VALUE_SUPPRESSANT // Abstract way of dousing fires with fluid; realistically it should deprive them of oxidizer but heigh ho

/decl/material/liquid/Initialize()
	if(!gas_name)
		gas_name = "vaporized [name]"
	if(!solid_name)
		solid_name = "frozen [name]"

	if(!solid_density)
		solid_density = liquid_density * 1.2
	if(!solid_specific_heat)
		solid_specific_heat = liquid_specific_heat
	. = ..()
