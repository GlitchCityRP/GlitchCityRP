/datum/preferences
	var/decl/impulse_reward/impulse_reward_type // TODO: in 515+, use /decl/impulse_reward/skill_bonus::uid
	var/decl/hierarchy/skill/impulse_skill // TODO: in 515+, set the initial value to SKILL_CONSTRUCTION::uid instead of GET_DECL in load_character

/datum/category_group/player_setup_category/impulses_preferences
	name = "Impulses"
	sort_order = 6.75 // someone should really redo how these work
	category_item_type = /datum/category_item/player_setup_item/impulses

/datum/category_item/player_setup_item/impulses
	name = "Impulses"
	sort_order = 1

/datum/category_item/player_setup_item/impulses/load_character(datum/pref_record_reader/R)
	pref.impulse_reward_type = decls_repository.get_decl_by_id(R.read("impulse_reward_type") || "impulse_reward_skill") // 515+ todo: /decl/impulse_reward/skill_bonus::uid
	pref.impulse_skill =       decls_repository.get_decl_by_id(R.read("impulse_skill") || "skill_construction") // 515+ todo: SKILL_CONSTRUCTION::uid

/datum/category_item/player_setup_item/impulses/save_character(datum/pref_record_writer/W)
	W.write("impulse_reward_type", pref.impulse_reward_type.uid)
	W.write("impulse_skill",       pref.impulse_skill.uid)

/datum/category_item/player_setup_item/impulses/sanitize_character()
	if(!pref.impulse_reward_type)
		pref.impulse_reward_type = GET_DECL(/decl/impulse_reward/skill_bonus)
	if(!pref.impulse_skill)
		pref.impulse_skill = GET_DECL(SKILL_CONSTRUCTION)

/datum/category_item/player_setup_item/impulses/content(mob/user)
	. = list()
	. += "Impulses are optional small, timed roleplay tasks that grant small focus-based rewards to your character when completed.<br/>"
	. += "You can select the type of reward it grants, as well as additional customization per reward type."
	var/list/impulse_rewards = decls_repository.get_decls_of_subtype(/decl/impulse_reward)
	for(var/impulse_reward_path in impulse_rewards)
		. += "<hr>"
		var/decl/impulse_reward/reward = impulse_rewards[impulse_reward_path]
		var/is_selected = reward.uid == pref.impulse_reward_type.uid
		. += "<a class='[is_selected ? "linkOn" : ""]' href='?src=\ref[src];reward=[reward.uid]'><b>[reward.name]</b></a>"
		var/list/additional_content = reward.additional_content(src, user)
		if(length(additional_content))
			. += additional_content
	. = jointext(.,null)

/datum/category_item/player_setup_item/impulses/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(user.client?.prefs && href_list["reward"])
		var/decl/impulse_reward/reward = decls_repository.get_decl_by_id(href_list["reward"])
		if(href_list["action"])
			. = reward.OnTopic(href, href_list, user)
			if(.)
				return .
		user.client.prefs.impulse_reward_type = reward
		return TOPIC_REFRESH
	return ..()
