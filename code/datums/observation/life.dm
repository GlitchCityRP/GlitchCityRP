//	Observer Pattern Implementation: Life
//		Registration type: /mob
//
//		Raised when: A mob is added to the life_mob_list
//
//		Arguments that the called proc should expect:
//			/mob/dead: The mob that was added to the life_mob_list

/decl/observ/life
	name = "Life"
	expected_type = /mob

/*****************
* Life Handling *
*****************/

/mob/add_to_living_mob_list()
	. = ..()
	if(.)
		RAISE_EVENT(/decl/observ/life, src)
