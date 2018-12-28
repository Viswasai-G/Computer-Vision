function [out_lapl] = blend(image1_pyr,image2_pyr, mask_pyr)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%Create a cell to store laplacian pyramid values of output
out_lapl = cell(1,length(image1_pyr));
%For all levels of gaussian pyramid and laplacian pyramid, combine to form
%resulting level of output image.
for i=1:length(image1_pyr)
    a1 = image1_pyr{i};
    a2 = image2_pyr{i};
    mask = mask_pyr{i};
    out_lapl{i}= mask.*a1 + (1-mask).*a2;
end
end

