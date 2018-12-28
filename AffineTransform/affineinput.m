function [M] = affineinput(fixedPoints,movingPoints)
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
%Change the given points into x,y form.
x0 = fixedPoints(1,1);
x1 = fixedPoints(2,1);
x2 = fixedPoints(3,1);
y0 = fixedPoints(1,2);
y1 = fixedPoints(2,2);
y2 = fixedPoints(3,2);
xp0 = movingPoints(1,1);
xp1 = movingPoints(2,1);
xp2 = movingPoints(3,1);
yp0 = movingPoints(1,2);
yp1 = movingPoints(2,2);
yp2 = movingPoints(3,2);

%Determine affine parameters for given points.
M = affine_least_square(x0,y0, x1,y1, x2,y2, xp0,yp0, xp1,yp1, xp2,yp2);

end

