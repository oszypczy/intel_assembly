#include <stdio.h>
#include <string.h>

extern "C" char* replnum(char *s, char a);

int main(void)
{
  char text1[] = "12a";
  char expected1[] = "#a";
  printf("Input string   > %s\n", text1);
  char* result1 = replnum(text1, '#');
  printf("Removal result > %s\n", result1);
  if (strcmp(result1, expected1) != 0)
	  printf("Error in testcase #1.\n");

  char text2[] = "x123x xx00";
  char expected2[] = "x#x xx#";
  printf("Input string   > %s\n", text2);
  char* result2 = replnum(text2, '#');
  printf("Removal result > %s\n", result2);
  if (strcmp(result2, expected2) != 0)
	  printf("Error in testcase #2.\n");

  char text3[] = "9090";
  char expected3[] = "@";
  printf("Input string   > %s\n", text3);
  char* result3 = replnum(text3, '@');
  printf("Removal result > %s\n", result3);
  if (strcmp(result3, expected3) != 0)
	  printf("Error in testcase #3.\n");

  char text4[] = "abc";
  char expected4[] = "abc";
  printf("Input string   > %s\n", text4);
  char* result4 = replnum(text4, '@');
  printf("Removal result > %s\n", result4);
  if (strcmp(result4, expected4) != 0)
	  printf("Error in testcase #4.\n");
  return 0;
}
