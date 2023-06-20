#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>

int mandel(int re, int im);

// Function to write the BMP file header
void writeBMPHeader(FILE* file, int width, int height, int padding) {
    uint16_t bfType = 0x4D42;
    uint32_t bfSize = 54 + (3 * width + padding) * height;
    uint32_t bfReserved = 0;
    uint32_t bfOffBits = 54;

    fwrite(&bfType, sizeof(bfType), 1, file);
    fwrite(&bfSize, sizeof(bfSize), 1, file);
    fwrite(&bfReserved, sizeof(bfReserved), 1, file);
    fwrite(&bfOffBits, sizeof(bfOffBits), 1, file);

    uint32_t biSize = 40;
    uint32_t biWidth = width;
    uint32_t biHeight = height;
    uint16_t biPlanes = 1;
    uint16_t biBitCount = 24;
    uint32_t biCompression = 0;
    uint32_t biSizeImage = (3 * width + padding) * height;
    uint32_t biXPelsPerMeter = 0;
    uint32_t biYPelsPerMeter = 0;
    uint32_t biClrUsed = 0;
    uint32_t biClrImportant = 0;

    fwrite(&biSize, sizeof(biSize), 1, file);
    fwrite(&biWidth, sizeof(biWidth), 1, file);
    fwrite(&biHeight, sizeof(biHeight), 1, file);
    fwrite(&biPlanes, sizeof(biPlanes), 1, file);
    fwrite(&biBitCount, sizeof(biBitCount), 1, file);
    fwrite(&biCompression, sizeof(biCompression), 1, file);
    fwrite(&biSizeImage, sizeof(biSizeImage), 1, file);
    fwrite(&biXPelsPerMeter, sizeof(biXPelsPerMeter), 1, file);
    fwrite(&biYPelsPerMeter, sizeof(biYPelsPerMeter), 1, file);
    fwrite(&biClrUsed, sizeof(biClrUsed), 1, file);
    fwrite(&biClrImportant, sizeof(biClrImportant), 1, file);
}

int convert_to_16_16_int(float f) {
    f = f * 65536;
    int result = (int)f;
    return result;
}

// Function to generate the pixel data for the Mandelbrot set
void generateMandelbrotPixels(uint8_t* pixelData, int width, int height, int padding) {
    int i, j;
    for (i = 0; i < height; i++) {
        for (j = 0; j < width; j++) {
            float re = (j / (float)width) * (0.47 - (-2.00)) + (-2.00);
            float im = (i / (float)height) * (1.12 - (-1.12)) + (-1.12);
            int re_int = convert_to_16_16_int(re);
            int im_int = convert_to_16_16_int(im);
            int iteration = mandel(re_int, im_int);
            // Assign color based on iteration count
            float t = (float)iteration / (float)255;
            float hue = 360.0 * t;
            float saturation = 1.0;
            float value = t < 1.0 ? 1.0 : 0.0;
            float c = value * saturation;
            float x = c * (1 - fabs(fmod(hue / 60.0, 2.0) - 1.0));
            float m = value - c;
            float red, green, blue;
            if (hue >= 0 && hue < 60) {
                red = c;
                green = x;
                blue = 0;
            } else if (hue >= 60 && hue < 120) {
                red = x;
                green = c;
                blue = 0;
            } else if (hue >= 120 && hue < 180) {
                red = 0;
                green = c;
                blue = x;
            } else if (hue >= 180 && hue < 240) {
                red = 0;
                green = x;
                blue = c;
            } else if (hue >= 240 && hue < 300) {
                red = x;
                green = 0;
                blue = c;
            } else {
                red = c;
                green = 0;
                blue = x;
            }
            // Scale color values to the range 0-255
            pixelData[3 * (i * width + j) + (padding * i)] = (uint8_t)(255 * (red + m));
            pixelData[3 * (i * width + j) + (padding * i) + 1] = (uint8_t)(255 * (green + m));
            pixelData[3 * (i * width + j) + (padding * i) + 2] = (uint8_t)(255 * (blue + m));
        }
        // Add padding
        for (int k = 0; k < padding; k++) {
            pixelData[3 * (i * width + j) + (padding * i) + k] = 0;
        }
    }
}

int main(int argc, char* argv[]) {
    if (argc < 2 || argc > 2) {
        printf("Usage: %s <width>\n", argv[0]);
        return 1;
    }

    int width = atoi(argv[1]);
    if (width < 100 || width > 3840) {
        printf("Width must be between 100 and 3840 pixels\n");
        return 1;
    }
    int height = width;
    int padding = (4 - (width * 3) % 4) % 4;

    FILE* file = fopen("mandelbrot.bmp", "wb");
    if (!file) {
        printf("Failed to open mandelbrot.bmp\n");
        return 1;
    }

    uint8_t* pixelData = (uint8_t*)calloc((3 * width + padding) * height, sizeof(uint8_t));

    writeBMPHeader(file, width, height, padding);
    generateMandelbrotPixels(pixelData, width, height, padding);

    fwrite(pixelData, sizeof(uint8_t), (3 * width + padding) * height, file);

    fclose(file);
    free(pixelData);

    printf("BMP file generated successfully: mandelbrot.bmp\n");

    return 0;
}
