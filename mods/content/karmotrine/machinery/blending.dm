#define BLENDED "blended"

/decl/cocktail/get_additional_guide_text()
	if(blended)
		LAZYADD(., "Blend until smooth.")
	else if(!order_specific)
		LAZYADD(., "Mix thoroughly.")
	if((/decl/material/solid/ice in display_ratios) && !isnum(display_ratios[/decl/material/solid/ice])) // ice to taste
		LAZYADD(., "Serve over ice.")

/decl/cocktail/get_additional_mechanics_text()
	if(blended)
		LAZYADD(., "All blended.")
	else if(!order_specific)
		LAZYADD(., "All mixed.")
	if((/decl/material/solid/ice in display_ratios) && !isnum(display_ratios[/decl/material/solid/ice])) // ice to taste
		LAZYADD(., "On the rocks.")

/obj/machinery/reagentgrinder/juicer/end_grind(mob/user)
	. = ..()
	if(!LAZYLEN(beaker?.reagents?.reagent_volumes))
		return
	var/is_blended = FALSE
	// give all the cocktail chemicals in the beaker the 'blended' data
	for(var/chem_path in beaker.reagents.reagent_volumes)
		if (!ispath(chem_path, /decl/material/liquid/blendable))
			continue
		LAZYSET(beaker.reagents.reagent_data, chem_path, list(BLENDED = TRUE))
		is_blended = TRUE
	if(is_blended)
		visible_message(SPAN_NOTICE("The contents of \the [beaker] settle into a fine liquid."))

/decl/material/liquid/blendable
	abstract_type = /decl/material/liquid/blendable

// mix_data isn't called without initial data, so we set it to false here
/decl/material/liquid/blendable/initialize_data(var/newdata)
	. = ..() || list()
	.[BLENDED] ||= FALSE

/decl/material/liquid/blendable/mix_data(var/datum/reagents/reagents, var/list/newdata, var/amount)
	. = ..()
	if(LAZYACCESS(., BLENDED) && !LAZYACCESS(newdata, BLENDED)) // have to re-blend if you add unblended reagents
		.[BLENDED] = FALSE

/decl/cocktail
	var/blended = FALSE /// if TRUE, checks for BLENDED in reagent data during matches()

/decl/cocktail/matches(obj/item/prop)
	if(!(. = ..()))
		return
	if(!blended)
		return
	var/is_blended = FALSE
	for(var/chem_path in prop.reagents.reagent_volumes)
		if (!ispath(chem_path, /decl/material/liquid/blendable))
			continue
		var/list/data = REAGENT_DATA(prop.reagents, chem_path)
		if(!LAZYACCESS(data, BLENDED))
			return FALSE
		is_blended = TRUE
	if(!is_blended)
		CRASH("Cocktail [src.name] ([src.type]) has blended set but has no blendable ingredients!")
	return TRUE

#undef BLENDED