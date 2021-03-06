% Converted from https://scipython.com/book/chapter-8-scipy/additional-examples/the-sir-epidemic-model/

clear all;




% Total population, N
N = 1000;
% Initial number of infected, I0
I0 = 1;
% Initial number of recovered individuals, R0
R0 = 0;
% Initial number of susceptible to infection, S0
S0 = N-I0-R0;
% Contact rate, beta
beta = 0.2;
% Mean recovery rate, gamma (in 1/days)
gamma = 1./10;
% A grid of time points (in days)
t = linspace(0,160,160)

% Initial conditions vector
y0 = [S0; I0; R0];

ret = ode45(@(t,y) deriv(t,y, N, beta, gamma),[0 160], y0)