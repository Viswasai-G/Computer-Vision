function [out] = Expand(I)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
% Scale factor to increase the size of given image. Since we are doubling the size, it is 2,2.
scale = [2 2];              
% Get the size of your image.
oldSize = size(I);      
% Compute the new image size.
newSize = max(floor(scale.*oldSize(1:2)),1);  

%Compute an upsampled set of indices using interpolation.

rowIndex = min(round(((1:newSize(1))-0.5)./scale(1)+0.5),oldSize(1));
colIndex = min(round(((1:newSize(2))-0.5)./scale(2)+0.5),oldSize(2));

%Index old image to get new image.

out = I(rowIndex,colIndex,:);
end

