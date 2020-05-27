% z: I
% x: F
% y: A
%
initial.S = 499;	% set the initial value of 'S'
initial.F = 100;    % set the initial value of 'F'
initial.A = initial.S - initial.F; % set the initial value of 'A'
initial.I = 1;	% set the initial value of 'I'
initial.C = 1;
initial.R = 0;	% set the initial value of 'R'

%-------------------------------------------------------------------------
% User Section 2: Definition of model parameters
%-------------------------------------------------------------------------
%
% These parameters are passed to the function that calculates the
% derivatives.
%  
% NOTE: Do not change the name 'param'!
%
param.beta = 1e-3; % set the parameter 'beta' of the model
param.r = 1e-1;    % set the parameter 'r' of the model
param.g = 3e-4;
param.p =(param.beta*initial.S-param.g*initial.F)/initial.A;
% This is the title string for the plot window.
model_title = 'SIR Epidemics';

%-------------------------------------------------------------------------
% User Section 2: Plotting Nullclines
%-------------------------------------------------------------------------
%
% F = r/p
[y,z] = meshgrid(0:100:1000);
x = repmat(param.r/param.g,size(z));
surf(x,y,z);
hold on;
[x,z] = meshgrid(0:10:1000);
y = repmat(param.r/param.p,size(z));
surf(x,y,z);
xlabel('x:F');ylabel('y:A');zlabel('z:I')
set(gca,'XLim',[0 1000]);
set(gca,'YLim',[0 1000]);
set(gca,'ZLim',[0 1000]);

