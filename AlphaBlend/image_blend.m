function [output] = image_blend(image1,image2,mask)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
%Take the input images and mask and convert all three to the size of the
%maximum image. This is to make sure that matrix multiplications can stay
%consistent at all levels of the pyramids as well.
S=max(size(image1),size(image2));
x = S(1,1);
y = S(1,2);
z = S(1,3);
image2 = imresize(image2, [x y]);
image1 = imresize(image1, [x y]);
mask = imresize(mask, [x y]);
%Create gaussian pyramid for mask
gausspyr_mask = Gpyr(mask,4);
%Create laplacian pyramind for image 1
laplpyr_im1 = Lpyr(image1,4);
%Create laplacian pyramid for image2
laplpyr_im2 = Lpyr(image2,4);
%Blend the 3 pyramids at each correspoinding level to get the output image.
out = blend(laplpyr_im1, laplpyr_im2, gausspyr_mask);
%Reconstruct the output laplacian pyramid to get resultant.
out = reconstruct(out, 4);
output = out;
end

