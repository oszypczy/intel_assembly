#include <stdio.h>
#include <string.h>

extern "C" char* leaverng(char *s, char low, char high);

int main(void)
{
  char text1[] = "Remove all characters except <a-z>.";
  char expected1[] = "emoveallcharactersexceptaz";
  printf("Input string   > %s\n", text1);
  char* result1 = leaverng(text1, 'a', 'z');
  printf("Removal result > %s\n", result1);
  if (strcmp(result1, expected1) != 0)
	  printf("Error in testcase #1.\n");

  char text2[] = "Leave only digits between 1 and 2.";
  char expected2[] = "12";
  printf("Input string   > %s\n", text2);
  char* result2 = leaverng(text2, '1', '2');
  printf("Removal result > %s\n", result2);
  if (strcmp(result2, expected2) != 0)
	  printf("Error in testcase #2.\n");

  char text3[] = "";
  char expected3[] = "";
  printf("Input string   > %s\n", text3);
  char* result3 = leaverng(text3, '1', '2');
  printf("Removal result > %s\n", result3);
  if (strcmp(result3, expected3) != 0)
	  printf("Error in testcase #3.\n");
  return 0;
}
