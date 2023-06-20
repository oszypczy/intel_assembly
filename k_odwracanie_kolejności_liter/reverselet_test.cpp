#include <stdio.h>
#include <string.h>

extern "C" char* reverselet(char *s);

int main(void)
{
  char text1[] = "1234";
  char expected1[] = "1234";
  printf("Input string   > %s\n", text1);
  char* result1 = reverselet(text1);
  printf("Removal result > %s\n", result1);
  if (strcmp(result1, expected1) != 0)
	  printf("Error in testcase #1.\n");

  char text2[] = "a12b";
  char expected2[] = "b12a";
  printf("Input string   > %s\n", text2);
  char* result2 = reverselet(text2);
  printf("Removal result > %s\n", result2);
  if (strcmp(result2, expected2) != 0)
	  printf("Error in testcase #2.\n");

  char text3[] = "123xd80utb0";
  char expected3[] = "123bt80udx0";
  printf("Input string   > %s\n", text3);
  char* result3 = reverselet(text3);
  printf("Removal result > %s\n", result3);
  if (strcmp(result3, expected3) != 0)
	  printf("Error in testcase #3.\n");

  char text4[] = "abc123ABC456";
  char expected4[] = "CBA123cba456";
  printf("Input string   > %s\n", text4);
  char* result4 = reverselet(text4);
  printf("Removal result > %s\n", result4);
  if (strcmp(result4, expected4) != 0)
	  printf("Error in testcase #4.\n");

  char text5[] = "a";
  char expected5[] = "a";
  printf("Input string   > %s\n", text5);
  char* result5 = reverselet(text5);
  printf("Removal result > %s\n", result5);
  if (strcmp(result5, expected5) != 0)
	  printf("Error in testcase #5.\n");

  char text6[] = "";
  char expected6[] = "";
  printf("Input string   > %s\n", text6);
  char* result6 = reverselet(text6);
  printf("Removal result > %s\n", result6);
  if (strcmp(result6, expected6) != 0)
	  printf("Error in testcase #6.\n");
  return 0;
}
