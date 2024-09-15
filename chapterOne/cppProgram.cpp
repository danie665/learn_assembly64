/*
 * cppProgram.cpp: 	Example program to illustrate asm/cpp hybrid
 * Compile:		gpp -o myProgram cppProgram.cpp asmProgram.o
*/

# include <stdio.h>

extern "C"
{
  void asmFunc(void);
}

int main(void)
{
  printf("Calling asmMain:\n");
  asmFunc();
  printf("Returned from asmMain\n");
}
