# DSP 1D Project
Project files for 1D Project for 30.115 Digital Signal Processing.

## Description
In this project for 30.115 Digital Signal Processing (SUTD), students are tasked to perform JPEG image compression using their own MATLAB code, with a function that allows the user to manually set the percentage of image compression.

The disccosxform function in the disccosxform.m file returns the discrete cosine transform of the square-matrix input.

The invdisccosxform function in the invdisccosxform.m file returns the inverse discrete cosine transform of the square-matrix input. 

The imgoutput function returns the compressed image (scaled by 255) from two arguments, the first argument being the filename of the image in the directory and the second argument being the percentage (0-100) of the quality of the image.

### Discrete cosine transform and its inverse transform
From https://www.youtube.com/watch?v=ECZoImq5zCg,

![discrete_cosine_transform](https://user-images.githubusercontent.com/48854965/117533180-038cd200-b01e-11eb-89a8-5a7607ce75f0.jpg)

### JPEG image compression
1. The image is divided into groups of 8 x 8 pixels.
2. The discrete cosine transform is applied to each group of the 8 x 8 pixels.
3. Each group of 8 x 8 pixels is being divided, bit-wise with a vector Q (quantization matrix), which is given by

![image](https://user-images.githubusercontent.com/48854965/117533533-ec4ee400-b01f-11eb-8831-11509633bea7.png)
where Q50 is the quantization matrix when the quality is 50, given by

![image](https://user-images.githubusercontent.com/48854965/117533602-4bacf400-b020-11eb-9e11-606677d536f7.png)

Source: https://web.stanford.edu/class/ee398a/handouts/lectures/08-JPEG.pdf

The quantization matrix is designed s.t. all coefficients of the quantization matrix is infinity when the quality of the compressed image is 0 and all the coefficients of the quantization matrix is one when the quality of the compressed image is 100.

4. All the coefficients of the matrix is rounded, this is where information is lost due to compression.
5. The coefficients of the matrix is then multiplied by the quantization matrix computed earlier, and the inverse discrete cosine transform is applied.

## Usage
![image](https://user-images.githubusercontent.com/48854965/117533871-924f1e00-b021-11eb-9ec9-b6bd570e572c.png)
