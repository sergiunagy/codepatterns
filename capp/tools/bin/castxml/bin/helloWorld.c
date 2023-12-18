volatile unsigned int global_int1 = 0x5A5Au;
volatile unsigned int global_sink_int1 = 0xFFFFu;
volatile unsigned char global_byte1 = 0xFAu;


int main(void) {
	int i;
	global_sink_int1 = global_int1++;
	return 0;
}
