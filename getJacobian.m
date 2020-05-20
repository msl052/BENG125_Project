function J = getJacobian(x,y,f,g,x0,y0)
% J = getJacobian(x,y,f,g,x0,y0)
%
% getJacobian takes a grid of derivative values and a point in phase space,
% and returns the Jacobian around that point.
%
%Parameters:
%   x   :   The x-values of f and g.
%   y   :   The y-values of f and g.
%   f   :   A matrix approximating the derivative wrt x.
%   g   :   A matrix approximating the derivative wrt y.
%   x0  :   The x-value for the point.
%   y0  :   The y-value for the point.
%
%Jacobian output:
%   J(1,1)  :   Derivative of f wrt x evaluated at x0, y0.
%   J(1,2)  :   Derivative of f wrt y evaluated at x0, y0.
%   J(2,1)  :   Derivative of g wrt x evaluated at x0, y0.
%   J(2,2)  :   Derivative of g wrt y evaluated at x0, y0.

dx = gradient(x);
[temp dy] = gradient(y);
[dfx dfy] = gradient(f);
[dgx dgy] = gradient(g);

x = flatten(x);
y = flatten(y);
dx0 = griddata(x,y,flatten(dx),x0,y0);
dy0 = griddata(x,y,flatten(dy),x0,y0);
dfdx0 = griddata(x,y,flatten(dfx),x0,y0);
dfdy0 = griddata(x,y,flatten(dfy),x0,y0);
dgdx0 = griddata(x,y,flatten(dgx),x0,y0);
dgdy0 = griddata(x,y,flatten(dgy),x0,y0);

% dx0
% dy0
% dfdx0
% dfdy0
% dgdx0
% dgdy0

J = [dfdx0/dx0 dfdy0/dy0; dgdx0/dx0 dgdy0/dy0];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function x = flatten(x)
%y = flatten(x)
%
%flatten compresses all data to one dimension
x = squeeze(x(1:numel(x)));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
