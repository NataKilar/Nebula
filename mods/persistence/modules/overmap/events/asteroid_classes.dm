/decl/asteroid_class/
	var/name = "Space Rock"
	var/desc = "A standard, boring space rock."
	var/weight = 50
	var/list/possible_stratas
	var/list/mob_types
	var/list/object_types
	var/objs_inside_only = FALSE

/decl/asteroid_class/asteroid
	name = "Asteroid"
	desc = "A silicate dense remnant of a would-be planet. Rich in metals and other materials of industrial use."
	mob_types = list(/mob/living/simple_animal/hostile/slug)
	possible_stratas = list(
		/decl/strata/asteroid/iron,
		/decl/strata/asteroid/carbon,
		/decl/strata/asteroid/copper,
		/decl/strata/asteroid/dense,
		/decl/strate/asteroid/shimmering
	)

/decl/asteroid_class/comet
	name = "Comet"
	desc = "An icy ball of dust formed from beyond the system's frostline. Often contains rare volatiles and unusual chemicals trapped within its ice."
	possible_stratas = list(
		/decl/strata/comet/liquid,
		/decl/strata/comet/gas
	)