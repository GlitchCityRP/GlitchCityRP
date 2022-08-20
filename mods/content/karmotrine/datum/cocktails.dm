// KEYWORDS: SOUR, CLASSY, VINTAGE
// MIXED, ICED
/decl/cocktail/bad_touch
	name = "Bad Touch"
	description = "We're nothing but mammals, after all."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "badtouch"
	ratios = list(
		/decl/material/liquid/blendable/bronson_extract =      2,
		/decl/material/liquid/blendable/powdered_delta =       2,
		/decl/material/liquid/capsaicin/flanergide = 2,
		/decl/material/liquid/ethanol/karmotrine =   4
	)
	tastes = list(
		"sour apples" = 0.5,
		"citrus" = 0.5
	)

// KEYWORDS: BUBBLY, CLASSIC, VINTAGE
// MIXED
/decl/cocktail/beer
	name = "Beer"
	description = "Traditionally brewed beer has become a luxury, but this one's pretty close to the real deal..."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "beer"
	ratios = list(
		/decl/material/liquid/blendable/adelhyde =             1,
		/decl/material/liquid/blendable/bronson_extract =      2,
		/decl/material/liquid/blendable/powdered_delta =       1,
		/decl/material/liquid/capsaicin/flanergide = 2,
		/decl/material/liquid/ethanol/karmotrine =   4
	)
	tastes = list(
		"beer" = 0.8,
		"a chemical aftertaste" = 0.2
	)

// KEYWORDS: SPICY, CLASSIC, SOBERING
// BLENDED
/decl/cocktail/bleeding_jane
	name = "Bleeding Jane"
	description = "Say the name of this drink three times in front of a mirror and you'll look like a fool."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "bleedingjane"
	ratios = list(
		/decl/material/liquid/blendable/bronson_extract =      1,
		/decl/material/liquid/blendable/powdered_delta =       3,
		/decl/material/liquid/capsaicin/flanergide = 3
	)
	blended = TRUE
	tastes = list(
		"spicy tomato soup" = 0.6
	)

// KEYWORDS: SWEET, GIRLY, SOFT
// AGED, MIXED
/decl/cocktail/blue_fairy
	name = "Blue Fairy"
	description = "One of these will make all your teeth turn blue. Hope you brushed them well."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "bluefairy"
	ratios = list(
		/decl/material/liquid/blendable/adelhyde/aged =        4,
		/decl/material/liquid/capsaicin/flanergide = 1
	)
	tastes = list(
		"spicy caramel" = 0.5 // still a slight aftertaste of adelhyde
	)

// KEYWORDS: SPICY, PROMO, BLAND
// AGED, ICED, MIXED
/decl/cocktail/bloom_light
	name = "Bloom Light"
	description = "It's so unnecessarily brown..."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "bloomlight"
	ratios = list(
		/decl/material/liquid/blendable/adelhyde/aged =        4,
		/decl/material/liquid/blendable/powdered_delta =       1,
		/decl/material/liquid/capsaicin/flanergide = 2,
		/decl/material/liquid/ethanol/karmotrine =   3,
		/decl/material/solid/ice
	)
	tastes = list(
		"sand" = 0.35 // only apparent once you get to the bottom of the glass
	)

// KEYWORDS: SWEET, CLASSY, HAPPY
// AGED, MIXED
/decl/cocktail/brandtini
	name = "Brandtini"
	description = "8 out of 10 smug assholes would recommend it but they're too busy being smug assholes."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "brandtini"
	ratios = list(
		/decl/material/liquid/blendable/adelhyde/aged =        6,
		/decl/material/liquid/blendable/powdered_delta =       3,
		/decl/material/liquid/ethanol/karmotrine =   1
	)
	tastes = list(
		"drunken fruit" = 0.8,
		"oak" = 0.2 // undertones from sipping it
	)


// KEYWORDS: BUBBLY, CLASSY, BURNING
// ICED, MIXED
/decl/cocktail/cobaltvelvet
	name = "Cobalt Velvet"
	description = "It's like champagne served in a cup that had a bit of cola left."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "cobaltvelvet"
	ratios = list(
		/decl/material/liquid/blendable/adelhyde =             2,
		/decl/material/liquid/capsaicin/flanergide = 3,
		/decl/material/liquid/ethanol/karmotrine =   5,
		/decl/material/solid/ice
	)
	tastes = list(
		"fizzy wine" = 0.5,
		"diet cola" = 0.5
	)


// KEYWORDS: SOUR, MANLY, SOBERING
// BLENDED
/decl/cocktail/crevicespike
	name = "Crevice Spike"
	description = "It will knock the drunkenness out of you or knock you out cold."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "crevice_spike"
	ratios = list(
		/decl/material/liquid/blendable/powdered_delta =       2,
		/decl/material/liquid/capsaicin/flanergide = 4
	)
	blended = TRUE
	tastes = list(
		"sour grapes" = 1
	)

// KEYWORDS: SPICY, CLASSY
// MIXED
/decl/cocktail/flamingmoai
	name = "Flaming Moai"
	description = "One adelhyde, one Bronson, two delta, three flanergide, and five karmotrine...! Mixed! Without ice... and no aging! Aaah, nothing beats it!"
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "flamingmoai"
	ratios = list(
		/decl/material/liquid/blendable/adelhyde =             1,
		/decl/material/liquid/blendable/bronson_extract =      1,
		/decl/material/liquid/blendable/powdered_delta =       2,
		/decl/material/liquid/capsaicin/flanergide = 3,
		/decl/material/liquid/ethanol/karmotrine =   5,
	)
	tastes = list(
		"burning spiciness" = 1
	)
	hidden_from_codex = TRUE

// KEYWORDS: SOFT, GIRLY, SOUR
// MIXED, AGED
/decl/cocktail/fluffydream
	name = "Fluffy Dream"
	description = "A couple of these will make your tongue feel velvet-y. More of them and you'll be sleeping soundly."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "fluffydream"
	ratios = list(
		/decl/material/liquid/blendable/adelhyde/aged =        3,
		/decl/material/liquid/blendable/powdered_delta =       3
	)
	tastes = list(
		"lime soda" = 1
	)

// KEYWORDS: BUBBLY, CLASSY, STRONG
// MIXED, AGED
/decl/cocktail/fringe_weaver
	name = "Fringe Weaver"
	description = "It's like drinking ethylic alcohol with a spoonful of sugar."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "fringe_weaver"
	ratios = list(
		/decl/material/liquid/blendable/adelhyde/aged =        1,
		/decl/material/liquid/ethanol/karmotrine =   9
	)
	// default taste; it's just alcohol and sugar

// KEYWORDS: BUBBLY, CLASSIC, BLAND
// MIXED, AGED
/decl/cocktail/frothywater
	name = "Frothy Water"
	description = "PG-rated shows' favorite Beer ersatz since 2040."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "beer"
	ratios = list(
		/decl/material/liquid/blendable/adelhyde/aged =        1,
		/decl/material/liquid/blendable/bronson_extract/aged = 1,
		/decl/material/liquid/blendable/powdered_delta =       1,
		/decl/material/liquid/capsaicin/flanergide = 1
	)
	tastes = list(
		"water" = 2 // tastes like nothing
	)

// KEYWORDS: BITTER, PROMO, BLAND
// BLENDED
/decl/cocktail/grizzlytemple
	name = "Grizzly Temple"
	description = "This one's kinda unbearable. It's mostly for fans of the movie it was used on."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "grizzlytemple"
	ratios = list(
		/decl/material/liquid/blendable/adelhyde =             3,
		/decl/material/liquid/blendable/bronson_extract =      3,
		/decl/material/liquid/blendable/powdered_delta =       3,
		/decl/material/liquid/ethanol/karmotrine =   1
	)
	blended = TRUE
	// tastes bland and like chemicals, so exactly what it's made of

// KEYWORDS: BITTER, MANLY, STRONG
// MIXED, AGED
/decl/cocktail/gutpunch
	name = "Gut Punch"
	description = "It's supposed to mean \"a punch made of innards,\" but the name actually described what you feel while drinking it."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "gutpunch"
	ratios = list(
		/decl/material/liquid/blendable/bronson_extract/aged = 5,
		/decl/material/liquid/capsaicin/flanergide = 1
	)
	// bitter and spicy, so it tastes exactly like its ingredients

// KEYWORDS: SPICY, MANLY, STRONG
// BLENDED
/decl/cocktail/marsblast
	name = "Marsblast"
	description = "One of these is enough to leave your face red like the actual planet."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "marsblast"
	ratios = list(
		/decl/material/liquid/blendable/bronson_extract =      6,
		/decl/material/liquid/blendable/powdered_delta =       1,
		/decl/material/liquid/capsaicin/flanergide = 4,
		/decl/material/liquid/ethanol/karmotrine =   2
	)
	blended = TRUE
	tastes = list(
		"face-burning spiciness" = 0.5,
		"strong alcohol" = 0.5
	)

// KEYWORDS: SOUR, CLASSY, BURNING
// ICED, BLENDED
/decl/cocktail/mercuryblast
	name = "Mercuryblast"
	description = "No thermometer was harmed in the creation of this drink."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "mercuryblast"
	ratios = list(
		/decl/material/liquid/blendable/adelhyde =             1,
		/decl/material/liquid/blendable/bronson_extract =      1,
		/decl/material/liquid/blendable/powdered_delta =       3,
		/decl/material/liquid/capsaicin/flanergide = 3,
		/decl/material/liquid/ethanol/karmotrine =   2,
		/decl/material/solid/ice
	)
	blended = TRUE

// KEYWORDS: SWEET, GIRLY, COLD, HAPPY
// ICED, BLENDED
/decl/cocktail/moonblast
	name = "Moonblast"
	description = "No relation to the Hadron cannon you can see on the moon for one week every month."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "moonblast"
	ratios = list(
		/decl/material/liquid/blendable/adelhyde =             6,
		/decl/material/liquid/blendable/powdered_delta =       1,
		/decl/material/liquid/capsaicin/flanergide = 1,
		/decl/material/liquid/ethanol/karmotrine =   2,
		/decl/material/solid/ice
	)
	blended = TRUE

// KEYWORDS: SOUR, PROMO, COLD, STRONG
// MIXED, ICED
/decl/cocktail/piano_man
	name = "Piano Man"
	description = "This drink does not represent the opinions of the Bar Pianists Union or its associates."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "pianoman"
	ratios = list(
		/decl/material/liquid/blendable/adelhyde =             2,
		/decl/material/liquid/blendable/bronson_extract =      3,
		/decl/material/liquid/blendable/powdered_delta =       5,
		/decl/material/liquid/capsaicin/flanergide = 5,
		/decl/material/liquid/ethanol/karmotrine =   3,
		/decl/material/solid/ice
	)
	tastes = list(
		"sour oranges" = 1
	)

// KEYWORDS: SWEET, PROMO, HAPPY
// MIXED, AGED
/decl/cocktail/piano_woman
	name = "Piano Woman"
	description = "It was originally called Pretty Woman, but too many people complained there should be a Piano Woman if there was a Piano Man."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "pianowoman"
	ratios = list(
		/decl/material/liquid/blendable/adelhyde/aged =        5,
		/decl/material/liquid/blendable/bronson_extract/aged = 5,
		/decl/material/liquid/blendable/powdered_delta =       2,
		/decl/material/liquid/capsaicin/flanergide = 3,
		/decl/material/liquid/ethanol/karmotrine =   3
	)
	tastes = list(
		"sweet citrusy syrup" = 1
	)

// KEYWORDS: BITTER, MANLY, BURNING
// MIXED
/decl/cocktail/piledriver
	name = "Pile Driver"
	description = "It doesn't burn as hard on the tongue but you better not have a sore throat when drinking it..."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "piledriver"
	ratios = list(
		/decl/material/liquid/blendable/bronson_extract =      3,
		/decl/material/liquid/capsaicin/flanergide = 3,
		/decl/material/liquid/ethanol/karmotrine =   4
	)
	tastes = list(
		"a sore throat" = 1
	)

// KEYWORDS: SWEET, GIRLY, HAPPY
// MIXED, AGED
/decl/cocktail/sparklestar
	name = "Sparkle Star"
	description = "They used to actually sparkle, but too many complaints about skin problems made them redesign the drink without sparkling."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "sparklestar"
	ratios = list(
		/decl/material/liquid/blendable/adelhyde/aged =        2,
		/decl/material/liquid/blendable/powdered_delta =       1
	)
	tastes = list(
		"tangy bubbles" = 0.5,
		"sweet caramel" = 0.5
	)

// KEYWORDS: SWEET, GIRLY, HAPPY
// MIXED
/decl/cocktail/sugarrush
	name = "Sugar Rush"
	description = "Sweet, light and fruity. As girly as it gets."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "sugarrush"
	ratios = list(
		/decl/material/liquid/blendable/adelhyde =             2,
		/decl/material/liquid/blendable/powdered_delta =       1
	)
	tastes = list(
		"fruity cotton candy" = 1
	)

// KEYWORDS: BITTER, GIRLY, COLD, SOFT
// ICED, BLENDED
/decl/cocktail/sunshinecloud
	name = "Sunshine Cloud"
	description = "Tastes like old chocolate milk with its good smell intact. Some say it tastes like caramel too..."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "sunshinecloud"
	ratios = list(
		/decl/material/liquid/blendable/adelhyde =             2,
		/decl/material/liquid/blendable/bronson_extract =      2,
		/decl/material/solid/ice
	)
	blended = TRUE
	tastes = list(
		"old chocolate milk" = 0.7,
		"caramel" = 0.3 // easier to taste if you're sensitive or drink slowly
	)


// KEYWORDS: BITTER, MANLY, COLD, BURNING
// ICED, MIXED
/decl/cocktail/suplex
	name = "Suplex"
	description = "A small twist on the Piledriver, putting more emphasis on the tongue burning and less on the throat burning."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "piledriver"
	ratios = list(
		/decl/material/liquid/blendable/adelhyde =             2,
		/decl/material/liquid/blendable/bronson_extract =      4,
		/decl/material/liquid/capsaicin/flanergide = 3,
		/decl/material/liquid/ethanol/karmotrine =   3,
		/decl/material/solid/ice
	)
	hidden_from_codex = TRUE
	tastes = list(
		"spicy numbness" = 1
	)

// KEYWORDS: SOUR, PROMO, BLAND
// ICED, MIXED
/decl/cocktail/zenstar
	name = "Zen Star"
	description = "You'd think something so balanced would actually taste nice... you'd be dead wrong."
	glass_icon = 'mods/content/karmotrine/icons/cocktails.dmi'
	glass_icon_state = "zenstar"
	ratios = list(
		/decl/material/liquid/blendable/adelhyde =             4,
		/decl/material/liquid/blendable/bronson_extract =      4,
		/decl/material/liquid/blendable/powdered_delta =       4,
		/decl/material/liquid/capsaicin/flanergide = 4,
		/decl/material/liquid/ethanol/karmotrine =   4,
		/decl/material/solid/ice
	)
	// tastes like the disgusting mix of its ingredients it is