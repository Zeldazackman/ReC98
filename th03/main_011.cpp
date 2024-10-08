/* ReC98
 * -----
 * 2nd part of code segment #1 of TH03's MAIN.EXE
 */

#include "th03/main/player/shot.hpp"

void near shots_update(void)
{
	shotpair_t near *shotpair = shotpairs;
	for(int i = 0; i < SHOTPAIR_COUNT; i++, shotpair++) {
		if(shotpair->alive) {
			shotpair->topleft.y.v += shotpair->velocity_y.v;
			if(shotpair->topleft.y.v <= to_sp(-1.0f)) {
				shotpair->alive = false;
			}
		}
	}
}

void near shots_render(void)
{
	shotpair_t near *shotpair = shotpairs;

	sprite16_put_size.set(SHOT_W, SHOT_H);
	sprite16_clip.reset();

	for(int i = 0; i < SHOTPAIR_COUNT; i++, shotpair++) {
		if(shotpair->alive) {
			sprite16_offset_t so = (shotpair->so_anim + shotpair->so_pid);
			screen_x_t left = playfield_fg_x_to_screen(
				shotpair->topleft.x, shotpair->pid
			);
			screen_y_t top = shotpair->topleft.y.to_pixel() + PLAYFIELD_TOP;

			sprite16_put(left + 0,                 top, so);
			sprite16_put(left + SHOTPAIR_DISTANCE, top, so);

			shotpair->so_anim += SHOT_VRAM_W;
			if(shotpair->so_anim >= (SHOT_VRAM_W * SHOT_SPRITE_COUNT)) {
				shotpair->so_anim = 0;
			}
		}
	}
}
