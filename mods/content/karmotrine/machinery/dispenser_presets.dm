/obj/machinery/chemical_dispenser/calicomp
	name = "\improper CALICOMP 0.9"
	desc = "A cheap prototype of the CALICOMP bartending assistant. It has a single slot for drinks and six buttons for ingredients. At least it comes with ice!"
	icon_state = "booze_dispenser"
	ui_title = "ＣＡＬＩＣＯＭＰ ０.９"
	accept_drinking = 1
	core_skill = SKILL_COOKING
	can_contaminate = FALSE //See above.
	base_type = /obj/machinery/chemical_dispenser/calicomp
	beaker_offset = -2
	beaker_positions = list(-3,2,7,12,17)

/obj/machinery/chemical_dispenser/calicomp/full
	spawn_cartridges = list(
			/obj/item/chems/chem_disp_cartridge/karmotrine,
			/obj/item/chems/chem_disp_cartridge/adelhyde,
			/obj/item/chems/chem_disp_cartridge/bronson_extract,
			/obj/item/chems/chem_disp_cartridge/powdered_delta,
			/obj/item/chems/chem_disp_cartridge/flanergide,
			/obj/item/chems/chem_disp_cartridge/ice,
			/obj/item/chems/chem_disp_cartridge/instant_age,
		)

	buildable = FALSE

/obj/machinery/chemical_dispenser/bar_alc
	name = "\improper CaliCOMP 2.0"
	desc = "A high-end variant of the CaliCOMP. This kind of thing is way out of the budget of most people in Glitch City, as it's stocked with all kinds of expensive, real alcohols."
	ui_title = "ＣＡＬＩＣＯＭＰ ２.０"