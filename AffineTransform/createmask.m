function [mask] = createmask(I)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

%Create a mask on image I using mouse click from user.
imshow(I, []);
freehand_handle = drawfreehand();

mask = freehand_handle.createMask();
end

