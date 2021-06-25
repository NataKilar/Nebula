

/turf/exterior/wall/asteroid
	floor_type = /turf/space // Leave space behind when destroyed.

/turf/exterior/wall/asteroid/Initialize(ml, materialtype, rmaterialtype, /decl/strata/initial_strata)
	strata = initial_strata
	. = ..()
	

/turf/exterior/wall/random/asteroid
	floor_type = /turf/space // Leave space behind when destroyed.

/turf/exterior/wall/random/asteroid/Initialize(ml, materialtype, rmaterialtype, /decl/strata/initial_strata)
	strata = initial_strata
	. = ..()
	