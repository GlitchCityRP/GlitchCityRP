/datum/map/glitch_city
	name = "Glitch City"
	full_name = "Glitch City Sector DS"
	path = "glitch_city"
	ground_noun = "ground"

	station_name  = "Glitch City Sector DS"
	station_short = "Sector DS"

	dock_name     = "Glitch City Sector VA"
	boss_name     = "Mayor QUINCY"
	boss_short    = "QUINCY"
	company_name  = "Zaibatsu Corp."
	company_short = "Zaibatsu"
	num_exoplanets = 0
	evac_controller_type = null // Nowhere to run!

	starting_money = 5000
	department_money = 0
	salary_modifier = 0.2

	exterior_atmos_composition = list(
		/decl/material/gas/oxygen = MOLES_O2STANDARD,
		/decl/material/gas/nitrogen = MOLES_N2STANDARD
	)

	allowed_spawns = list(
		/decl/spawnpoint/arrivals
	)

/datum/map/glitch_city/get_map_info()
	return "You're in [station_short] of Glitch City, a zone that was recently cordoned off due to civil unrest within its \
	neighbors. Under the heel of the often-corrupt White Knights, the mercurial and impotent rule of [boss_name], and the \
	omnipresent	influence of [company_name], you have no options but to merely try to survive."

/datum/map/glitch_city/create_trade_hubs()
	new /datum/trade_hub/singleton/glitch_city

/datum/trade_hub/singleton/glitch_city
	name = "Glitch City Freight Network"

/datum/trade_hub/singleton/glitch_city/get_initial_traders()
	return list(
		/datum/trader/medical,
		/datum/trader/mining,
		/datum/trader/books
	)
