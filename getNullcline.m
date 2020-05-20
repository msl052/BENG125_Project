function [X,Y] = getNullcline(d,x,y)
%[X,Y] = getNullcline(d,x,y)
%
% getNullcline takes a matrix, the x and y scales, and returns the x and y
% values of the null-cline.
%
% Simplification of getContours to do only the nullcline
%
%Parameters:
%   d   :   A matrix approximating a two-dimensional function.
%   x   :   The x-values for the columns of f.
%   y   :   The y-values for the rows of f.
% [X,Y] :   The x and y values of the null-cline.

cn    = contourc(x, y, d, [0 0]);
len   = cn(2, 1);
X     = cn(1, 2:1+len);
Y     = cn(2, 2:1+len);
