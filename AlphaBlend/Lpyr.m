function [out] = Lpyr(I,n)
%UNTITLED9 Summary of this function goes here
%Take in the image and the number of levels to create a laplacian pyramid
%Create a cell to store the values for n levels into that cell.
%Create a gaussian pyramid for the given image.
val = Gpyr(I,n);
out = cell(1,n+1);
%The final level values of the gaussian pyramid and laplacian pyramid are
%the same. 
out{n+1} = val{end};
temp = Expand(out{n+1});
b = numel(out)-1;
%Store the difference of current level and previous level into output cell.
for a=1:numel(out)-1
    [m,n,o] = size(val{b});
    temp = temp(1:m,1:n,1:o);

    out{b} = val{b} -temp;
    temp = Expand(val{b});
    b = b-1;
end
end
%To print the pyramid%%

%subplot(numel(out), 1, 1);
%for k=1:numel(out)
%    subplot(1,numel(out),k), imshow(out{k},[])
%    xlim([1 size(out{1},1)]);
%    ylim([1 size(out{1},2)]);
%end
