// The impulse processing subsystem.
PROCESSING_SUBSYSTEM_DEF(impulse_processing)
	name = "Impulse Processing"
	wait = 1 SECOND

// The impulse assignment subsystem.
/mob/living/carbon/human/var/next_impulse_time
SUBSYSTEM_DEF(impulses)
	name = "Impulse Assignment"
	wait = 5 MINUTES
	var/list/valid_impulse_paths = list()
	var/const/min_cooldown_minutes = 25
	var/const/max_cooldown_minutes = 35

/datum/controller/subsystem/impulses/Initialize(start_timeofday)
	. = ..()
	validate_impulses()

/datum/controller/subsystem/impulses/proc/validate_impulses()
	// I wish we had static procs.
	for(var/impulse_path in subtypesof(/datum/impulse))
		var/datum/impulse/imp = new impulse_path
		if(!imp.can_roll())
			continue
		valid_impulse_paths += impulse_path

/datum/controller/subsystem/impulses/fire(resumed)
	for(var/mob/living/carbon/human/H in global.human_mob_list)
		if(!H.mind || !H.client)
			continue
		if(world.time < H.next_impulse_time)
			continue
		H.add_random_impulse()
		H.next_impulse_time = world.time + (rand(min_cooldown_minutes, max_cooldown_minutes) MINUTES)
