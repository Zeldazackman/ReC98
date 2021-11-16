#pragma option -zPmain_01

extern "C" {
#include <stddef.h>
#include "platform.h"
#include "pc98.h"
#include "planar.h"
#include "master.hpp"
#include "th03/formats/cdg.h"
#include "th04/common.h"
#include "th04/score.h"
#include "th04/main/playfld.hpp"
#include "th04/main/stage/stage.hpp"
#include "th04/main/rank.hpp"
#include "th04/sprites/main_cdg.h"
}
#if (GAME == 5)
	#include "th05/resident.hpp"
	#include "th05/chars.h"
	#include "th05/shiftjis/fns.hpp"
#else
	#include "th04/resident.hpp"
	#include "th04/chars.h"
	#include "th04/shiftjis/fns.hpp"
#endif
#include "th04/main/ems.hpp"

extern char *eyename;	/* ZUN symbol [MAGNet2010] */
extern char *bbname; 	/* ZUN symbol [MAGNet2010] */

inline void ems_write_cdg_color_planes(
	seg_t &handle, long offset, main_cdg_slot_t slot
) {
	ems_write(
		handle,
		offset,
		cdg_slots[slot].seg_colors(),
		(cdg_slots[slot].bitplane_size * PLANE_COUNT)
	);
}

// ZUN bug: Should clamp the amount of images to the maximum amount allocated
// in the EMS cache area.
#define ems_transfer_cdgs_until_freed_slot(offset_first, slot_first) { \
	int slot = slot_first; \
	uint32_t offset = offset_first; \
	size_t bitplane_size = cdg_slots[slot_first].bitplane_size; \
	\
	while(cdg_slots[slot].seg_alpha()) { \
		ems_write(Ems, offset, cdg_slots[slot].seg_alpha(), bitplane_size); \
		offset += bitplane_size; \
		ems_write( \
			Ems, \
			offset, \
			cdg_slots[slot].seg_colors(), \
			(bitplane_size * PLANE_COUNT) \
		); \
		offset += (bitplane_size * PLANE_COUNT); \
		cdg_free(slot); \
		slot++; \
	} \
}

void near ems_allocate_and_preload_eyecatch(void)
{
	#undef EMS_NAME
	extern const char EMS_NAME[];

	// Luckily, these assignments are also done later, and the game doesn't
	// rely on them inbetween.
	stage_id = resident->stage;
	if(stage_id == STAGE_EXTRA) {
		rank = RANK_EXTRA;
	} else {
		rank = resident->rank;
	}

	#if (GAME == 4)
		eyename[3] = ('0' + rank);
	#endif

	Ems = NULL;
	if(!ems_exist() || (ems_space() < EMSSIZE)) {
		return;
	}
	Ems = ems_allocate(EMSSIZE);
	if(Ems) {
		ems_setname(Ems, EMS_NAME);
		cdg_load_single_noalpha(CDG_EYECATCH, eyename, 0);
		ems_write_cdg_color_planes(Ems, EMS_EYECATCH_OFFSET, CDG_EYECATCH);
		cdg_free(CDG_EYECATCH);
	}
}

void near bomb_bg_load__ems_preload_playchar_cdgs(void)
{
	#undef FACESET_REIMU_FN
	#undef FACESET_MARISA_FN
	#undef FACESET_MIMA_FN
	#undef FACESET_YUUKA_FN
	#define FACESET_REIMU_FN FACESET_REIMU_FN_0
	#define FACESET_MARISA_FN FACESET_MARISA_FN_0
	extern const char FACESET_REIMU_FN[];
	extern const char FACESET_MARISA_FN[];
	extern const char FACESET_MIMA_FN[];
	extern const char FACESET_YUUKA_FN[];

	#if (GAME == 5)
		bbname[2] = ('0' + resident->playchar);
		cdg_load_all_noalpha(CDG_BG_PLAYCHAR_BOMB, bbname);
	#else
		bbname[2] = resident->playchar_ascii;
		cdg_load_single_noalpha(CDG_BG_PLAYCHAR_BOMB, bbname, 0);
	#endif

	if(Ems) {
		ems_write_cdg_color_planes(
			Ems, EMS_PLAYCHAR_BOMB_BG_OFFSET, CDG_BG_PLAYCHAR_BOMB
		);
		main_cdg_load_faceset_playchar();
		ems_transfer_cdgs_until_freed_slot(
			EMS_FACESET_PLAYCHAR_OFFSET, CDG_FACESET_PLAYCHAR
		)
	}
}

#if (GAME == 5)
	void pascal near ems_preload_boss_faceset(const char *fn)
	{
		if(!Ems) {
			return;
		}
		cdg_load_all(CDG_FACESET_BOSS, fn);
		ems_transfer_cdgs_until_freed_slot(
			EMS_FACESET_BOSS_OFFSET, CDG_FACESET_BOSS
		);
	}
#endif
