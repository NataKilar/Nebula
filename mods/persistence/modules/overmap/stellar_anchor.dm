#define BASE_TURF_UPKEEP_COST 	  50
#define MAX_SHIP_TILES		  	 400
#define MAX_ANCHORED_NAME_LENGTH  50
/obj/machinery/network/stellar_anchor
	name = "stellar anchor"
	main_template = "stellar_anchor.tmpl"
	construct_state = /decl/machine_construction/default/panel_closed

	var/list/anchored_areas
	var/list/errors
	var/gen_fluff = "sector"

	var/sector_name									 // Name and identifying tag of the created sector, shuttle, ship etc.

	var/sector_type = /obj/effect/overmap/visitable/sector/created
	var/sector_color = COLOR_WHITE					 // Color of the sector or other objects created by the stellar anchor.

/obj/machinery/network/stellar_anchor/ui_data(var/mob/user, ui_key)
	. = ..()
	var/datum/extension/network_device/D = get_extension(src, /datum/extension/network_device)
	.["network"] = D.network_tag
	.["anchored_areas"] = anchored_areas
	.["sector_name"] = sector_name
	.["sector_color"] = sector_color
	if(LAZYLEN(errors))
		.["errors"] = errors

/obj/machinery/network/stellar_anchor/OnTopic(var/mob/user, href_list, var/datum/topic_state/state)
	. = ..()
	if(.)
		return
	else if(href_list["launch"])
		// Cannot launch again after the sector is created.
		if(check_errors())
			var/confirm = alert(user, "This will permanently register \the [gen_fluff], are you sure?", "[capitalize(gen_fluff)] finalization", "Yes", "No")
			if(confirm == "No")
				return TOPIC_HANDLED
			launch(user)
			return TOPIC_REFRESH
		else
			to_chat(user, SPAN_WARNING("Cannot launch \the [src] due to current errors!"))
			return TOPIC_HANDLED

	else if(href_list["change_color"])
		var/new_color = input(user, "Choose a color.", "\the [src]", sector_color) as color|null
		if(new_color && new_color != sector_color)
			sector_color = new_color
			to_chat(user, SPAN_NOTICE("You set \the [src] to register \a [gen_fluff] with <font color='[sector_color]'>this color</font>"))
			return TOPIC_HANDLED

	else if(href_list["change_sector_name"])
		var/new_sector_name = sanitize(input(user, "Enter a new name for the created [gen_fluff]:", "Change [gen_fluff] name.") as null|text)
		if(!new_sector_name)
			return TOPIC_HANDLED
		if(length(new_sector_name) > MAX_ANCHORED_NAME_LENGTH)
			to_chat(user, SPAN_WARNING("That name is too long!"))
			return TOPIC_HANDLED
		sector_name = new_sector_name
		return TOPIC_REFRESH
	else if(href_list["check_errors"])
		check_errors()
		return TOPIC_REFRESH
	else if(href_list["settings"])
		var/datum/extension/network_device/D = get_extension(src, /datum/extension/network_device)
		D.ui_interact(user)
		. = TOPIC_REFRESH

/obj/machinery/network/stellar_anchor/proc/launch()
	var/obj/effect/overmap/origin_sector = map_sectors["[z]"]
	if(!origin_sector) // Safety check
		return
	var/overmap_x = origin_sector.x
	var/overmap_y = origin_sector.y

	INCREMENT_WORLD_Z_SIZE // Create a new z-level for the sector to correspond to.

	new /obj/effect/portal(get_turf(src))
	qdel_self()
	var/turf/target_turf = locate(world.maxx/2, world.maxy/2, world.maxz)
	new sector_type(target_turf, sector_name, overmap_x, overmap_y, sector_color)

	return TRUE

// Checking for validity of launch
/obj/machinery/network/stellar_anchor/proc/check_errors()
	LAZYCLEARLIST(errors)
	. = TRUE

	if(!sector_name || length(sector_name) < 5)
		LAZYDISTINCTADD(errors, "\The [gen_fluff] name must be at least 5 characters in length")
		. = FALSE
	var/obj/effect/overmap/origin_sector = map_sectors["[z]"]
	if(!origin_sector)	// In case a player is launching from an area unknown to the overmap. In normal gameplay this should not occur.
		LAZYDISTINCTADD(errors, "\The [src] cannot be launched from this location")
		. = FALSE
	else if(!istype(origin_sector, /obj/effect/overmap/visitable/ship))
		LAZYDISTINCTADD(errors, "\The [src] must be launched from a ship")
		. = FALSE

	if(!LAZYLEN(errors))
		LAZYDISTINCTADD(errors, "[capitalize(gen_fluff)] is valid for finalization")
