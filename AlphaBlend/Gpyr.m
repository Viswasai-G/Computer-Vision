function [out] = Gpyr(I,n)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

%Creates a gaussian pyramid of the given image to n levels
%Create an empty cell to store all levels.
out = cell(1,n+1);
%Convert given image to double.
out{1} = im2double(I);
A=I;
%For n levels, half the size of image and store the resultant. No need to
%convolve in this step since the reduce function does that.
for a=1:n
    A = Reduce(A);
    out{a+1} = A;
    
end
%To print the pyramid%%
%subplot(numel(out), 1, 1);
%for k=1:numel(out)
%   subplot(1,numel(out),k), imshow(out{k},[])
%   xlim([1 size(out{1},1)]);
%   ylim([1 size(out{1},2)]);
%end
end