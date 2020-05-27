function deriv = ode_system (t, x, param)
    % Function to calculate derivatives of the FAIR model
    %
    % Input:
    %       t:     Time (not used in this example because there is no explicit
    %              time dependence).
    %       x:     Vector of the current values of all variables in the same
    %              order as you defined the inital values: F, A, I, R
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
   
   
    dS = -param.beta * S * I;
    dF = -param.g * F/param.N * I;
    dA = -param.p * A/param.N * I;
    %dI = +param.beta * S * I - param.r * I;
    dI = param.g*F/param.N*I + param.p*A/param.N*I - param.r * I;
    % Note: because S+I+R=constant, this equation could actually be omitted,
    % and R at any time point could simply be calculated as N-S-I.
    dC = param.beta * S * I - param.r * I;
    dR = param.r * I;
    deriv = [dS;dF;dA;dI;dC;dR];
end
