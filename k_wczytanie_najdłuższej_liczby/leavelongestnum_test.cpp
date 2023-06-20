#include <stdio.h>
#include <string.h>

extern "C" unsigned int leavelongestnum(char *s);

int main(void)
{
  char text1[] = "abc";
  unsigned int expected1 = 0;
  printf("Input string > %s\n", text1);
  unsigned int result1 = leavelongestnum(text1);
  printf("Removal result > %d\n", result1);
  if (result1!= expected1)
	  printf("Error in testcase #1.\n");

  char text2[] = "abc123";
  unsigned int expected2 = 123;
  printf("Input string > %s\n", text2);
  unsigned int result2 = leavelongestnum(text2);
  printf("Removal result > %d\n", result2);
  if (result2!= expected2)
	  printf("Error in testcase #2.\n");

  char text3[] = "666xd1010";
  unsigned int expected3 = 1010;
  printf("Input string > %s\n", text3);
  unsigned int result3 = leavelongestnum(text3);
  printf("Removal result > %d\n", result3);
  if (result3!= expected3)
	  printf("Error in testcase #3.\n");

  char text4[] = "000000003";
  unsigned int expected4 = 3;
  printf("Input string > %s\n", text4);
  unsigned int result4 = leavelongestnum(text4);
  printf("Removal result > %d\n", result4);
  if (result4!= expected4)
	  printf("Error in testcase #4.\n");
  return 0;
}
