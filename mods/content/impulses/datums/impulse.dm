/datum/mind/var/datum/impulse/impulse

/mob/living/carbon/human/proc/add_random_impulse()
	if(!mind)
		return FALSE
	if(!length(SSimpulses.valid_impulse_paths))
		return FALSE
	var/impulse_path = pick(SSimpulses.valid_impulse_paths)
	new impulse_path(mind)

/mob/living/carbon/human/proc/choose_impulse()
	if(!mind)
		to_chat(usr, "[src] has no mind and can't have impulses!")
		return FALSE
	if(!length(SSimpulses.valid_impulse_paths))
		to_chat(usr, "This map doesn't support any impulses!")
		return FALSE
	var/chosen_impulse = input(usr, "Pick an impulse to add.") as null|anything in SSimpulses.valid_impulse_paths
	if(!chosen_impulse)
		return FALSE
	return add_impulse(chosen_impulse)

/mob/living/carbon/human/proc/add_impulse(impulse_path)
	if(!mind)
		return FALSE
	if(!ispath(impulse_path, /datum/impulse))
		CRASH("add_impulse expected /datum/impulse typepath, got [istype(impulse_path, /datum/impulse) ? "impulse instance" : (ispath(impulse_path) ? "non-impulse path" : (isnull(impulse_path) ? "null" : "non-impulse instance"))]!")
	if(!length(SSimpulses.valid_impulse_paths) || !(impulse_path in SSimpulses.valid_impulse_paths))
		return FALSE
	new impulse_path(mind)

// Base impulse definitions.

/datum/impulse
	var/name = "Impulse"
	var/desc = "You just have to do something."
	var/completion_message = "You feel focused and attentive."
	var/datum/mind/holder
	/// The time left before the impulse fades.
	var/time_left
	/// The total time limit rolled for the impulse.
	var/duration
	/// The minimum time before the impulse fades.
	var/min_duration = 5 MINUTES
	/// The maximum time before the impulse fades.
	var/max_duration = 10 MINUTES

/datum/impulse/New(datum/mind/new_holder)
	if(!new_holder)
		return
	create()
	connect(new_holder)
	START_PROCESSING(SSimpulse_processing, src)

/datum/impulse/proc/can_roll()
	return TRUE

/datum/impulse/proc/create()
	SHOULD_CALL_PARENT(TRUE)
	duration = rand(min_duration, max_duration)
	time_left = duration
	return

/datum/impulse/proc/connect(datum/mind/new_holder)
	if(!istype(new_holder))
		CRASH("Impulse attempted to connect to [new_holder?.type || "NULL"] (expected /datum/mind)")
	holder = new_holder
	holder.impulse = src
	to_chat(holder.current, SPAN_BOLD("<center>***</center>"))
	to_chat(holder.current, SPAN_BOLD(SPAN_INFO(FONT_LARGE("[name] - [ticks2readable(duration)]"))))
	to_chat(holder.current, SPAN_INFO(desc))
	to_chat(holder.current, SPAN_BOLD("<center>***</center>"))
	events_repository.register(/decl/observ/destroyed, new_holder.current, src, /datum/proc/qdel_self)
	return TRUE

/datum/impulse/Process()
	// todo: add actual DT argument to /Process
	time_left -= SSimpulse_processing.wait
	if(time_left < 0)
		expire()
	return

/datum/impulse/proc/complete()
	to_chat(holder.current, SPAN_NOTICE(completion_message))
	var/decl/impulse_reward/impulse_bonus = holder.current.client.prefs.impulse_reward_type
	if(istype(impulse_bonus))
		// TODO: Strength and bonus duration scaling.
		// Maybe scale it with duration/max_duration to compensate people who roll low?
		impulse_bonus.apply_bonus(holder.current, 20 MINUTES)
	qdel(src)

/datum/impulse/proc/expire()
	to_chat(holder.current, SPAN_WARNING("Your impulse fades, and with it goes your focus..."))
	qdel(src)

/datum/impulse/Destroy()
	STOP_PROCESSING(SSimpulse_processing, src)
	holder.impulse = null
	holder = null
	return ..()
