# Intel Assembly mini programmes

Welcome to my respiratory where I coded some mini assembly programmes that hopefully will allow you to understand how assembler actually works.
Folders with prefix "k_" are simple string manipulation programmes that take some input and edit it. I will provide you with readme to one of those. 
They are really similar to each other so that one should be enough for you to understand the rest of them.

## RemRep programme

RemRep is a program that removes repeated characters from a given string. This program is implemented in assembly language, specifically targeting the x86 and x64 Intel architectures. The program provides a function called `remrep` that takes a null-terminated string as input and modifies the string by removing any repeated characters.

## Usage

To use the RemRep program, follow these steps:

### Prerequisites

Make sure you have the following software installed on your system:

- NASM (Netwide Assembler): The assembler used to assemble the assembly code.
- GCC (GNU Compiler Collection): The compiler used to compile the C program.

### Step 1: Download the Source Code

Clone or download the source code from the GitHub repository where the RemRep program is hosted.

### Step 2: Build the Program

Open a terminal or command prompt and navigate to the directory containing the source code files (`remrep.asm` and `remrep_test.c`).

Run the following command to build the program:

```bash
make
```

This command will assemble the assembly code and compile the C code, generating an executable named `rmrp`.

### Step 3: Run the Program

After successfully building the program, you can run it by executing the following command:

```bash
./rmrp
```

The program will execute several test cases and display the input string, the removal result, and any errors encountered during the test cases.

## Understanding the Code

The RemRep program consists of three main components: the C program (`remrep_test.c`), the assembly code (`remrep.asm`), and the Makefile.

### The C Program

The C program (`remrep_test.c`) serves as the driver program for testing the `remrep` function. It includes necessary header files, defines the test cases, and calls the `remrep` function for each test case. The expected results are compared with the actual results, and any errors are reported.

### The Assembly Code

The assembly code (`remrep.asm`) contains the implementation of the `remrep` function. It follows the x86 and x64 Intel assembly language syntax.

The `remrep` function takes a pointer to a null-terminated string as its input parameter. It uses registers (`eax`, `ebx`, `ecx`, `edx`) to manipulate the string and remove repeated characters.

The function works as follows:
1. The function sets up the stack frame and saves the necessary registers (`ebp`, `ebx`).
2. It initializes pointers to the input string, output string, and a buffer for checking repetitions.
3. The function iterates over the characters in the input string:
    - It checks if the current character is already present in the buffer.
    - If not, it saves the character in the buffer, adds it to the output string, and increments the output string pointer.
    - If the character is already in the buffer, it skips the character and continues to the next one.
4. Once all characters have been processed, the function sets the last character of the output string to null, restores the original registers, and returns the modified string.

### The Makefile

The Makefile provides a convenient way to build the RemRep program. It specifies the necessary compilation and assembly commands for the C and assembly code files.

- `asm`: Assembles the assembly code (`remrep.asm`) using NASM, producing an object file (`remrep.o`).
- `cc`: Compiles the C code (`remrep_test.c`) using GCC, producing an object file (`remrep_test.o`).
- `link`: Links the object files (`remrep.o` and `remrep_test.o`) using GCC, producing the executable (`rm

rp`).
- `clean`: Removes the generated object files and the executable.

# Mandelbrot sets

I want you to focus on last 2 programmes that generate mandelbrot sets using C/Assembly hybrid programming. They are a bit different from previos ones so I think
they deserve special README section. They both do the same thing however one works with x86 assembly and the other with x64. I will include instruction for the first one
byt the second is basically the same.

# Mandelbrot Set Generator

The Mandelbrot Set Generator is a program implemented in C and x86 assembly language that generates a bitmap image of the Mandelbrot set. The program takes the desired width of the image as a command-line argument and generates a corresponding bitmap file named "mandelbrot.bmp". The C program serves as the main driver, while the assembly code contains the implementation of the `mandel` function, which calculates the number of iterations for each pixel in the Mandelbrot set.

## Usage

To use the Mandelbrot Set Generator, follow these steps:

### Step 1: Download the Source Code

Clone or download the source code from the GitHub repository where the Mandelbrot Set Generator program is hosted.

### Step 2: Build the Program

Open a terminal or command prompt and navigate to the directory containing the source code files (`main.c`, `mandel.asm`, `Makefile`).

Run the following command to build the program:

```bash
make
```

This command will compile the C and assembly code files and generate an executable named `mandelbrot`.

### Step 3: Run the Program

After successfully building the program, you can run it by executing the following command:

```bash
./mandelbrot <width>
```

Replace `<width>` with the desired width of the output image in pixels. The height of the image will be the same as the width. The program will generate a bitmap file named "mandelbrot.bmp" in the current directory.

## Understanding the Code

The Mandelbrot Set Generator program consists of three main components: the C main program (`main.c`), the assembly code (`mandel.asm`), and the Makefile.

### The C Main Program

The C main program (`main.c`) serves as the driver program for the Mandelbrot Set Generator. It includes necessary header files, defines helper functions, and implements the main logic of generating the Mandelbrot set image.

The main program performs the following steps:
1. Reads the desired width of the output image from the command-line arguments.
2. Validates the width value.
3. Calculates the height of the image as the same value as the width.
4. Opens a file named "mandelbrot.bmp" for writing in binary mode.
5. Allocates memory for storing the pixel data of the image.
6. Writes the BMP file header to the output file.
7. Calls the `generateMandelbrotPixels` function, passing the pixel data, width, height, and padding as arguments.
8. Writes the pixel data to the output file.
9. Closes the output file and frees the allocated memory.
10. Displays a success message.

### The Assembly Code

The assembly code (`mandel.asm`) contains the implementation of the `mandel` function, which calculates the number of iterations for each pixel in the Mandelbrot set. The function follows the x86 assembly language syntax.

The `mandel` function takes two arguments: the real and imaginary parts of the complex number. It uses registers (`eax`, `ebx`, `ecx`, `edx`, `edi`, `esi`) to perform the necessary calculations.

The function works as follows:
1. It sets up the stack frame and saves the necessary registers (`ebp`, `ebx`, `esi`, `edi`).
2. It initializes the variables for the loop, including the iteration count (`ecx`), the x-coordinate (`edi`), and the y-coordinate (`[ebp-4]`).
3. It enters a loop that performs the Mandelbrot set calculation for each pixel:
    - It calculates the square of the x-coordinate and stores it in `ebx
    - It calculates the square of the y-coordinate and stores it in `esi`.
    - It checks if the sum of the squares of the x and y coordinates is greater than 4. If so, it exits the loop.
    - It performs additional calculations to update the x and y coordinates.
    - It increments the iteration count (`ecx`).
    - It checks if the iteration count has reached the maximum value (255). If not, it continues to the next iteration of the loop.
4. It finishes the function by returning the iteration count (`ecx`).
5. It restores the saved registers and the stack frame.

### The Makefile

The Makefile contains the compilation instructions for building the Mandelbrot Set Generator program. It specifies the compilation flags (`CCFMT`, `NASMFMT`, `CCOPT`, `NASMOPT`) and the dependencies between the source files and the target executable.

The Makefile defines the following rules:
- `.c.o`: This rule compiles a C source file into an object file.
- `.s.o`: This rule assembles an assembly source file into an object file.
- `$(EXEFILE)`: This rule specifies the dependencies and the command for linking the object files into the final executable.
- `clean`: This rule removes the generated object files and the executable.

## Contributing

If you would like to contribute to the Mandelbrot Set Generator program, please follow the guidelines for contributing in the GitHub repository. You can submit bug reports, feature requests, or pull requests to improve the program.
