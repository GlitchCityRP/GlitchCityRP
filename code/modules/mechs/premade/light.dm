/mob/living/exosuit/premade/light
	name = "light exosuit"
	desc = "A light and agile exosuit."

/obj/item/mech_component/manipulators/light/painted
	color = COLOR_OFF_WHITE

/obj/item/mech_component/propulsion/light/painted
	color = COLOR_OFF_WHITE

/obj/item/mech_component/sensors/light/painted
	color = COLOR_OFF_WHITE

/obj/item/mech_component/chassis/light/painted
	color = COLOR_OFF_WHITE

/mob/living/exosuit/premade/light/Initialize()
	if(!arms)
		arms = new /obj/item/mech_component/manipulators/light/painted(src)
	if(!legs)
		legs = new /obj/item/mech_component/propulsion/light/painted(src)
	if(!head)
		head = new /obj/item/mech_component/sensors/light/painted(src)
	if(!body)
		body = new /obj/item/mech_component/chassis/light/painted(src)

	. = ..()

/mob/living/exosuit/premade/light/spawn_mech_equipment()
	..()
	install_system(new /obj/item/mech_equipment/catapult(src), HARDPOINT_LEFT_HAND)
	install_system(new /obj/item/mech_equipment/sleeper(src), HARDPOINT_BACK)
	install_system(new /obj/item/mech_equipment/light(src), HARDPOINT_HEAD)

/obj/item/mech_component/manipulators/light
	name = "light arms"
	exosuit_desc_string = "lightweight, segmented manipulators"
	icon_state = "light_arms"
	melee_damage = 5
	action_delay = 15
	max_damage = 40
	power_use = 10
	desc = "As flexible as they are fragile, these Vey-Med manipulators can follow a pilot's movements in close to real time."
	material = /decl/material/solid/metal/steel

/obj/item/mech_component/propulsion/light
	name = "light legs"
	exosuit_desc_string = "aerodynamic electromechanic legs"
	icon_state = "light_legs"
	move_delay = 2
	turn_delay = 3
	max_damage = 40
	power_use = 5
	desc = "The electrical systems driving these legs are almost totally silent. Unfortunately slamming a plate of metal against the ground is not."
	material = /decl/material/solid/metal/steel

/obj/item/mech_component/sensors/light
	name = "light sensors"
	gender = PLURAL
	exosuit_desc_string = "advanced sensor array"
	icon_state = "light_head"
	max_damage = 30
	vision_flags = SEE_TURFS
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	power_use = 50
	desc = "A series of high resolution optical sensors. They can overlay several images to give the pilot a sense of location even in total darkness. "
	material = /decl/material/solid/metal/steel

/obj/item/mech_component/sensors/light/prebuild()
	..()
	software = new(src)
	software.installed_software = list(MECH_SOFTWARE_UTILITY, MECH_SOFTWARE_MEDICAL)

/obj/item/mech_component/chassis/light
	name = "light exosuit chassis"
	hatch_descriptor = "canopy"
	pilot_coverage = 100
	transparent_cabin =  TRUE
	exosuit_desc_string = "an open and light chassis"
	icon_state = "light_body"
	max_damage = 50
	power_use = 5
	has_hardpoints = list(HARDPOINT_BACK)
	desc = "The Veymed Odysseus series cockpits combine ultralight materials and clear aluminium laminates to provide an optimized cockpit experience."
	climb_time = 15
	material = /decl/material/solid/metal/steel

/obj/item/mech_component/chassis/light/prebuild()
	. = ..()
	m_armour = new /obj/item/robot_parts/robot_component/armour/exosuit/radproof(src)

/obj/item/mech_component/chassis/light/Initialize()
	pilot_positions = list(
		list(
			"[NORTH]" = list("x" = 8,  "y" = 0),
			"[SOUTH]" = list("x" = 8,  "y" = 0),
			"[EAST]"  = list("x" = 3,  "y" = 0),
			"[WEST]"  = list("x" = 13, "y" = 0)
		)
	)
	. = ..()
