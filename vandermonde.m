function [Xout, Yout] = vandermonde(Xin, Yin, num)
% Creates the Vandermonde Matrix and evaluates the data.

%   Inputs : Xin - The inputs for the X points
%            Yin - The Inputs for the Y points
%            num - The amount of points for the output
%   Output : Xout - The x-values of the computed data
%            Yout - The y-values of the computed data
%

n = length(Xin);
% Creates the initial Vandermonde matrix
van = zeros(n);

%Sets the first column 
van(:,1) = 1;

%For loop to fill the vandermonde
for col = 2:n
    van(:,col) = Xin(:).^(col-1);  
end

%Reverse the matrix

%Solves for coeffecients by using GEPP with back-sub
coef = linsolve(van, Yin');


% Use Horner's Nested Theorem to calculate data points
Xout = linspace(Xin(1), Xin(n), num);
Yout = ones(1, num) * coef(n);

% Yout = coef1 + x1(coef2 + x2(...coef(n-1) + x(n-1)(coefn))...))
for i=(n-1):-1:1
    Yout = coef(i) + (Xout .* Yout);
end


end

