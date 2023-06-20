#include <stdio.h>
#include <string.h>

extern "C" unsigned int gethex(char *s);

int main(void)
{
  char text1[] = "abc";
  unsigned int expected1 = 0;
  printf("Input string > %s\n", text1);
  unsigned int result1 = gethex(text1);
  printf("Removal result > %d\n", result1);
  if (result1!= expected1)
	  printf("Error in testcase #1.\n");

  char text2[] = "ppp0xF";
  unsigned int expected2 = 15;
  printf("Input string > %s\n", text2);
  unsigned int result2 = gethex(text2);
  printf("Removal result > %d\n", result2);
  if (result2!= expected2)
	  printf("Error in testcase #2.\n");

  char text3[] = "abc0xJD0x123";
  unsigned int expected3 = 291;
  printf("Input string > %s\n", text3);
  unsigned int result3 = gethex(text3);
  printf("Removal result > %d\n", result3);
  if (result3!= expected3)
	  printf("Error in testcase #3.\n");
  return 0;
}
