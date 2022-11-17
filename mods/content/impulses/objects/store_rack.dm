var/global/list/list/store_racks = list() // assoc list of racks->rack item contents

/datum/controller/subsystem/impulses/Initialize(start_timeofday)
	if(length(global.using_map.obtain_store_areas) && !is_dense_assoc(global.using_map.obtain_store_areas))
		global.using_map.obtain_store_areas = typecacheof(global.using_map.obtain_store_areas)
	return ..()

/obj/structure/rack/Initialize()
	. = ..()
	if(is_type_in_typecache(get_area(src), global.using_map.obtain_store_areas))
		global.store_racks[src] = list()
		events_repository.register(/decl/observ/moved, src, src, /obj/structure/rack/proc/check_movement_change)
		register_to_turf(get_turf(src))
		return INITIALIZE_HINT_LATELOAD

// LateInitialize so that random spawners have fired
/obj/structure/rack/LateInitialize()
	. = ..()
	calculate_store_contents()

/obj/structure/rack/proc/register_to_turf(var/turf/T)
	events_repository.register(/decl/observ/entered, T, src, /obj/structure/rack/proc/register_store_item)
	events_repository.register(/decl/observ/exited, T, src, /obj/structure/rack/proc/unregister_store_item)

/obj/structure/rack/proc/unregister_from_turf(var/turf/T)
	events_repository.unregister(/decl/observ/entered, T, src, /obj/structure/rack/proc/register_store_item)
	events_repository.unregister(/decl/observ/exited, T, src, /obj/structure/rack/proc/unregister_store_item)

/obj/structure/rack/proc/calculate_store_contents()
	store_racks[src].Cut()
	for(var/obj/item/I in get_turf(src))
		store_racks[src] += I

/obj/structure/rack/proc/register_store_item(var/turf/entered, var/obj/item/enterer, var/old_loc)
	if(!istype(enterer))
		return
	store_racks[src] += enterer

/obj/structure/rack/proc/unregister_store_item(var/turf/exited, var/obj/item/exitee, var/new_loc)
	if(!istype(exitee))
		return
	store_racks[src] -= exitee

/obj/structure/rack/proc/check_movement_change(var/mover, var/old_loc, var/new_loc)
	if(new_loc && old_loc != new_loc)
		unregister_from_turf(get_turf(old_loc))
		register_to_turf(get_turf(new_loc))
		calculate_store_contents()
	if(get_area(old_loc) == get_area(new_loc))
		return
	if(!get_area(new_loc) || !is_type_in_typecache(get_area(new_loc), global.using_map.obtain_store_areas))
		unregister_store_rack()

/obj/structure/rack/proc/unregister_store_rack()
	global.store_racks -= src
	events_repository.unregister(/decl/observ/moved, src, src, /obj/structure/rack/proc/check_movement_change)
	unregister_from_turf(get_turf(src))

/obj/structure/rack/Destroy()
	unregister_store_rack()
	return ..()