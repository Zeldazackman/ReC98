enum popup_id_t {
	POPUP_ID_HISCORE_ENTRY = 0,
	POPUP_ID_EXTEND = 1,
	POPUP_ID_BONUS = 2,
	POPUP_ID_FULL_POWERUP = 3,
	#if (GAME == 5)
		POPUP_ID_DREAMBONUS_MAX = 4,
	#endif

	_popup_id_t_FORCE_UINT8 = 0xFF
};

extern unsigned char bgm_title_id;	// only used in TH04
extern popup_id_t popup_id_new;
extern nearfunc_t_near overlay_text;
extern nearfunc_t_near popup;
extern unsigned long popup_bonus;

#define popup_show(popup_new) \
	/* Yup, the only known way of assigning a `near` function to a `near` */ \
	/* function pointer from a group outside the one where the `near` */ \
	/* function was declared in involves lying to the compiler about the */ \
	/* true distance of the function. That's also why we can't correctly */ \
	/* declare this function at global scope. */ \
	void pascal far popup_update_and_render(void); \
	\
	popup_id_new = popup_new; \
	popup = reinterpret_cast<nearfunc_t_near>(popup_update_and_render);

/// Stage and BGM titles
/// --------------------

void pascal near popup_titles_invalidate(void);
void pascal near popup_titles_update_and_render(void);
void pascal near popup_boss_bgm_update_and_render(void);
/// --------------------
