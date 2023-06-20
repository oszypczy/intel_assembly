#include <stdio.h>
#include <string.h>

extern "C" char* removenchar(char *s, int n);

int main(void)
{
  char text1[] = "AbAbAb";
  char expected1[] = "AAA";
  printf("Remove every 2 chars:\n");
  printf("Input string   > %s\n", text1);
  char* result1 = removenchar(text1, 2);
  printf("Removal result > %s\n", result1);
  if (strcmp(result1, expected1) != 0)
	  printf("Error in testcase #1.\n");

  char text2[] = "123123";
  char expected2[] = "1212";
  printf("Remove every 3 chars:\n");
  printf("Input string   > %s\n", text2);
  char* result2 = removenchar(text2, 3);
  printf("Removal result > %s\n", result2);
  if (strcmp(result2, expected2) != 0)
	  printf("Error in testcase #2.\n");

  char text3[] = "P";
  char expected3[] = "P";
  printf("Remove every 2 chars:\n");
  printf("Input string   > %s\n", text3);
  char* result3 = removenchar(text3, 2);
  printf("Removal result > %s\n", result3);
  if (strcmp(result3, expected3) != 0)
	  printf("Error in testcase #3.\n");

  char text4[] = "JOPU";
  char expected4[] = "";
  printf("Remove every char:\n");
  printf("Input string   > %s\n", text4);
  char* result4 = removenchar(text4, 1);
  printf("Removal result > %s\n", result4);
  if (strcmp(result4, expected4) != 0)
	  printf("Error in testcase #4.\n");

  char text5[] = "JD";
  char expected5[] = "JD";
  printf("Save every char:\n");
  printf("Input string   > %s\n", text5);
  char* result5 = removenchar(text5, 0);
  printf("Removal result > %s\n", result5);
  if (strcmp(result5, expected5) != 0)
	  printf("Error in testcase #5.\n");

  char text6[] = "KD";
  char expected6[] = "KD";
  printf("Save every char:\n");
  printf("Input string   > %s\n", text6);
  char* result6 = removenchar(text6, -10);
  printf("Removal result > %s\n", result6);
  if (strcmp(result6, expected6) != 0)
	  printf("Error in testcase #6.\n");
  return 0;
}
