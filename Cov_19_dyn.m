clear all
close all
clc

syms S I t % create symoblic variables

syms delta r a

%delta= 7  % fill in whatever step for social distancing strength
%r=exp(-delta*t) % social distancing eq, should demonstrate curve flattening (I think time is another dimension that we haven't explored in the class notes
%a=  0.0476 % inverse of infection period in days

% SIR equations
s_dot=-r*S*I        % Susceptible
i_dot=r*S*I-a*I     % Infected
r_dot=a*I           % Removed

% solving fixed points
      % with the time dimension from social distancing, may need to further consider what dimensions FP lie on. 
s_dot==0 % set eqn equal to zero
i_dot==0 % set eqn equal to zero

sol_s_S=solve(s_dot,S) 
sol_s_I=solve(s_dot,I) 
sol_i_S=solve(i_dot,S) 
sol_i_I=solve(i_dot,I) 


