#include "util.h"

int main( int argc, char* argv[] )
{

	volatile long *base = (long *)0x48000000UL;
  int a;
  for(a = 0; a < 2048; a = a + 1 ){
    base[a] = a+1;
    long val = base[a];
    if (val != a+1){
      printf("failed on val: %ld\n", val);
      return a+1;
    }
    else {
      printf("passes %ld\n",val);
    }

   }
printf("reached end");   
   return 0;

}
