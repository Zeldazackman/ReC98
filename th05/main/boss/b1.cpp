/// Stage 1 Boss - Sara
/// -------------------

#pragma option -zCB1_UPDATE_TEXT -zPmain_03

#include "platform.h"
#include "pc98.h"
#include "th01/math/area.hpp"
#include "th01/math/subpixel.hpp"
extern "C" {
#include "th04/math/motion.hpp"
#include "th04/math/randring.hpp"
#include "th04/snd/snd.h"
#include "th04/main/playfld.hpp"
#include "th04/main/pattern.hpp"
#include "th04/main/bullet/bullet.hpp"
}
#include "th04/main/gather.hpp"
#include "th05/sprites/main_pat.h"
#include "th05/main/boss/boss.hpp"

// Constants
// ---------

static const int PHASE_2_PATTERN_START_FRAME = 16;
static const int PHASE_3_PATTERN_START_FRAME = 32;

enum sara_colors_t {
	COL_GATHER_1 = 9,
	COL_GATHER_2 = 8,
};
// ---------

// State
// -----

union sara_state_t {
	struct {
		/* -------------------- */ int8_t _unused_1[9];
		uint8_t fly_delay;
		uint8_t pattern_prev;
		/* -------------------- */ int8_t _unused_2;
		/* -------------------- */ int8_t _unused_3;
		unsigned char angle_stacks;
		unsigned char angle_clockwise;
		unsigned char angle_counterclockwise;
	} phase_2;

	struct {
		/* -------------------- */ int8_t _unused_1[9];
		uint8_t pattern_duration;
		uint8_t pattern_prev;
		/* -------------------- */ int8_t _unused_2;
		/* -------------------- */ int8_t _unused_3;
		SubpixelLength8 ring_speed;
		unsigned char angle_counterclockwise;
		unsigned char angle_clockwise;
	} phase_3;

	struct {
		/* -------------------- */ int8_t _unused[13];
		uint8_t laser_angle_interval;
		uint8_t random_ball_count;
		unsigned char spread_angle;
	} phase_4;
};

#define state reinterpret_cast<sara_state_t *>(boss_statebyte)

#define phase_2_3_pattern sara_phase_2_3_pattern
extern pattern_loop_func_t phase_2_3_pattern;
// -----

void near phase_2_with_pattern(void)
{
	if(boss.phase_frame < PHASE_2_PATTERN_START_FRAME) {
		gather_add_only_3stack(
			(boss.phase_frame - 1), COL_GATHER_1, COL_GATHER_2
		);
		if(boss.phase_frame == 1) {
			snd_se_play(8);
			state->phase_2.angle_counterclockwise = 0x80;
			state->phase_2.angle_clockwise = 0x00;
			state->phase_2.angle_stacks = 0x08;
		}
		return;
	}
	if(boss_flystep_random(boss.phase_frame - PHASE_2_PATTERN_START_FRAME)) {
		boss.phase_frame = 0;
		boss.mode = 0;
	}
	phase_2_3_pattern();
}

#define pattern_blue(pattern_angle, angle_delta) { \
	if((boss.phase_frame % 2) == 0) { \
		bullet_template.spawn_type = BST_CLOUD_FORWARDS; \
		bullet_template.patnum = PAT_BULLET16_N_BALL_BLUE; \
		bullet_template.group = BG_SINGLE; \
		bullet_template.angle = pattern_angle; \
		bullet_template.speed.set(1.5f); \
		bullet_template_tune(); \
		bullets_add_regular(); \
		pattern_angle = (pattern_angle + angle_delta); \
	} \
}

void near pattern_blue_curve_counterclockwise(void)
{
	pattern_blue(state->phase_2.angle_counterclockwise, -0x0A);
}

void near pattern_blue_curve_clockwise(void)
{
	pattern_blue(state->phase_2.angle_clockwise, +0x0A);
}

void near pattern_aimed_red_spread_stack(void)
{
	if(boss.phase_frame == (PHASE_2_PATTERN_START_FRAME + 16)) {
		bullet_template.spawn_type = (BST_CLOUD_FORWARDS | BST_NO_SLOWDOWN);
		bullet_template.patnum = PAT_BULLET16_N_BALL_RED;
		bullet_template.group = BG_SPREAD_STACK_AIMED;
		bullet_template.angle = 0;
		bullet_template.set_spread_stack(5, 0x10, 5, 0.4375f);
		bullet_template.speed.set(1.0f);
		bullet_template_tune();
		bullets_add_regular();
		snd_se_play(15);
	}
}

void near pattern_red_stacks(void)
{
	if((boss.phase_frame % 8) == 0) {
		bullet_template.spawn_type = (BST_CLOUD_FORWARDS | BST_NO_SLOWDOWN);
		bullet_template.patnum = PAT_BULLET16_N_BALL_RED;
		bullet_template.group = BG_STACK;
		bullet_template.angle = (
			boss.angle + state->phase_2.angle_stacks - 0x80
		);
		bullet_template.set_stack(8, 0.375f);
		bullet_template.speed.set(1.0f);
		bullet_template_tune();
		bullets_add_regular();
		state->phase_2.angle_stacks -= 0x08;
		snd_se_play(15);
	}
}

void near phase_3_with_pattern(void)
{
	if(boss.phase_frame < PHASE_3_PATTERN_START_FRAME) {
		gather_add_only_3stack(
			(boss.phase_frame - 16), COL_GATHER_1, COL_GATHER_2
		);
		if(boss.phase_frame == 16) {
			snd_se_play(8);
			boss.sprite = PAT_SARA_SPIN;
			state->phase_3.angle_clockwise = (0x40 - 0x08);
			state->phase_3.angle_counterclockwise = (0x40 + 0x08);
			state->phase_3.ring_speed.set(1.5f);
		}
		return;
	}

	if(boss.phase_frame < 64) {
		boss.sprite++;
	} else if(boss.phase_frame < 96) {
		if((boss.phase_frame % 2) == 0) {
			boss.sprite++;
		}
	} else if(boss.phase_frame < 128) {
		if((boss.phase_frame % 4) == 0) {
			boss.sprite++;
		}
	} else if((boss.phase_frame < 160)) {
		if((boss.phase_frame % 8) == 0) {
			boss.sprite++;
		}
	}

	if(boss.sprite >= (PAT_SARA_SPIN_last + 1)) {
		boss.sprite = PAT_SARA_SPIN;
	}
	phase_2_3_pattern();
	if(boss.phase_frame >= state->phase_3.pattern_duration) {
		boss.phase_frame = 0;
		boss.mode = 0;
		boss.sprite = PAT_SARA_STAY;
	}
}

void near pattern_pellet_arcs_at_expanding_random_angles(void)
{
	if((boss.phase_frame % 8) == 0) {
		bullet_template.spawn_type = BST_NO_SLOWDOWN;
		bullet_template.patnum = 0;
		bullet_template.group = BG_SPREAD;
		bullet_template.angle = (
			randring2_next16_mod(boss.phase_frame * 2) - boss.phase_frame + 0x40
		);
		bullet_template.set_spread(3, 0x3);
		bullet_template.special_motion = BSM_EXACT_LINEAR;
		bullet_template.speed.v = randring2_next8_and_ge_lt_sp(1.0f, 3.0f);
		bullet_template_tune();
		bullets_add_special();

		bullet_template.spawn_type = BST_CLOUD_BACKWARDS;
		bullet_template.patnum = PAT_BULLET16_N_BALL_BLUE;
		bullet_template.group = BG_SINGLE;
		bullet_template.angle = (
			randring2_next16_mod(boss.phase_frame * 2) - boss.phase_frame + 0x40
		);
		bullet_template.speed.v = randring2_next8_and_ge_lt_sp(1.5f, 3.5f);
		bullet_template_tune();
		bullets_add_regular();

		snd_se_play(3);
	}
}

void near pattern_random_red_rings(void)
{
	if((boss.phase_frame % 16) == 0) {
		bullet_template.spawn_type = BST_CLOUD_FORWARDS;
		bullet_template.patnum = PAT_BULLET16_N_BALL_RED;
		bullet_template.group = BG_RING;
		bullet_template.angle = randring2_next16();
		bullet_template.speed.set(2.0f);
		bullet_template.spread = 12;
		bullet_template_tune();
		bullets_add_regular();
		snd_se_play(3);
	}
}
