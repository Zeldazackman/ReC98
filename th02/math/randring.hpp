#define RANDRING_SIZE 256

extern uint8_t randring[RANDRING_SIZE];

void near randring_fill(void);

#if GAME == 2
	extern uint8_t randring_p;

	uint8_t near randring1_next8(void);
	uint8_t pascal near randring1_next8_and(uint8_t mask);
	uint16_t near randring1_next16(void);
	uint8_t near randring2_next8(void);
	uint8_t pascal near randring2_next8_and(uint8_t mask);
#endif

uint16_t near randring2_next16(void);

/// Constrained random numbers
/// --------------------------
/// These limit the next random number between [min] inclusive and [max]
/// exclusive, via either AND or MOD.

template <class T> inline bool is_range_a_power_of_two(T min, T max) {
	return (((max - min) & ((max - min) - 1)) == 0);
}
/// --------------------------
