%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Starting script to the module 'FAIR models of epidemics'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;
clc;

in_fair

%-------------------------------------------------------------------------
% Now we solve the ODE system and plot the results
%-------------------------------------------------------------------------
% Calculate and print R_0 on the screen
param.N = initial.F + initial.A + initial.I + initial.R;
R_0 = param.beta * param.N / param.r

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
%-------------------------------------------------------------------------
% Plot FAIR model
%-------------------------------------------------------------------------
figure;
hold on;
plot(t,y(:,2)) % F
plot(t,y(:,3)) % A
plot(t,y(:,4)) % I
plot(t,y(:,6)) % R
plot(t,y(:,2)+y(:,3)); % S
legend('F(t)','A(t)','I(t)','R(t)','S(t)');
title(['FAIR Model F(0)/A(0)=',num2str(initial.F/initial.A),' N=',num2str(param.N)]);
xlabel('time');
ylabel('number of individuals');

% figure;     
% % prepare legend texts
% legend_texts = cell(length(variable_names), 1);
% for i=1:length(variable_names) 
%     text = [variable_names{i} '(t)'];
%     legend_texts{i} = text;
% end
% 
% % plot the results
% plot(t, y);
% xlabel('time');
% ylabel('number of individuals');
% title(model_title);
% legend(legend_texts);
% hold on;
% plot(t, y(:,2)+y(:,3));

