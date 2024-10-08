#pragma option -zCSHARED

#include "th02/formats/pi.h"

int DEFCONV pi_load(int slot, const char *fn)
{
	#if (GAME >= 3)
		pi_free(slot);
	#endif

	int ret = graph_pi_load_pack(fn, &pi_headers[slot], &pi_buffers[slot]);
	return ret;
}
