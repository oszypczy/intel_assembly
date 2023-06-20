#include <stdio.h>
#include <string.h>

extern "C" char* reversepairs(char *s);

int main(void)
{
  char text1[] = "abcd";
  char expected1[] = "badc";
  printf("Input string   > %s\n", text1);
  char* result1 = reversepairs(text1);
  printf("Removal result > %s\n", result1);
  if (strcmp(result1, expected1) != 0)
	  printf("Error in testcase #1.\n");

  char text2[] = "xyz";
  char expected2[] = "yxz";
  printf("Input string   > %s\n", text2);
  char* result2 = reversepairs(text2);
  printf("Removal result > %s\n", result2);
  if (strcmp(result2, expected2) != 0)
	  printf("Error in testcase #2.\n");

  char text3[] = "";
  char expected3[] = "";
  printf("Input string   > %s\n", text3);
  char* result3 = reversepairs(text3);
  printf("Removal result > %s\n", result3);
  if (strcmp(result3, expected3) != 0)
	  printf("Error in testcase #3.\n");
  return 0;
}
