/decl/chemical_reaction/adelhyde_aging
	name = "Adelhyde Aging"
	result = /decl/material/liquid/blendable/adelhyde/aged
	required_reagents = list(
		/decl/material/liquid/blendable/adelhyde = 1
	)
	catalysts = list(
		/decl/material/solid/instant_age = 1
	)
	result_amount = 1

/decl/chemical_reaction/bronson_aging
	name = "Bronson Extract Aging"
	result = /decl/material/liquid/blendable/bronson_extract/aged
	required_reagents = list(
		/decl/material/liquid/blendable/bronson_extract = 1
	)
	catalysts = list(
		/decl/material/solid/instant_age = 1
	)
	result_amount = 1

// If you use exactly 1u, it'll be used up after aging all the ingredients in the drink.
/decl/chemical_reaction/instant_age_consumption
	name = "Adelhyde Insta-Age Consumption"
	result = /decl/material/liquid/blendable/adelhyde/aged
	required_reagents = list(
		/decl/material/liquid/blendable/adelhyde/aged = 1,
		/decl/material/solid/instant_age = 1
	)
	result_amount = 1
	mix_message = null

/decl/chemical_reaction/instant_age_consumption/bronson
	name = "Bronson Extract Insta-Age Consumption"
	result = /decl/material/liquid/blendable/bronson_extract/aged
	required_reagents = list(
		/decl/material/liquid/blendable/bronson_extract/aged = 1,
		/decl/material/solid/instant_age = 1
	)
	inhibitors = list(
		/decl/material/liquid/blendable/adelhyde/aged // default to adelhyde to avoid splitting it and leaving some left over
	)