void pascal near score_load(void)
{
	int byte;
	file_ropen(SCORE_FN);
	file_seek(rank * sizeof(hi), 0);
	file_read(&hi, sizeof(hi));
	for(byte = 0; byte < sizeof(hi.score); byte++) {
		*((unsigned char*)(&hi.score) + byte) -= 0x12;
	}
	file_close();
}
