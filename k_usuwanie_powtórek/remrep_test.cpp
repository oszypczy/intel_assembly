#include <stdio.h>
#include <string.h>

extern "C" char* remrep(char *s);

int main(void)
{
  char text1[] = "abbccc";
  char expected1[] = "abc";
  printf("Input string   > %s\n", text1);
  char* result1 = remrep(text1);
  printf("Removal result > %s\n", result1);
  if (strcmp(result1, expected1) != 0)
	  printf("Error in testcase #1.\n");

  char text2[] = "1234 5678 1234 5678";
  char expected2[] = "1234 5678";
  printf("Input string   > %s\n", text2);
  char* result2 = remrep(text2);
  printf("Removal result > %s\n", result2);
  if (strcmp(result2, expected2) != 0)
	  printf("Error in testcase #2.\n");

  char text3[] = "Hello world! Hello world!";
  char expected3[] = "Helo wrd!";
  printf("Input string   > %s\n", text3);
  char* result3 = remrep(text3);
  printf("Removal result > %s\n", result3);
  if (strcmp(result3, expected3) != 0)
	  printf("Error in testcase #3.\n");

  char text4[] = "abc123xyz";
  char expected4[] = "abc123xyz";
  printf("Input string   > %s\n", text4);
  char* result4 = remrep(text4);
  printf("Removal result > %s\n", result4);
  if (strcmp(result4, expected4) != 0)
	  printf("Error in testcase #4.\n");

  char text5[] = "";
  char expected5[] = "";
  printf("Input string   > %s\n", text5);
  char* result5 = remrep(text5);
  printf("Removal result > %s\n", result5);
  if (strcmp(result5, expected5) != 0)
	  printf("Error in testcase #5.\n");
  return 0;
}
