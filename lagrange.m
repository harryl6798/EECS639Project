function [Xout, Yout] = lagrange(Xin,Yin, num)
% Creates the Lagrange Equation and evaluates the data.

%   Inputs : Xin - The inputs for the X points
%            Yin - The Inputs for the Y points
%            num - The amount of points for the output
%   Output : Xout - The x-values of the computed data
%            Yout - The y-values of the computed data
%

%Calculates the size of the input
n = length(Xin);

% Set up output X and Y
Xout = linspace(Xin(1), Xin(n), num);
Yout = zeros(n, 1);

% Create all of the equations
for j=1:n
    % Calculate the numerator
    %   (t - t1) * (t - t2) * ... * (t - tn)
    %           (Skipping tj)
    % And calculate the denominator
    %   (tj - t1) * (tj - t2) * ... * (tj - tn)
    %           (Skipping tj)
    numer = 1;
    denom = 1;
    for k=1:n
        if k ~= j % Skip tj
            numer = numer .* (Xout - Xin(k));
            denom = denom * (Xin(j) - Xin(k));
        end
    end
    
    % Calculate Y step by step
    %   y1 * l1(t) + y2 * l2(t) + ... + yn * ln(t)
    Yout = Yout + Yin(j) * (numer / denom);
end

end

