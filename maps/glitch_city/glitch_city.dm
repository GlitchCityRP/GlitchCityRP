#if !defined(USING_MAP_DATUM)

	#include "../../mods/content/mundane.dm"
	#include "../../mods/content/glitch_city/_glitch_city.dme"
	#include "../../mods/content/karmotrine/_karmotrine.dme"
	#include "../../mods/content/mouse_highlights/_mouse_highlight.dme"
	#include "../../mods/content/scaling_descriptors.dm"
	#include "../../mods/content/matchmaking/_matchmaking.dme"

	#include "../../mods/species/utility_frames/_utility_frames.dme"

	#include "glitch_city_areas.dm"
	#include "glitch_city_departments.dm"
	#include "glitch_city_jobs.dm"

	#include "jobs/bar.dm"
	#include "jobs/civilian.dm"

	#include "outfits/bar.dm"

	#include "glitch_city-1.dmm"

	#define USING_MAP_DATUM /datum/map/glitch_city

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Tradeship

#endif
