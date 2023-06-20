#include <stdio.h>
#include <string.h>

extern "C" char* remlastnum(char *s);

int main(void)
{
  char text1[] = "abc123";
  char expected1[] = "abc";
  printf("Input string > %s\n", text1);
  char* result1 = remlastnum(text1);
  printf("Removal result > %s\n", result1);
  if (strcmp(result1, expected1) != 0)
	  printf("Error in testcase #1.\n");

  char text2[] = "abc";
  char expected2[] = "abc";
  printf("Input string > %s\n", text2);
  char* result2 = remlastnum(text2);
  printf("Removal result > %s\n", result2);
  if (strcmp(result2, expected2) != 0)
	  printf("Error in testcase #2.\n");

  char text3[] = "123";
  char expected3[] = "";
  printf("Input string > %s\n", text3);
  char* result3 = remlastnum(text3);
  printf("Removal result > %s\n", result3);
  if (strcmp(result3, expected3) != 0)
	  printf("Error in testcase #2.\n");
  return 0;
}
