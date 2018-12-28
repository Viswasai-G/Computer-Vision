function [output] = convolve(I,H)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%check if the given image is a double or not and change it to double
t = isa(I,'double');
if(t==0)
    I = im2double(I);
end
%Check if the given color has 3 channels(r,g,b).
if(size(I,3)==3)
    %I = rgb2gray(I);

%Take the size of kernel 
[m,n] = size(H);
%Flip the kernel by 180 if it is a matrix rather than an array
if(ismatrix(H))
    H = flip(flip(H,1),2);
end
%Take size of input image to add necessary padding.
[x,y,z] = size(I);
%Add padding to the input image on all 3 channels.
padrow = (m-1);
padcol = (n-1);
red = I(:,:,1);
green = I(:,:,2);
blue = I(:,:,3);
targetr= padarray(red,[padrow,padcol], 0);
targetg= padarray(green,[padrow,padcol], 0);
targetb= padarray(blue,[padrow,padcol], 0);
%create a blank output canvas.
out = zeros(x+((m-1)),y+((n-1)),3);

%Multiply Kernel elements with image elements on red channel.
for a=1:x%+(m-1)
    for b= 1:y%+(n-1)
        
      submat = targetr(a:a+m-1,b:b+n-1);
      c = submat.* H;
      val = sum(c(:));
      out(a,b,1) = val;
    end
end
%Multiply Kernel elements with image elements on green channel.
for a=1:x+(m-1)
    for b= 1:y+(n-1)
      submat = targetg(a:a+m-1,b:b+n-1);
      c = submat.* H;
      val = sum(c(:));
      out(a,b,2) = val;
    end
end
%Multiply Kernel elements with image elements on blue channel.
for a=1:x+(m-1)
    for b= 1:y+(n-1)
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
imshow(output)
else


%Take the size of kernel 
[m,n] = size(H);
%Flip the kernel by 180 if it is a matrix rather than an array
if(ismatrix(H))
    H = flip(flip(H,1),2);
end
%Take size of input image to add necessary padding.
[x,y] = size(I);
%Add padding to the input image on all 3 channels.
padrow = (m-1);
padcol = (n-1);
target= padarray(I,[padrow,padcol], 0);

%create a blank output canvas.
out = zeros(x+((m-1)),y+((n-1)),1);

%Multiply Kernel elements with image elements on grayscale channel.
for a=1:x%+(m-1)
    for b= 1:y%+(n-1)
        
      submat = target(a:a+m-1,b:b+n-1);
      c = submat.* H;
      val = sum(c(:));
      out(a,b,1) = val;
    end
end
output = out;
end

