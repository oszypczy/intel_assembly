#include <stdio.h>
#include <string.h>

extern "C" char* removebutnchar(char *s, int n);

int main(void)
{
  char text1[] = "AAABBB";
  char expected1[] = "BBB";
  printf("Remove every char but for 3 last:\n");
  printf("Input string   > %s\n", text1);
  char* result1 = removebutnchar(text1, 3);
  printf("Removal result > %s\n", result1);
  if (strcmp(result1, expected1) != 0)
	  printf("Error in testcase #1.\n");

  char text2[] = "AAABBB";
  char expected2[] = "AAABBB";
  printf("Saves whole string:\n");
  printf("Input string   > %s\n", text2);
  char* result2 = removebutnchar(text2, 6);
  printf("Removal result > %s\n", result2);
  if (strcmp(result2, expected2) != 0)
	  printf("Error in testcase #2.\n");

  char text3[] = "AAABBB";
  char expected3[] = "AAABBB";
  printf("Saves whole string:\n");
  printf("Input string   > %s\n", text3);
  char* result3 = removebutnchar(text3, 10);
  printf("Removal result > %s\n", result3);
  if (strcmp(result3, expected3) != 0)
	  printf("Error in testcase #3.\n");

  char text4[] = "AAABBB";
  char expected4[] = "";
  printf("Removes whole string:\n");
  printf("Input string   > %s\n", text4);
  char* result4 = removebutnchar(text4, 0);
  printf("Removal result > %s\n", result4);
  if (strcmp(result4, expected4) != 0)
	  printf("Error in testcase #4.\n");

  char text5[] = "AAABBB";
  char expected5[] = "";
  printf("Removes whole string:\n");
  printf("Input string   > %s\n", text5);
  char* result5 = removebutnchar(text5, -3);
  printf("Removal result > %s\n", result5);
  if (strcmp(result5, expected5) != 0)
	  printf("Error in testcase #5.\n");
  return 0;
}
