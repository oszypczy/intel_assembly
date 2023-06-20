#include <stdio.h>
#include <string.h>

extern "C" char* reversedig(char *s);

int main(void)
{
  char text1[] = "1234";
  char expected1[] = "4321";
  printf("Input string   > %s\n", text1);
  char* result1 = reversedig(text1);
  printf("Removal result > %s\n", result1);
  if (strcmp(result1, expected1) != 0)
	  printf("Error in testcase #1.\n");

  char text2[] = "a12b";
  char expected2[] = "a21b";
  printf("Input string   > %s\n", text2);
  char* result2 = reversedig(text2);
  printf("Removal result > %s\n", result2);
  if (strcmp(result2, expected2) != 0)
	  printf("Error in testcase #2.\n");

  char text3[] = "123xyz9999";
  char expected3[] = "999xyz9321";
  printf("Input string   > %s\n", text3);
  char* result3 = reversedig(text3);
  printf("Removal result > %s\n", result3);
  if (strcmp(result3, expected3) != 0)
	  printf("Error in testcase #3.\n");

  char text4[] = "abcd";
  char expected4[] = "abcd";
  printf("Input string   > %s\n", text4);
  char* result4 = reversedig(text4);
  printf("Removal result > %s\n", result4);
  if (strcmp(result4, expected4) != 0)
	  printf("Error in testcase #4.\n");

  char text5[] = "";
  char expected5[] = "";
  printf("Input string   > %s\n", text5);
  char* result5 = reversedig(text5);
  printf("Removal result > %s\n", result5);
  if (strcmp(result5, expected5) != 0)
	  printf("Error in testcase #5.\n");
  return 0;
}
