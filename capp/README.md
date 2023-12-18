# C code DemoApp

Application that will serve as input to the Analysis App

## Usage hints:

Check gcc configured search paths
gcc -v -E -xc -

Build with:
Build: 
: exe only
- gcc helloWorld.c -o ../out/hello

: expanded
- gcc -E helloWorld.c -o ../out/hello.i

: asm generated
- gcc -S helloWorld.c -o ../out/hello.i

:clang ast in json format:
-  clang -cc1 -ast-dump=json  helloWorld.c -o ../out/clcapp > clast.ast