#include <stdio.h>
#include <string.h>

extern "C" char* reversenfrom(char *s, char c, unsigned int n);

int main(int argc, char *argv[]){
  if (argc == 1){
    char text1[] = "abc123xyz";
    char c1 = '1';
    unsigned int n1 = 3;
    char expected1[] = "abc321xyz";
    printf("Input string   > %s\n", text1);
    char* result1 = reversenfrom(text1, c1, n1);
    printf("Reverse result > %s\n", result1);
    if (strcmp(result1, expected1) != 0)
      printf("Error in testcase #1.\n");

    char text2[] = "aoo99iuu";
    char c2 = 'p';
    unsigned int n2 = 3;
    char expected2[] = "aoo99iuu";
    printf("Input string   > %s\n", text2);
    char* result2 = reversenfrom(text2, c2, n2);
    printf("Reverse result > %s\n", result2);
    if (strcmp(result2, expected2) != 0)
      printf("Error in testcase #2.\n");

    char text3[] = "abc123xyz";
    char c3 = 'x';
    unsigned int n3 = 6;
    char expected3[] = "abc123zyx";
    printf("Input string   > %s\n", text3);
    char* result3 = reversenfrom(text3, c3, n3);
    printf("Reverse result > %s\n", result3);
    if (strcmp(result3, expected3) != 0)
      printf("Error in testcase #3.\n");

    char text4[] = "abc123xyz";
    char c4 = '1';
    unsigned int n4 = 9;
    char expected4[] = "abczyx321";
    printf("Input string   > %s\n", text4);
    char* result4 = reversenfrom(text4, c4, n4);
    printf("Reverse result > %s\n", result4);
    if (strcmp(result4, expected4) != 0)
      printf("Error in testcase #3.\n");
    return 0;

  } else {
    printf("Input string   > %s\n", argv[1]);
    unsigned int n_arg;
    unsigned int n = sscanf(argv[3], "%u", &n_arg);
    char* result = reversenfrom(argv[1], argv[2][0], n_arg);
    printf("Reverse result > %s\n", result);
    return 0;
  }
}
