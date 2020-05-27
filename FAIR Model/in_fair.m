%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initial variables for FAIR Model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Implements the basic FAIR model, and plots simulation results
%-------------------------------------------------------------------------
% User Section 1: Definition of initial conditions
%-------------------------------------------------------------------------
%
% Initial conditions are the values of all variables at time zero.
%
% NOTE: Do not change the name 'initial'! Define the initial values
%       in the same order as the derivatives
%
initial.S = 499;                    % set the initial value of 'S'
initial.F = 300;                    % set the initial value of 'F'
initial.A = initial.S - initial.F;  % set the initial value of 'A'
initial.I = 1;                      % set the initial value of 'I'
initial.C = 1;                      % set the initial value of 'C'
initial.R = 0;                      % set the initial value of 'R'
%-------------------------------------------------------------------------
% User Section 2: Definition of model parameters
%-------------------------------------------------------------------------
%
% These parameters are passed to the function that calculates the
% derivatives.
%  
% NOTE: Do not change the name 'param'!
%
param.beta = 1/2; %1e-3;  % how often a susceptible-infected results in a new infection
param.r = 1/14; %1e-1;     % rate an infected removed/recovered
param.g = 1/3; %3e-4;     % rate an Social Distancing person gets infected
param.p = 1/7; % rate an Non-SD person gets infected
param.w = 0.1; %1e-3;     % rate an SD person becomes Non-SD
%-------------------------------------------------------------------------
% User Section 3: Definition of the simulation time
%-------------------------------------------------------------------------
end_time = 200;