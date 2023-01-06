/datum/job/gc_bartender
	title = "Bartender"
	description = "As the bartender for Station 13, you 'mix drinks and change lives', whatever that means."
	total_positions = 1
	spawn_positions = 1
	supervisors = "the British Trademark Council and the bar manager"
	primary_department = /decl/department/bar
	outfit_type = /decl/hierarchy/outfit/job/bartender

/datum/job/gc_barback
	title = "Barback"
	description = "As a barback for Station 13, you assist the bartender in running the bar and keeping customers happy."
	total_positions = 1
	spawn_positions = 1
	supervisors = "the British Trademark Council, the bartender, and the bar manager"
	primary_department = /decl/department/bar
	outfit_type = /decl/hierarchy/outfit/job/barback
	hud_icon = "hudjanitor" // TODO: REPLACE

/datum/job/gc_bar_manager
	title = "Bar Manager"
	description = "As the manager of Station 13, you are trusted to promote the interests of the British Trademark Council \
	and ensure the bar turns the most profit possible. You have a remarkable amount of discretion over how to operate your \
	bar, however; manage your menu, employees, and location as you see fit."
	total_positions = 1
	spawn_positions = 1
	supervisors = "the British Trademark Council"
	primary_department = /decl/department/bar
	outfit_type = /decl/hierarchy/outfit/job/bar_manager
	hud_icon = "hudbartender" // TODO: REPLACE