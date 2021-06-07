# Detecting-Electronic-Card-Issues-MATLAB
Compares 2 images finds the difference between them by using matrix operations. MATLAB Project

Things to do first:

1)You need 2 images adn add them into A,A2 variables (A2 is the clean image of A,A is the image that is going to being analyzed)

2)Set up the Dtt variable.For do that ,you need to test it by running program its the maximum pixel difference between A and A2.

3)If your image to bright or too dark you need to set C variable to higher(bright image) or lower (dark image)

4)If you want brightness analysis you need to set the lazres1 variable



Images (need 2 of them)(the first image is the raw one(for the comparison) the other ones for the process)

![alt text](https://github.com/emintatli/image-compare-matrix/blob/main/img/1.png?raw=true)

Both images were processed for converting them into 2d marix

![alt text](https://github.com/emintatli/image-compare-matrix/blob/main/img/2.png?raw=true)

Both images were set to the same position

![alt text](https://github.com/emintatli/image-compare-matrix/blob/main/img/4.png?raw=true)

Both images converted to a matrix then simply subtracted

![alt text](https://github.com/emintatli/image-compare-matrix/blob/main/img/5.png?raw=true)

Meaningless values removed

![alt text](https://github.com/emintatli/image-compare-matrix/blob/main/img/6.png?raw=true)

Done! We got the coordinates of difference too.

![alt text](https://github.com/emintatli/image-compare-matrix/blob/main/img/7.png?raw=true)

For the brightness analysis, we just convert the image to a matrix grayscale then get its mean (if the value near 1, that means the image is bright)

![alt text](https://github.com/emintatli/image-compare-matrix/blob/main/img/11.png?raw=true)![alt text](https://github.com/emintatli/image-compare-matrix/blob/main/img/12.png?raw=true)

![alt text](https://github.com/emintatli/image-compare-matrix/blob/main/img/22.png?raw=true)![alt text](https://github.com/emintatli/image-compare-matrix/blob/main/img/23.png?raw=true)


