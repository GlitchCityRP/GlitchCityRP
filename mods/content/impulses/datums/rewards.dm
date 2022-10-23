/decl/impulse_reward
	var/name = "Impulse Reward - ABSTRACT"
	var/desc = "You will earn NOTHING when you complete an impulse."
	abstract_type = /decl/impulse_reward

/decl/impulse_reward/proc/format_description(mob/living/recipient, duration)
	return desc

/decl/impulse_reward/proc/additional_content()
	return

/decl/impulse_reward/proc/OnTopic(href, list/href_list, mob/user)
	return TOPIC_NOACTION

/decl/impulse_reward/proc/apply_bonus(mob/living/recipient, duration)
	to_chat(recipient, SPAN_NOTICE(format_description(recipient, duration)))
	addtimer(CALLBACK(src, .proc/remove_bonus, recipient), duration)

/decl/impulse_reward/proc/remove_bonus(mob/living/recipient)
	return

/decl/impulse_reward/skill_bonus
	name = "Impulse Reward - Skill Bonus"
	desc = "You gain %LEVELS% in %SKILL%."
	uid = "impulse_reward_skill"
	var/const/min_points_granted = 4

/datum/skill_buff/impulse
	limit = 1

/decl/impulse_reward/skill_bonus/format_description(mob/living/recipient, duration)
	if(!recipient.client?.prefs)
		return ..()
	var/decl/hierarchy/skill/buffed_skill = recipient.client.prefs.impulse_skill
	return replacetext(replacetext(..(), "%SKILL%", buffed_skill.name), "%LEVELS%", "[get_levels_given(recipient)] level\s")

/decl/impulse_reward/skill_bonus/proc/get_levels_given(mob/living/recipient)
	if(!recipient.client?.prefs)
		return 1
	var/decl/hierarchy/skill/buffed_skill = recipient.client.prefs.impulse_skill
	var/current_level = recipient.get_skill_value(buffed_skill.type)
	var/points_to_grant = max(buffed_skill.get_cost(current_level + 1), min_points_granted)
	var/levels_to_grant = 0
	while(points_to_grant > 0)
		var/level_cost = buffed_skill.get_cost(current_level + levels_to_grant + 1)
		if(level_cost <= 0)
			break
		points_to_grant -= level_cost
		if(points_to_grant >= 0)
			levels_to_grant++
	return levels_to_grant

/decl/impulse_reward/skill_bonus/additional_content(datum/category_item/player_setup_item/setup, mob/user)
	if(!user.client?.prefs)
		return
	. = list()
	var/decl/hierarchy/skill/skill = user.client.prefs.impulse_skill
	. += "<a class='linkOn' href='?src=\ref[setup];reward=[uid];action=skill;'><b>[skill.name]</b></a>"
	return "<ul><li>[jointext(., "</li><li>")]</li></ul>"

/decl/impulse_reward/skill_bonus/OnTopic(href, list/href_list, mob/user)
	if(href_list["reward"] != uid)
		return TOPIC_NOACTION
	if(!user.client?.prefs)
		return TOPIC_NOACTION
	if(href_list["action"] == "skill")
		var/list/decl/hierarchy/skill/choices = decls_repository.get_decls_of_subtype(/decl/hierarchy/skill)
		var/list/decl/hierarchy/skill/filtered_choices = list()
		for(var/choice in choices)
			if (!DECL_INSTANCE_IS_ABSTRACT(choices[choice]))
				filtered_choices += choices[choice]
		user.client.prefs.impulse_skill = input("What skill do you want a bonus (of [min_points_granted] point\s or 1 level, whichever is greater) in?", "Skill bonus", user.client.prefs.impulse_skill) as anything in filtered_choices
		return TOPIC_REFRESH
	return TOPIC_HANDLED

/decl/impulse_reward/skill_bonus/apply_bonus(mob/living/recipient, duration)
	if(!recipient.client?.prefs) // no client, no reward! :<
		return
	var/decl/hierarchy/skill/buffed_skill = recipient.client.prefs.impulse_skill
	if(!istype(buffed_skill))
		return
	if(recipient.get_skill_value(buffed_skill) == SKILL_MAX)
		to_chat(recipient, SPAN_WARNING("Your [buffed_skill.name] skill is already at maximum, so you receive no bonus!"))
		return
	recipient.buff_skill(list(buffed_skill.type = get_levels_given(recipient)), buff_type = /datum/skill_buff/impulse)
	return ..()

/decl/impulse_reward/skill_bonus/remove_bonus(mob/living/recipient)
	var/list/buffs = recipient.fetch_buffs_of_type(/datum/skill_buff/impulse, 0)
	for(var/datum/skill_buff/impulse/buff in buffs)
		buff.remove()

/// A fraction used to reduce the delay of skilled actions.
/mob/living/var/skill_speed_multiplier = 1

/mob/living/do_skilled(base_delay, skill_path, atom/target = null, factor = 0.3, check_holding = FALSE)
	return do_after(src, base_delay * skill_delay_mult(skill_path, factor) * skill_speed_multiplier, target, check_holding)

/decl/impulse_reward/action_bonus
	name = "Impulse Reward - Action Bonus"
	desc = "You complete many skilled actions faster."
	uid = "impulse_reward_action"

/decl/impulse_reward/action_bonus/apply_bonus(mob/living/recipient, duration)
	recipient.skill_speed_multiplier *= 0.70
	return ..()

/decl/impulse_reward/action_bonus/remove_bonus(mob/living/recipient)
	recipient.skill_speed_multiplier /= 0.70