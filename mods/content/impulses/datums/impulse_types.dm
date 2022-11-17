// Impulse subtypes.

// "OBTAIN AN OBJECT" IMPULSE
/// TODO: Pick a random type from all types of items on display racks in certain areas
/datum/impulse/obtain
	name = "Obtain an Object" // technically you can steal it...
	desc = "You feel the urge to get something from a store."
	var/obj/item/target_item_type
	var/holding_item = FALSE

/// A typecache of areas where the objective can't be completed.
/datum/map/var/list/area/obtain_store_areas

/datum/impulse/obtain/can_roll()
	var/static/can_roll_cached = null
	if(!..())
		return FALSE
	// Map setup, TODO: either make it map-agnostic OR
	// move this to map setup somehow.
	if(!length(global.store_racks))
		return FALSE
	for(var/obj/structure/rack/store_rack in global.store_racks)
		if(length(global.store_racks[store_rack]))
			return TRUE

	return FALSE

/datum/impulse/obtain/proc/get_nonempty_racks()
	. = list()
	for(var/rack in global.store_racks)
		if(!length(global.store_racks[rack]))
			continue
		.[rack] = global.store_racks[rack]

/datum/impulse/obtain/create()
	. = ..()
	var/store_rack = pick(get_nonempty_racks())
	if(!store_rack)
		CRASH("Obtain impulse had no racks to choose from but was rolled anyway!")
	target_item_type = pick(global.store_racks[store_rack])
	name = "Obtain \a [initial(target_item_type.name)]"
	desc = "You would focus a lot better if you got \a [initial(target_item_type.name)]."

/datum/impulse/obtain/connect(datum/mind/new_holder)
	..()
	events_repository.register(/decl/observ/mob_equipped, new_holder.current, src, .proc/owner_equipped)

/datum/impulse/obtain/proc/owner_equipped(mob/living/equipper, obj/item/equipped)
	var/area/equipper_area = get_area(equipper)
	if(!holding_item && length(global.using_map.obtain_store_areas) && is_type_in_typecache(equipper_area, global.using_map.obtain_store_areas))
		events_repository.register(/decl/observ/moved, equipped, src, .proc/target_item_moved)
		to_chat(holder.current, SPAN_NOTICE("You have \the [equipped]! Now you just need to leave \the [equipper_area]."))
		holding_item = equipped
		return FALSE
	if(istype(equipped, target_item_type))
		complete()
		return TRUE
	return FALSE

/datum/impulse/obtain/proc/target_item_moved(obj/item/enterer, atom/old_loc, atom/new_loc)
	// If we're still being held:
	if(holder.current == enterer.get_recursive_loc_of_type(/mob/living))
		var/area/old_area = get_area(old_loc)
		var/area/new_area = get_area(new_loc)
		// And if our area changed to a non-store area:
		if(old_area != new_area && !is_type_in_typecache(new_area, global.using_map.obtain_store_areas))
			owner_equipped(holder.current, enterer) // Check if we qualify yet.
		return // Still held, don't unregister.
	// Not being held, unregister.
	events_repository.unregister(/decl/observ/moved, enterer, src, .proc/target_item_moved)
	holding_item = null
	to_chat(holder.current, SPAN_WARNING("You stop holding \the [enterer]..."))

/datum/impulse/obtain/Destroy(force)
	events_repository.unregister(/decl/observ/mob_equipped, holder.current, src, .proc/owner_equipped)
	if(holding_item)
		events_repository.unregister(/decl/observ/moved, holding_item, src, .proc/target_item_moved)
	holding_item = null
	return ..()

// "VISIT A LOCATION" IMPULSE
/datum/impulse/visit
	name = "Visit a Location"
	desc = "You feel the urge to visit a certain place."
	/// The area instance that must be visited to complete the impulse.
	var/area/target_area
	/// Whether or not the owner is currently in the area.
	var/in_area = FALSE
	/// How long you have to stay in the location to complete the goal.
	var/stay_duration
	/// The lowest duration that can be rolled.
	var/min_stay_duration = 30 SECONDS
	/// The highest duration that can be rolled.
	var/max_stay_duration = 90 SECONDS

/// A weighted list of area types that can be targets for the Visit impulse.
/datum/map/var/list/area/visitable_locations

/// Make sure this is never called prior to map load, if we ever use dynamic map loading for using_map.
/datum/impulse/visit/can_roll()
	var/static/can_roll_cached = null
	if(!..())
		return FALSE
	if(!isnull(can_roll_cached))
		return can_roll_cached
	can_roll_cached = FALSE
	for(var/candidate in global.using_map.visitable_locations)
		if(global.using_map.visitable_locations[candidate] > 0)
			can_roll_cached = TRUE
			break
	return can_roll_cached

/datum/impulse/visit/create()
	. = ..()
	var/rolled_type = pickweight(global.using_map.visitable_locations)
	if(!rolled_type)
		CRASH("Visit impulse had no visitable locations but was rolled anyway!")
	target_area = locate(rolled_type)
	if(!target_area)
		CRASH("Visit impulse was rolled but unable to find an area with type [rolled_type]!")
	name = "Visit \the [target_area]"
	stay_duration = NONUNIT_FLOOR(rand(min_stay_duration, max_stay_duration), SSimpulse_processing.wait)
	var/duration_string = ticks2readable(stay_duration)
	desc = "You would focus a lot better if you visited \the [target_area][duration_string ? " for [duration_string]" : ""]."

/datum/impulse/visit/connect(datum/mind/new_holder)
	..()
	events_repository.register(/decl/observ/moved, new_holder.current, src, .proc/owner_moved)

/datum/impulse/visit/proc/owner_moved(mob/living/mover, atom/old_loc, atom/new_loc)
	var/area/old_area = get_area(old_loc)
	var/area/new_area = get_area(new_loc)
	if(!new_area) // nullspace?
		return
	if (old_area == new_area) // same area
		return
	if (!in_area && new_area == target_area)
		to_chat(holder.current, SPAN_NOTICE("You take in the sights."))
		in_area = TRUE
	if (in_area && new_area != target_area)
		to_chat(holder.current, SPAN_WARNING("You stop taking in the sights."))
		in_area = FALSE

/datum/impulse/visit/Destroy()
	events_repository.unregister(/decl/observ/moved, holder.current, src, .proc/owner_moved)
	return ..()

/datum/impulse/visit/Process()
	..()
	if(!in_area)
		return
	if(in_area)
		stay_duration -= SSimpulse_processing.wait
	if(stay_duration <= 0)
		complete()

// "EXAMINE A LANDMARK" IMPULSE
/datum/impulse/examine
	name = "Examine a Landmark"
	desc = "You feel the urge to look at a local landmark."
	var/obj/structure/landmark

/// A list of landmarks that can be used as goals for the examine impulse.
/datum/map/var/list/obj/structure/examinables = list() // autogenerated based on examine_here landmarks

/obj/abstract/landmark/examine_here
	name = "examine impulse landmark"
	delete_me = TRUE
	/// Used to disambiguate in cases where there are multiple structures on a turf.
	var/type_to_examine = /obj/structure

/obj/abstract/landmark/examine_here/Initialize()
	var/turf/our_turf = get_turf(src)
	if(!our_turf)
		CRASH("examine_here landmark had no turf!")
	var/obj/landmark = locate(type_to_examine) in our_turf
	if(!landmark)
		CRASH("[get_log_info_line()] did not find a structure!")
	global.using_map.examinables += landmark
	. = ..()

/datum/impulse/examine/can_roll()
	if(!..())
		return FALSE
	if(!length(global.using_map.examinables))
		return FALSE
	return TRUE

/datum/impulse/examine/create()
	. = ..()
	landmark = pick(global.using_map.examinables)
	if(!landmark)
		CRASH("Examine impulse had no examinable structures to choose from but was rolled anyway!")
	if(!istype(landmark))
		CRASH("Examine impulse rolled non-structure landmark!")
	name = "Examine \the [landmark]"
	desc = "You would focus a lot better if you went to look at \the [landmark]."
	events_repository.register(/decl/observ/atom_examined, landmark, src, .proc/landmark_examined)

/datum/impulse/examine/proc/landmark_examined(atom/examined, mob/living/equipper)
	if(equipper == holder.current)
		complete()

/datum/impulse/examine/Destroy(force)
	events_repository.unregister(/decl/observ/atom_examined, landmark, src, .proc/landmark_examined)
	landmark = null
	return ..()

// "DRINK A COCKTAIL" IMPULSE
/datum/impulse/cocktail
	name = "Drink a Cocktail"
	desc = "You feel the urge to drink a certain cocktail."
	var/decl/cocktail/target_cocktail

/// A typecache of cocktail types that can be rolled for this objective.
/datum/map/var/list/decl/cocktail/valid_impulse_cocktails

/datum/impulse/cocktail/can_roll()
	var/static/can_roll_cached = null
	if(!..())
		return FALSE
	if(!isnull(can_roll_cached))
		return can_roll_cached
	// Map setup, TODO: either make it map-agnostic OR
	// move this to map setup somehow.
	if(length(global.using_map.valid_impulse_cocktails) && !is_dense_assoc(global.using_map.valid_impulse_cocktails))
		global.using_map.valid_impulse_cocktails = typecacheof(global.using_map.valid_impulse_cocktails)

	can_roll_cached = TRUE
	if(!length(global.using_map.valid_impulse_cocktails))
		can_roll_cached = FALSE
	return can_roll_cached

/datum/impulse/cocktail/create()
	. = ..()
	var/rolled_type = pick(global.using_map.valid_impulse_cocktails)
	if(!rolled_type)
		CRASH("Cocktail impulse had no types to choose from but was rolled anyway!")
	target_cocktail = GET_DECL(rolled_type)
	name = "Drink \a ["\improper [target_cocktail.name]"]"
	desc = "You would focus a lot better if you drank \a ["\improper [target_cocktail.name]"]."

/datum/impulse/cocktail/connect(datum/mind/new_holder)
	..()
	events_repository.register(/decl/observ/ingested, new_holder.current, src, .proc/owner_ingested)

/datum/impulse/cocktail/proc/owner_ingested(mob/living/ingester, datum/reagents/source)
	if(source.my_atom && target_cocktail.matches(source.my_atom))
		complete()

/datum/impulse/cocktail/Destroy(force)
	events_repository.unregister(/decl/observ/ingested, holder.current, src, .proc/owner_ingested)
	return ..()

// "DRINK A BEVERAGE" IMPULSE
/datum/impulse/beverage
	name = "Drink a Beverage"
	desc = "You feel the urge to drink a certain beverage."
	var/decl/material/liquid/drink/beverage_type

/datum/impulse/beverage/can_roll()
	var/static/can_roll_cached = null
	if(!..())
		return FALSE
	if(!isnull(can_roll_cached))
		return can_roll_cached

	can_roll_cached = TRUE
	if(!length(lunchables_drink_reagents()))
		can_roll_cached = FALSE
	return can_roll_cached

/datum/impulse/beverage/create()
	. = ..()
	beverage_type = lunchables_drink_reagents()[pick(lunchables_drink_reagents())]
	if(!beverage_type)
		CRASH("Beverage impulse had no types to choose from but was rolled anyway!")
	var/decl/material/liquid/drink/target_beverage = GET_DECL(beverage_type)
	name = "Drink some [target_beverage.name]"
	desc = "You would focus a lot better if you drank some [target_beverage.name]."

/datum/impulse/beverage/connect(datum/mind/new_holder)
	..()
	events_repository.register(/decl/observ/ingested, new_holder.current, src, .proc/owner_ingested)

/datum/impulse/beverage/proc/owner_ingested(mob/living/ingester, datum/reagents/source)
	if(source.has_reagent(beverage_type))
		complete()

/datum/impulse/beverage/Destroy(force)
	events_repository.unregister(/decl/observ/ingested, holder.current, src, .proc/owner_ingested)
	return ..()