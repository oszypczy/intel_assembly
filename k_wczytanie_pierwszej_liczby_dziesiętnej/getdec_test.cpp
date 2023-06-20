#include <stdio.h>
#include <string.h>

extern "C" unsigned int getdec(char *s);

int main(void)
{
  char text1[] = "abc123";
  unsigned int expected1 = 123;
  printf("Input string > %s\n", text1);
  unsigned int result1 = getdec(text1);
  printf("Removal result > %d\n", result1);
  if (result1!= expected1)
	  printf("Error in testcase #1.\n");

  char text2[] = "abc";
  unsigned int expected2 = 0;
  printf("Input string > %s\n", text2);
  unsigned int result2 = getdec(text2);
  printf("Removal result > %d\n", result2);
  if (result2!= expected2)
	  printf("Error in testcase #2.\n");

  char text3[] = "abc999xyz123";
  unsigned int expected3 = 999;
  printf("Input string > %s\n", text3);
  unsigned int result3 = getdec(text3);
  printf("Removal result > %d\n", result3);
  if (result3!= expected3)
	  printf("Error in testcase #3.\n");
  return 0;
}
