
# Makefile for World project

binary: main.o libworld.so
	gcc -o binary main.o -L. -lworld -Wl,-rpath,.

main.o: main.c
	gcc -c main.c

libworld.so: Hello.o Gbye.o
	gcc -shared -o libworld.so Hello.o Gbye.o

Hello.o: Hello.c
	gcc -c -fPIC Hello.c

Gbye.o: Gbye.c
	gcc -c -fPIC Gbye.c

clean:
	rm -f *.o *.so binary

libs: libworld.so
	