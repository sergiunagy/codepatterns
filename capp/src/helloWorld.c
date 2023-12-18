// #include <stdio.h>

volatile unsigned int global_int1 = 0x5A5Au;
volatile unsigned int global_sink_int1 = 0xFFFFu;
volatile unsigned char global_byte1 = 0xFAu;


int main(void) {
	int i;
	global_sink_int1 = global_int1++;
	// printf("Hello world!\n %d \n", global_sink_int1);
	return 0;
}

/* 
Build: 
: exe only
- gcc helloWorld.c -o ../out/hello

: expanded
- gcc -E helloWorld.c -o ../out/hello.i

: asm generated
- gcc -S helloWorld.c -o ../out/hello.i

:clang ast in json format:
-  clang -cc1 -ast-dump=json  helloWorld.c -o ../out/clcapp > clast.ast
Run: 
- ../out/hello
 */