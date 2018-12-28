function M= affine_least_square(x0,y0, x1,y1, x2,y2, xp0,yp0, xp1,yp1, xp2,yp2)

%Create the matrix A with 3 points clicked.
A=[x0 y0 1  0  0  0 ; 0  0  0  x0 y0 1 ; x1 y1 1  0  0  0 ; 0  0  0  x1 y1 1 ; x2 y2 1  0  0  0;0  0  0  x2 y2 1];
%Corresponding points on image 2
B=[xp0; yp0; xp1;  yp1; xp2 ; yp2 ];
 
 
 %X=A\B; 
 
X=pinv(A)*B;
%Store resultant affine parameters into matrix M
M11 =X(1,1);
M12 =X(2,1);  
M13 =X(3,1);
M21 =X(4,1);
M22 =X(5,1);
M23 =X(6,1);
M=[ M11 M12 M13; M21 M22 M23; 0 0 1];
%Display affine parameters and inverse affine parameters.
imshow(M)
imshow(inv(M))

end

