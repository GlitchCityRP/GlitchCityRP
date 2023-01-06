/obj/random/single/cola
	name = "randomly spawned cola"
	icon = 'icons/obj/drinks.dmi'
	icon_state = "cola"
	spawn_object = /obj/item/chems/drinks/cans/cola

/obj/random/mre
	name = "random MRE"
	desc = "This is a random single MRE."
	icon = 'icons/obj/food.dmi'
	icon_state = "mre"

/obj/random/mre/spawn_choices()
	var/static/list/spawnable_choices = list(
		/obj/item/storage/mre,
		/obj/item/storage/mre/menu2,
		/obj/item/storage/mre/menu3,
		/obj/item/storage/mre/menu4,
		/obj/item/storage/mre/menu5,
		/obj/item/storage/mre/menu6,
		/obj/item/storage/mre/menu7,
		/obj/item/storage/mre/menu8,
		/obj/item/storage/mre/menu9,
		/obj/item/storage/mre/menu10
	)
	return spawnable_choices

/obj/random/mre/main
	name = "random MRE main course"
	desc = "This is a random main course for MREs."
	icon_state = "pouch_medium"

/obj/random/mre/main/spawn_choices()
	var/static/list/spawnable_choices = list(
		/obj/item/storage/mrebag,
		/obj/item/storage/mrebag/menu2,
		/obj/item/storage/mrebag/menu3,
		/obj/item/storage/mrebag/menu4,
		/obj/item/storage/mrebag/menu5,
		/obj/item/storage/mrebag/menu6,
		/obj/item/storage/mrebag/menu7,
		/obj/item/storage/mrebag/menu8
	)
	return spawnable_choices

/obj/random/mre/dessert
	name = "random MRE dessert"
	desc = "This is a random dessert for MREs."
	icon_state = "pouch_medium"

/obj/random/mre/dessert/spawn_choices()
	var/static/list/spawnable_choices = list(
		/obj/item/chems/food/candy,
		/obj/item/chems/food/candy/proteinbar,
		/obj/item/chems/food/donut,
		/obj/item/chems/food/donut/jelly,
		/obj/item/chems/food/chocolatebar,
		/obj/item/chems/food/cookie,
		/obj/item/chems/food/poppypretzel,
		/obj/item/clothing/mask/chewable/candy/gum
	)
	return spawnable_choices

/obj/random/mre/dessert/vegan
	name = "random vegan MRE dessert"
	desc = "This is a random vegan dessert for MREs."

/obj/random/mre/dessert/vegan/spawn_choices()
	var/static/list/spawnable_choices = list(
		/obj/item/chems/food/candy,
		/obj/item/chems/food/chocolatebar,
		/obj/item/chems/food/donut/jelly,
		/obj/item/chems/food/plumphelmetbiscuit
	)
	return spawnable_choices

/obj/random/mre/drink
	name = "random MRE drink"
	desc = "This is a random drink for MREs."
	icon_state = "packet_small"

/obj/random/mre/drink/spawn_choices()
	var/static/list/spawnable_choices = list(
		/obj/item/chems/condiment/small/packet/coffee,
		/obj/item/chems/condiment/small/packet/tea,
		/obj/item/chems/condiment/small/packet/cocoa,
		/obj/item/chems/condiment/small/packet/grape,
		/obj/item/chems/condiment/small/packet/orange,
		/obj/item/chems/condiment/small/packet/watermelon,
		/obj/item/chems/condiment/small/packet/apple
	)
	return spawnable_choices

/obj/random/mre/spread
	name = "random MRE spread"
	desc = "This is a random spread packet for MREs."
	icon_state = "packet_small"

/obj/random/mre/spread/spawn_choices()
	var/static/list/spawnable_choices = list(
		/obj/item/chems/condiment/small/packet/jelly,
		/obj/item/chems/condiment/small/packet/honey
	)
	return spawnable_choices

/obj/random/mre/spread/vegan
	name = "random vegan MRE spread"
	desc = "This is a random vegan spread packet for MREs"

/obj/random/mre/spread/vegan/spawn_choices()
	var/static/list/spawnable_choices = list(/obj/item/chems/condiment/small/packet/jelly)
	return spawnable_choices

/obj/random/mre/sauce
	name = "random MRE sauce"
	desc = "This is a random sauce packet for MREs."
	icon_state = "packet_small"

/obj/random/mre/sauce/spawn_choices()
	var/static/list/spawnable_choices = list(
		/obj/item/chems/condiment/small/packet/salt,
		/obj/item/chems/condiment/small/packet/pepper,
		/obj/item/chems/condiment/small/packet/sugar,
		/obj/item/chems/condiment/small/packet/capsaicin,
		/obj/item/chems/condiment/small/packet/ketchup,
		/obj/item/chems/condiment/small/packet/mayo,
		/obj/item/chems/condiment/small/packet/soy
	)
	return spawnable_choices

/obj/random/mre/sauce/vegan/spawn_choices()
	var/static/list/spawnable_choices = list(
		/obj/item/chems/condiment/small/packet/salt,
		/obj/item/chems/condiment/small/packet/pepper,
		/obj/item/chems/condiment/small/packet/sugar,
		/obj/item/chems/condiment/small/packet/soy
	)
	return spawnable_choices

/obj/random/mre/sauce/sugarfree/spawn_choices()
	var/static/list/spawnable_choices = list(
		/obj/item/chems/condiment/small/packet/salt,
		/obj/item/chems/condiment/small/packet/pepper,
		/obj/item/chems/condiment/small/packet/capsaicin,
		/obj/item/chems/condiment/small/packet/ketchup,
		/obj/item/chems/condiment/small/packet/mayo,
		/obj/item/chems/condiment/small/packet/soy
	)
	return spawnable_choices

/obj/random/mre/sauce/crayon/spawn_choices()
	var/static/list/spawnable_choices = list(
		/obj/item/chems/condiment/small/packet/crayon,
		/obj/item/chems/condiment/small/packet/crayon/red,
		/obj/item/chems/condiment/small/packet/crayon/orange,
		/obj/item/chems/condiment/small/packet/crayon/yellow,
		/obj/item/chems/condiment/small/packet/crayon/green,
		/obj/item/chems/condiment/small/packet/crayon/blue,
		/obj/item/chems/condiment/small/packet/crayon/purple,
		/obj/item/chems/condiment/small/packet/crayon/grey,
		/obj/item/chems/condiment/small/packet/crayon/brown
	)
	return spawnable_choices

/obj/random/snack
	name = "random snack"
	desc = "This is a random snack item."
	icon = 'icons/obj/food.dmi'
	icon_state = "sosjerky"

/obj/random/snack/spawn_choices()
	var/static/list/spawnable_choices = list(
		/obj/item/chems/food/liquidfood,
		/obj/item/chems/food/candy,
		/obj/item/chems/drinks/dry_ramen,
		/obj/item/chems/food/chips,
		/obj/item/chems/food/sosjerky,
		/obj/item/chems/food/no_raisin,
		/obj/item/chems/food/spacetwinkie,
		/obj/item/chems/food/cheesiehonkers,
		/obj/item/chems/food/tastybread,
		/obj/item/chems/food/candy/proteinbar,
		/obj/item/chems/food/syndicake,
		/obj/item/chems/food/donut,
		/obj/item/chems/food/donut/jelly,
		/obj/item/pizzabox/meat,
		/obj/item/pizzabox/vegetable,
		/obj/item/pizzabox/margherita,
		/obj/item/pizzabox/mushroom,
		/obj/item/chems/food/plumphelmetbiscuit
	)
	return spawnable_choices
