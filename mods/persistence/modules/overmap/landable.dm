/obj/effect/overmap/visitable/ship/landable
	// We forego the use of visitor landmarks, and use free landing instead.
	free_landing = TRUE
	restricted_area = 20

/obj/effect/overmap/visitable/ship/landable/on_saving_start()
	// In case the ship is landed in a sector, save where the sector is located.
	start_x = loc.x
	start_y = loc.y

	old_loc = loc
	
	// Find where the ship currently is. If the ship is landed, its home z-level won't be saved unless something else is saving it.
	var/datum/shuttle/ship_shuttle = SSshuttle.shuttles[shuttle]
	if(!ship_shuttle || !ship_shuttle.current_location)
		log_error("Could not move the landable ship [src] into its current location!")
	if(check_rent())
		if(ship_shuttle.current_location == landmark)
			use_mapped_z_levels = TRUE
			for(var/ship_z in map_z)
				SSpersistence.AddSavedLevel(ship_z)
		else
			for(var/area/A in ship_shuttle.shuttle_area)
				SSpersistence.AddSavedArea(A)
	forceMove(get_turf(ship_shuttle.current_location))

/obj/effect/overmap/visitable/ship/landable/on_saving_end()
	use_mapped_z_levels = initial(use_mapped_z_levels)
	var/datum/shuttle/ship_shuttle = SSshuttle.shuttles[shuttle]
	if(ship_shuttle)
		if(ship_shuttle.current_location == landmark)
			for(var/ship_z in map_z)
				SSpersistence.RemoveSavedLevel(ship_z)
		else
			for(var/area/A in ship_shuttle.shuttle_area)
				SSpersistence.RemoveSavedArea(A)
	forceMove(old_loc)

// The landable ship contains a reference to its landmark, so only save if the ship is in its z-level.
/obj/effect/shuttle_landmark/ship/should_save()
	var/datum/shuttle/S = SSshuttle.shuttles[shuttle_name]
	if(S && S.current_location && S.current_location == src)
		return TRUE
	return FALSE

/obj/effect/shuttle_landmark/ship/Initialize(mapload, shuttle_name)
	if(SSpersistence.in_loaded_world && shuttle_name != initial(shuttle_name))
		. = ..(mapload, src.shuttle_name) // Used the loaded shuttle_name for tagging and shuttle restriction.
	else
		. = ..()

/obj/effect/shuttle_landmark/visiting_shuttle
	should_save = FALSE

// This is terrible, but there's no good way to override their creation because shuttle landmarks are created in populate_sector_objects.
/obj/effect/shuttle_landmark/visiting_shuttle/Initialize(mapload, obj/effect/shuttle_landmark/ship/master, _name)
	. = ..()
	return INITIALIZE_HINT_QDEL