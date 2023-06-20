#include <stdio.h>
#include <string.h>

extern "C" char* removerng(char *s, char low, char high);

int main(void)
{
  char text[] = "Remove small LETTERS.";
  char expected[] = "R  LETTERS.";
  printf("Input string   > %s\n", text);
  char* result = removerng(text, 'a', 'z');
  printf("Removal result > %s\n", result);
  if (strcmp(result, expected) != 0)
	  printf("Error in testcase #1.\n");
  return 0;
}
