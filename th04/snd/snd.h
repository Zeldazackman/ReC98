#include "th03/snd/snd.h"

typedef enum {
	SND_BGM_OFF = 0,
	SND_BGM_FM26 = 1,
	SND_BGM_FM86 = 2,
	SND_BGM_MODE_COUNT = 3,
	SND_BGM_MIDI = 3, // unsupported

	_snd_bgm_mode_t_FORCE_UINT8 = 0xFF
} snd_bgm_mode_t;

typedef enum {
	SND_SE_OFF = 0,
	SND_SE_FM = 1,
	SND_SE_BEEP = 2,
	SND_SE_MODE_COUNT = 3,

	_snd_se_mode_t_FORCE_INT16 = 0x7FFF
} snd_se_mode_t;

extern unsigned char snd_se_mode;
extern snd_bgm_mode_t snd_bgm_mode;

#ifdef __cplusplus
static inline bool snd_bgm_active() {
	return snd_bgm_mode;
}

static inline bool16 snd_se_active() {
	return (snd_se_mode != SND_SE_OFF);
}
#endif

#define snd_bgm_is_fm() \
	(snd_bgm_mode != SND_BGM_MIDI)

// Checks the requested BGM and SE modes against the available hardware and
// sets [snd_se_mode] and [snd_bgm_mode] accordingly. Returns [snd_bgm_mode].
int pascal snd_determine_modes(int req_bgm_mode, int req_se_mode);

// Loads a song ([func] = SND_LOAD_SONG) or a sound effect bank ([func] =
// SND_LOAD_SE) into the respective work buffer of the sound driver. [fn] must
// not have any extension. Depending on [snd_bgm_mode], [snd_se_mode], and
// game, the following file is loaded:
//
// |                | TH04       | TH05      |
// |----------------+------------+-----------|
// | [snd_bgm_mode] | [func] = SND_LOAD_SONG |
// |----------------+------------+-----------|
// | SND_BGM_FM26   | [fn].m26   | [fn].m    |
// | SND_BGM_FM86   | [fn].m86   | [fn].m2   |
// | SND_BGM_MIDI   | [fn].mmd   | [fn].md   | (yes, see TH05's load[data].asm)
// |----------------+------------+-----------|
// | [snd_se_mode]  | [func] = SND_LOAD_SE   |
// |----------------+------------+-----------|
// | SND_SE_FM      | [fn].efc   | [fn].efc  |
// | SND_SE_BEEP    | [fn].efs   | [fn].efs  | (using master.lib's BGM driver)
//
// Note that the TH05 version will infinitely loop if neither the file for the
// current [snd_bgm_mode] nor "[fn].m" exist.
void pascal snd_load(const char fn[SND_FN_LEN], int16_t func);
