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
a = ones(n);
%Sets the values to the top right to a different value
final = tril(a);


%Loops through the matrix twice.
for col = 2:n
    %Creates a new array every instance for the size
    newSize = n - col +1;
    newArray = zeros(newSize,1);
    %Takes the last array instance and subtracts it
    for t = 1: newSize
        newArray(t) = (Xin(col+t-1) - Xin(col-1)) * final(col+t-1,col-1);
    end
    final(col:n,col) = newArray;  
end

% Calculate the coeffecients by using forward-sub
opts.LT = true;
coef = linsolve(final, Yin', opts);


% Use Horner's Nested Theorem to calculate data points
Xout = linspace(Xin(1), Xin(n), num);
Yout = ones(1, num) * coef(n);

% Yout = coef1 + x1(coef2 + x2(...coef(n-1) + x(n-1)(coefn))...))
%   where xi = (xi - Xini)
for i=(n-1):-1:1
    Yout = coef(i) + ((Xout - Xin(i)) .* Yout);
end


end

