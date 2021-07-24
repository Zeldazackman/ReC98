#include "th04/sprites/cels.h"

/// Pattern numbers for the super_*() functions.
/// Since super_entry_bfnt() doesn't take a "start patnum" parameter, the
/// order in which the files are loaded has to match the order here.
typedef enum {
	/// Stage-independent
	/// =================
	// miko32.bft
	// ----------
	PAT_ENEMY_KILL = 4,
	PAT_ENEMY_KILL_last = (PAT_ENEMY_KILL + ENEMY_KILL_CELS - 1),
	PAT_CLOUD_BULLET16_BLUE = 20,
	PAT_CLOUD_BULLET16_BLUE_last = (PAT_CLOUD_BULLET16_BLUE + BULLET_CLOUD_CELS - 1),
	PAT_CLOUD_BULLET16_RED,
	// ----------
	// miko16.bft
	// ----------
	PAT_OPTION_REIMU = 38,
	PAT_OPTION_MARISA,
	PAT_HITSHOT,
	PAT_HITSHOT_last = (PAT_HITSHOT + HITSHOT_CELS - 1),
	PAT_ITEM,

	PAT_BULLET16_N_OUTLINED_BALL_WHITE = 52,
	PAT_BULLET16_N_OUTLINED_BALL_RED,
	PAT_BULLET16_N_OUTLINED_BALL_GREEN,
	PAT_BULLET16_N_OUTLINED_BALL_BLUE,
	PAT_BULLET16_N_STAR,
	PAT_BULLET16_N_BALL_BLUE,
	PAT_BULLET16_N_SMALL_BALL_YELLOW,
	PAT_BULLET16_N_CROSS_YELLOW,
	PAT_BULLET16_N_SMALL_BALL_RED,
	PAT_BULLET16_N_BALL_RED,
	PAT_BULLET16_N_HEART_BALL_RED,

	PAT_EXPLOSION_SMALL = 68,

	PAT_BULLET_ZAP = 72,
	PAT_BULLET_ZAP_last = (PAT_BULLET_ZAP + BULLET_ZAP_CELS - 1),
	PAT_BULLET16_D,
	PAT_BULLET16_D_BLUE = PAT_BULLET16_D,
	PAT_BULLET16_D_BLUE_last = (PAT_BULLET16_D_BLUE + BULLET_D_CELS - 1),
	PAT_BULLET16_D_YELLOW,
	PAT_BULLET16_D_YELLOW_last = (PAT_BULLET16_D_YELLOW + BULLET_D_CELS - 1),

	PAT_DECAY_PELLET,
	PAT_DECAY_PELLET_last = (PAT_DECAY_PELLET + BULLET_DECAY_CELS - 1),
	PAT_DECAY_BULLET16,
	PAT_DECAY_BULLET16_last = (PAT_DECAY_BULLET16 + BULLET_DECAY_CELS - 1),
	/// =================

	/// Stage 6
	/// =======
	// st05.bb1
	// --------
	PAT_YUUKA6_PARASOL_BACK_OPEN = 128,
	PAT_YUUKA6_PARASOL_BACK_HALFOPEN = 130,
	PAT_YUUKA6_PARASOL_BACK_HALFCLOSED = 132,
	PAT_YUUKA6_PARASOL_BACK_CLOSED = 134,
	// --------
	// st05.bb2
	// --------
	PAT_YUUKA6_PARASOL_LEFT_PULL = 136,
	PAT_YUUKA6_PARASOL_FORWARD_CLOSED = 138,
	PAT_YUUKA6_PARASOL_FORWARD_OPEN = 140,
	// --------
	// st05.bb3
	// --------
	PAT_YUUKA6_PARASOL_SHIELD_0 = 142,
	PAT_YUUKA6_PARASOL_SHIELD_1 = 144,
	PAT_YUUKA6_PARASOL_SHIELD_2 = 146,
	PAT_YUUKA6_PARASOL_SHIELD_3 = 148,
	// --------
	// st05.bb4
	// --------
	PAT_YUUKA6_PARASOL_LEFT = 150,
	PAT_YUUKA6_PARASOL_LEFT_FORWARD_PULL = 152,
	PAT_YUUKA6_PARASOL_SPIN_BACK_0 = 154,
	PAT_YUUKA6_PARASOL_SPIN_BACK_1 = 156,
	// --------
	// st05.bb5
	// --------
	PAT_YUUKA6_PARASOL_SPIN_BACK_2 = 158,
	PAT_YUUKA6_PARASOL_SPIN_BACK_3 = 160,
	PAT_YUUKA6_PARASOL_SPIN_BACK_4 = 162,
	PAT_YUUKA6_PARASOL_SPIN_BACK_5 = 164,
	// --------
	// st05.bb6
	// --------
	PAT_YUUKA6_PARASOL_SPIN_BACK_6 = 166,
	PAT_YUUKA6_PARASOL_SPIN_BACK_7 = 168,
	PAT_YUUKA6_PARASOL_SPIN_BACK_8 = 170,
	PAT_YUUKA6_PARASOL_SPIN_BACK_9 = 172,
	// --------
	// st05.bb7
	// --------
	PAT_YUUKA6_VANISH_0 = 174,
	PAT_YUUKA6_VANISH_1 = 176,
	PAT_YUUKA6_VANISH_2 = 178,
	PAT_YUUKA6_VANISH_3 = 180,
	// --------
	/// =======
} main_patnum_t;
