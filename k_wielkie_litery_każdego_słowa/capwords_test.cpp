#include <stdio.h>
#include <string.h>

extern "C" char* capwords(char *s);

int main(void)
{
  char text1[] = "abc";
  char expected1[] = "Abc";
  printf("Input string   > %s\n", text1);
  char* result1 = capwords(text1);
  printf("Removal result > %s\n", result1);
  if (strcmp(result1, expected1) != 0)
	  printf("Error in testcase #1.\n");

  char text2[] = "abc def g";
  char expected2[] = "Abc Def G";
  printf("Input string   > %s\n", text2);
  char* result2 = capwords(text2);
  printf("Removal result > %s\n", result2);
  if (strcmp(result2, expected2) != 0)
	  printf("Error in testcase #2.\n");

  char text3[] = "";
  char expected3[] = "";
  printf("Input string   > %s\n", text3);
  char* result3 = capwords(text3);
  printf("Removal result > %s\n", result3);
  if (strcmp(result3, expected3) != 0)
	  printf("Error in testcase #3.\n");

  char text4[] = "12 BB CC";
  char expected4[] = "12 BB CC";
  printf("Input string   > %s\n", text4);
  char* result4 = capwords(text4);
  printf("Removal result > %s\n", result4);
  if (strcmp(result4, expected4) != 0)
	  printf("Error in testcase #4.\n");
  return 0;
}
