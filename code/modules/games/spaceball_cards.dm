/obj/item/pack/spaceball
	name = "\improper Spaceball booster pack"
	desc = "Officially licensed to take your money."
	icon_state = "card_pack_spaceball"

/obj/item/pack/spaceball/Initialize()
	. = ..()
	var/datum/playingcard/P
	var/i
	for(i=0;i<5;i++)
		P = new()
		if(prob(1))
			P.name = "Spaceball Jones, [global.using_map.game_year] Brickburn Galaxy Trekers"
			P.desc = "An autographed Spaceball Jones card!!"
			P.card_icon = "spaceball_jones"
		else
			var/decl/language/L = GET_DECL(/decl/language/human/common)
			var/team = pick("Brickburn Galaxy Trekers","Mars Rovers", "Qerrbalak Saints", "Moghes Rockets", "Ahdomai Lightening")
			P.name = "[L.get_random_name(pick(MALE,FEMALE))], [global.using_map.game_year - rand(0,50)] [team]"
			P.card_icon = "spaceball_standard"
			P.desc = "A Spaceball playing card."
		P.back_icon = "card_back_spaceball"

		cards += P