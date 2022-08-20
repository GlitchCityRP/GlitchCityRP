/decl/material/liquid/ethanol/karmotrine
	name = "karmotrine"
	lore_text = "A synthetic ethanol substitute, imported to Glitch City in bulk by the British Trademark Council."
	taste_description = "synthetic alcohol"
	color = "#c5e5e4"
	strength = 8
	exoplanet_rarity = MAT_RARITY_NOWHERE
	uid = "chem_ethanol_karmotrine"

	glass_name = "karmotrine"
	glass_desc = "A glass of pure alcoholic concentrate. Cheaper than ethanol, and packs a stronger punch."

/decl/material/liquid/blendable/adelhyde
	name = "adelhyde"
	codex_name = "raw adelhyde"
	lore_text = "An artificial sweetener invented in 2067 by a research lab trying to find a healthy, non-carcinogenic alternative \
	to contemporary sweeteners. They failed, but the rights to the resulting product were purchased by the British Trademark Council \
	for use in all of their bars in Glitch City."
	color = "#e32642"
	taste_mult = 0.4
	taste_description = "sweetness"
	exoplanet_rarity = MAT_RARITY_NOWHERE
	uid = "chem_adelhyde"

	glass_name = "adelhyde"
	glass_desc = "A glass of pure artificial sweetener. It's like guzzling sugar, if you could afford sugar."

/decl/material/liquid/blendable/adelhyde/aged
	name = "aged adelhyde"
	codex_name = null
	lore_text = "Artificial sweetener, artificially aged. The artificial aging process makes it taste like caramel, with slight smoky undertones."
	color = "#a33329"
	taste_description = "smoky caramel"
	uid = "chem_adelhyde_aged"

	glass_name = "aged adelhyde"
	glass_desc = "A glass of artificially-aged sweetener. It's like guzzling caramel syrup."

/decl/material/liquid/blendable/powdered_delta
	name = "powdered delta"
	lore_text = "Originally a vitamin C supplement developed to deal with a resurgence in nano-scurvy in 2062, powdered delta has also \
	gained popularity as a flavor additive, sour candy coating, facial cleanser, rust remover, and defoliant."
	color = "#88a6e4"
	taste_mult = 0.4
	taste_description = "tangy sourness"
	exoplanet_rarity = MAT_RARITY_NOWHERE
	uid = "chem_powdered_delta"

	glass_name = "powdered delta"
	glass_desc = "A glass of powdered delta. Technically speaking, it's medicine, an industrial cleaning agent, and a drink flavorant all at the same time."

/decl/material/liquid/blendable/bronson_extract
	name = "bronson extract"
	codex_name = "raw bronson extract"
	lore_text = "A bitter, flammable compound extracted from the bronson root plant. Pure bronson extract was made infamous after \
	an incident where a celebrity TV stunt bartender's venue caught fire live on air, spurring the British Trademark Council to \
	warn the public about irresponsible uses of bronson extract, as well as to sell it massively diluted at a high markup."
	color = "#ffc73e"
	taste_mult = 0.4
	taste_description = "bitter earthiness"
	exoplanet_rarity = MAT_RARITY_NOWHERE
	uid = "chem_bronson_extract"
	fuel_value = 1 // as strong as welding fuel, be careful

	glass_name = "bronson extract"
	glass_desc = "A glass of bronson extract. It tastes like you're drinking a plant taken straight out of the dirt... which you basically are."

/decl/material/liquid/blendable/bronson_extract/aged
	name = "aged bronson extract"
	codex_name = null
	lore_text = "Artificially aging bronson extract enhances its earthy, slightly nutty flavor while subduing its bitter tones. \
	The aging process also makes it much less flammable due to partial oxidisation of its volatile compounds."
	color = "#a38529"
	taste_description = "nutty earthiness"
	fuel_value = 0.4 // much less dangerous since it's partially oxidised
	uid = "chem_bronson_extract_aged"

	glass_name = "aged bronson extract"
	glass_desc = "A glass of aged bronson extract. Tastes less like dirt and more like grass, but it's probably better for your teeth."

/decl/material/liquid/capsaicin/flanergide
	name = "flanergide"
	codex_name = "diluted flanergide"
	lore_text = "Flanergide is a chemical irritant and lachrymatory agent used by the White Knights of Glitch City for crowd control, \
	and as a cost-effective alternative to capsaicin by the British Trademark Council in various spicy cocktails."
	color = "#a3c770"
	taste_mult = 0.4
	taste_description = "oily spiciness"
	exoplanet_rarity = MAT_RARITY_NOWHERE
	heating_point = T100C
	heating_message = "darkens and thickens as it separates from its water content"
	heating_products = list(
		/decl/material/liquid/capsaicin/condensed/flanergide = 0.5,
		/decl/material/liquid/water = 0.5
	)
	discomfort_message = "<span class='danger'>Your mouth feels uncomfortably hot.</span>"
	agony_dose = 6 // Big drinks with flanergide are going to be spicy, especially if you drink them quickly.
	uid = "chem_flanergide"

// used in White Knight crowd control spray/grenades
/decl/material/liquid/capsaicin/condensed/flanergide
	name = "concentrated flanergide"
	codex_name = null
	lore_text = "Unlike its dilute counterpart, concentrated flanergide is painfully irritating on exposure, and often leads to vomiting, \
	crying, and shortness of breath. Some brave souls still try to substitute it for diluted flanergide in their cocktails anyway, and pay the price."
	color = "#7a9a47"
	taste_description = "pure, concentrated pain"
	exoplanet_rarity = MAT_RARITY_NOWHERE
	heating_point = null
	heating_products = null
	uid = "chem_flanergide_concentrated"

// used to age drinks
/decl/material/solid/instant_age
	name = "Insta-Age"
	lore_text = "A proprietary blend of powerful oxidisers, reputed to be safe for human consumption. Supposedly. \
	Used to artificially age ingredients in cocktails."
	color = "#4d0000"
	taste_description = "rust"
	exoplanet_rarity = MAT_RARITY_NOWHERE
	taste_mult = 1.1 // don't leave any in your drinks, mix carefully
	uid = "chem_instant_age"