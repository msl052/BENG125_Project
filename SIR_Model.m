% The SIR model differential equations
function dPop = deriv(t, y, N, beta, gamma)
    S = y(1)
    I = y(2)
    R = y(3)
    dPop(1) = -beta * S * I / N
    dPop(2) = beta * S * I / N - gamma * I
    dPop(3) = gamma * I
end


