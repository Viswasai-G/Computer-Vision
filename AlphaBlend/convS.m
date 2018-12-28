function [output] = convS(I,H)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
%similair to convolve.m. But makes sure that the output image is the same
%size of input image.

%converts given image to double
I = im2double(I);
%flips the kernel if it is a matrix.
[m,n] = size(H);
if(ismatrix(H))
    H = flip(flip(H,1),2);
end
%Applies convolution on 3 channels if the given image is an rgb image. On
%all 3 channels.
if(size(I,3)==3)
[x,y,z] = size(I);
padrow = (m-1)/2;
padcol = (n-1)/2;
red = I(:,:,1);
green = I(:,:,2);
blue = I(:,:,3);
targetr= padarray(red,[padrow,padcol], 0);
targetg= padarray(green,[padrow,padcol], 0);
targetb= padarray(blue,[padrow,padcol], 0);
out = zeros(x,y,3);

for a=1:x
    for b= 1:y
        
      submat = targetr(a:a+m-1,b:b+n-1);
      c = submat.* H;
      val = sum(c(:));
      out(a,b,1) = val;
    end
end
for a=1:x
    for b= 1:y
      submat = targetg(a:a+m-1,b:b+n-1);
      c = submat.* H;
      val = sum(c(:));
      out(a,b,2) = val;
    end
end
for a=1:x
    for b= 1:y
      submat = targetb(a:a+m-1,b:b+n-1);
      c = submat.* H;
      val = sum(c(:));
      out(a,b,3) = val;
    end
end
red = out(:, :, 1);
green = out(:, :, 2);
blue = out(:, :, 3);
% Recombine separate color channels into an RGB image.
output = cat(3, red, green, blue);

%Apply convolution on 1 filter if the given image is not a rgb image,i.e.,
%given is a grayscale image.
else
  [x,y] = size(I);
padrow = (m-1)/2;
padcol = (n-1)/2;

target= padarray(I,[padrow,padcol], 0);
out = zeros(x,y);

for a=1:x
    for b= 1:y
        
      submat = target(a:a+m-1,b:b+n-1);
      c = submat.* H;
      val = sum(c(:));
      out(a,b) = val;
    end
end  
output = out;
end
end

