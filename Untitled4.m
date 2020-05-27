
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Starting script to the module 'SIR models of epidemics'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;
% Implements the basic SIR model, and plots simulation results


%-------------------------------------------------------------------------
% User Section 1: Definition of initial conditions
%-------------------------------------------------------------------------
%
% Initial conditions are the values of all variables at time zero.
%
% NOTE: Do not change the name 'initial'! Define the initial values
%       in the same order as the derivatives
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
                %: STOCHASTIC: Consider param.beta as probability of
                %infection
param.r = 1e-1;    % set the parameter 'r' of the model
param.g = 3e-4;
param.p =(param.beta*initial.S-param.g*initial.F)/initial.A;
% This is the title string for the plot window.
model_title = 'SIR Epidemics';

%-------------------------------------------------------------------------
% User Section 3: Definition of the simulation time
%-------------------------------------------------------------------------
end_time = 100;

%-------------------------------------------------------------------------
% Now we solve the ODE system and plot the results
%-------------------------------------------------------------------------

% Calculate and print R_0 on the screen
N = initial.F + initial.A + initial.I + initial.R;
R_0 = param.beta * N / param.r

% Extract initial values from the 'initial' structure and collect them
% in a column vector for use in 'ode45'.
initial_values = [];
variable_names = fieldnames(initial);
for i=1:length(variable_names) 
    initial_values = [initial_values; initial.(variable_names{i})];
end

% integrate the ODE system
[t, y] = ode45(@(t, x) ode_system(t, x, param), ...
               [0 end_time], ...
               initial_values, ...
               []);

% Plot FAIR model
figure;
hold on;
plot(t,y(:,2)) % F
plot(t,y(:,3)) % A
plot(t,y(:,4)) % I
plot(t,y(:,6)) % R
legend('F(t)','A(t)','I(t)','R(t)')
title(['FAIR Model F(0)/A(0)=',num2str(initial.F/initial.A),' N=',num2str(N)]);
xlabel('time');
ylabel('number of individuals');

  
figure;     
% prepare legend texts
legend_texts = cell(length(variable_names), 1);
for i=1:length(variable_names) 
    text = [variable_names{i} '(t)'];
    legend_texts{i} = text;
end

% plot the results
plot(t, y);
xlabel('time');
ylabel('number of individuals');
title(model_title);
legend(legend_texts);
hold on;
plot(t, y(:,2)+y(:,3));

%-------------------------------------------------------------------------
% User Section 4: Definition of the ODE system
%-------------------------------------------------------------------------
function deriv = ode_system (t, x, param)
% Function to calculate derivatives of the SIR model
%
% Input:
%       t:     Time (not used in this example because there is no explicit
%              time dependence).
%       x:     Vector of the current values of all variables in the same
%              order as you defined the inital values: S, I, R
%       param: Used to pass parameter values.
% Output:
%       deriv: Column vector of derivatives, must be the same order as the
%              input vector x.

S = x(1);
F = x(2);
A = x(3);
I = x(4);
C = x(5);
R = x(6);
dS = -param.beta * S * I
dF = -param.g * F * I
dA = -param.p * A * I
%dI = +param.beta * S * I - param.r * I;
dI = +param.g*F*I+param.p*A*I - param.r * I
% Note: because S+I+R=constant, this equation could actually be omitted,
% and R at any time point could simply be calculated as N-S-I.

% in a given day, a random amount of people are infected...
dC = +param.beta * S * I - param.r * I
dR = param.r * I
deriv = [dS;dF;dA;dI;dC;dR];
end

