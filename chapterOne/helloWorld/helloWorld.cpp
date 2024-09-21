/*
 * helloWorld.cpp:	Hello world asm/cpp hybrid
 * Compile:		g++ -no-pie -o helloWorld helloWorld.cpp helloWorld.o
 */

# include <stdio.h>

extern "C"
{
  void asmFunc(void);
}

int main(void)
{
  printf("Calling asmFunc:\n");
  asmFunc();
  printf("Returned from asmFunc\n");
}
