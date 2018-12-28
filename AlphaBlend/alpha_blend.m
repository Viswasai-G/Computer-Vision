function [output] = alpha_blend(imag1,imag2,mask)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
%This is similair to image blend
%ONLY USE IF OVERLAP OF 2 IMAGES IS KNOWN
%Cannot use this for images involving affine transformation. Use
%image_blend.m instead.

%convert the given input images to double 
imag1= im2double(imag1);
imag2= im2double(imag2);
mask= im2double(mask);

%Change value of overlap depending on the number of pixels overlaping on
%horizontal scale.
overlap = 29;

%Resize input images and mask to same size.
S=max(size(imag1),size(imag2));
x = S(1,1);
y = S(1,2);
z = S(1,3);
image2 = imresize(imag2, [x y]); 
image1 = imresize(imag1, [x y]);
mask = imresize(mask, [x y]);
%Take overlapping parts of image 1 and 2 and convolve them with mask
blend1 = image1(:,end-overlap:end,:);
blend2 = image2(:,1:overlap,:);
%Output the overlap region only. 
blended = image_blend(blend1,blend2,mask);
output=blended;
%imshow(imag2(:,overlap:end,:));%imag2(:,overlap:end,:)
%imshow(imag1(:,1:end-overlap,:));
%imshow(blended);


%Combine the resultant overlap region with input images. Done separately in
%command window. 

%output = [imag1(:,1:end-overlap,:) blended(:,:,:) imag2(:,overlap:end,:)];
end

