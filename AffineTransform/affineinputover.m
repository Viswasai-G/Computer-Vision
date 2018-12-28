function [M] = affineinputover(fixedPoints,movingPoints)
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
%Change the given points into x,y form.
x0 = fixedPoints(1,1);
x1 = fixedPoints(2,1);
x2 = fixedPoints(3,1);
x3 = fixedPoints(4,1);
y0 = fixedPoints(1,2);
y1 = fixedPoints(2,2);
y2 = fixedPoints(3,2);
y3 = fixedPoints(4,2);
xp0 = movingPoints(1,1);
xp1 = movingPoints(2,1);
xp2 = movingPoints(3,1);
xp3 = movingPoints(4,1);
yp0 = movingPoints(1,2);
yp1 = movingPoints(2,2);
yp2 = movingPoints(3,2);
yp3 = movingPoints(4,2);

%Determine affine parameters for given points.
M = affine_least_square_over(x0,y0, x1,y1, x2,y2,x3,y3, xp0,yp0, xp1,yp1, xp2,yp2,xp3,yp3);

end
