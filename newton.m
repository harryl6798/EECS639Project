function [Xout, Yout] = newton(Xin,Yin, num)
% Creates the Newton Matrix and evaluates the data.

%   Inputs : Xin - The inputs for the X points
%            Yin - The Inputs for the Y points
%            num - The amount of points for the output
%   Output : Xout - The x-values of the computed data
%            Yout - The y-values of the computed data
%

%Calculates the size of the input
n = length(Xin);

%Creates a matrix with just ones
A = ones(n);

% So we don't have to take the transpose every single time
Xin = Xin';

% Multiplies the last column by (t - tk)
for k = 2:n
    A(k:n,k) = A(k:n,(k-1)) .* (Xin(k:n) - Xin(k-1));
end
% A has ones in the top right corner, but if we tell our linsolve
%   that the matrix is Lower-Triangular, it will ignore those 1s
%   and solve solely using forward-sub
opts.LT = true;

% Calculate the coeffecients by using forward-sub
coef = linsolve(A, Yin', opts);

% Use Horner's Nested Theorem to calculate data points
Xout = linspace(Xin(1), Xin(n), num);
Yout = ones(1, num) * coef(n);

% Yout = coef1 + x1(coef2 + x2(...coef(n-1) + x(n-1)(coefn))...))
%   where xi = (xi - Xini)
for i=(n-1):-1:1
    Yout = coef(i) + ((Xout - Xin(i)) .* Yout);
end


end

