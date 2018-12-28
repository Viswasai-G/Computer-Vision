function [out] = Reduce(I)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
% This is to reduce the given image to half its width and height. 
%Using 2 separable 1D gaussian kernels. 
%Therefore, we initialize 2 separate 1D gaussian kernels
H = [1/9,1/9,1/9];
J = [1/9;1/9;1/9];
%Convolve the given image with the kernels.
W = convS(I,J);
W = convS(W,H);
[Rows, Col, Chan] = size(W);
%Checking if rows and coloumns are even or odd. Add padding if it is odd.
if(mod(Rows,2)==1)
    Rows=Rows+1;
end
if(mod(Col,2)==1)
    Col=Col+1;
end
%Creating a blank canvas to copy the image into.
result = zeros(Rows/2, Col/2, Chan);
newRow = 1; newColumn = 1;
%Copy every alternate row and coloumn of the given image into reduced
%resultant image.
for row = 1:2:Rows
    for column = 1:2:Col
        result(newRow, newColumn,:)= W(row, column,:);
        newColumn = newColumn+1;
    end
    newRow = newRow+1;
    newColumn = 1;
end
out = result;
end

