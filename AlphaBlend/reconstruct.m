function [out] = reconstruct(LI,n)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
lpyr_copy = LI(:,:,:);
first = lpyr_copy{end};
first = Expand(first);
b = numel(lpyr_copy)-1;
for a=1:n
    [c,d,p] = size(lpyr_copy{b});
    first = first(1:c,1:d,1:p);
    out = first + lpyr_copy{b};
    first = Expand(lpyr_copy{b});
    b= b-1;
end
end

