// A Neon Glow Lights The Way

/obj/machinery/light/neon
	name = "neon light fixture"
	desc = "A neon lighting fixture."
	accepts_light_type = /obj/item/light/tube/large/neon
	light_type = /obj/item/light/tube/large/neon/yellow

/obj/machinery/light/neon/orange
	light_type = /obj/item/light/tube/large/neon/orange

/obj/machinery/light/neon/purple
	light_type = /obj/item/light/tube/large/neon/purple

/obj/machinery/light/neon/red
	light_type = /obj/item/light/tube/large/neon/red

/obj/machinery/light/neon/pink
	light_type = /obj/item/light/tube/large/neon/pink

/obj/machinery/light/neon/blue
	light_type = /obj/item/light/tube/large/neon/blue

/obj/machinery/light/neon/green
	light_type = /obj/item/light/tube/large/neon/green


//colored bulbs
/obj/item/light/tube/large/neon
	b_power = 0.95
	b_range = 4.5

/obj/item/light/tube/large/neon/red
	b_color = "#ff9999"

/obj/item/light/tube/large/neon/orange
	b_color = "#ffcc66"

/obj/item/light/tube/large/neon/purple
	b_color = "#cf90e4"

/obj/item/light/tube/large/neon/pink
	b_color = "#ff6699"

/obj/item/light/tube/large/neon/blue
	b_color = "#99ccff"

/obj/item/light/tube/large/neon/green
	b_color = "#ccff66"

/obj/item/light/tube/large/neon/yellow
	b_color = "#ffff99"

// Streetlights
/obj/item/light/bulb/street
	b_color = "#26d5db"
	b_range = 4.5
	b_power = 1.6

/obj/machinery/light/street
	name = "streetlamp"
	icon = 'mods/content/glitch_city/icons/obj/street.dmi'
	icon_state = "streetlamp_map"
	base_state = "streetlamp"
	desc = "A neon glow to light your way."
	obj_flags = null
	density = TRUE
	light_type = /obj/item/light/bulb/street
	accepts_light_type = /obj/item/light/bulb/street
	frame_type = null // todo: create custom frame item
	construct_state = /decl/machine_construction/noninteractive // todo: create custom construction states
	//on_wall = FALSE

// todo: move toggle into base game
/obj/machinery/light/street/Initialize(mapload, d, populate_parts)
	. = ..()
	light_offset_x = 0
	light_offset_y = 0