function [outputArg1] = Newton(X,y)
% Creates the Newton Matrix and evaluates the data.

%   Inputs : X - The inputs for the X points
%            Y - The Inputs for the Y points
%   Output : outputArg1 - Outputs the finalized matrix for viewing
%   purposes. 

%Calculates the size of the input
r= size(X);

%Creates a matrix with just ones
a = ones(r(2));
%Sets the values to the top right to a different value
final = tril(a);


%Loops through the matrix twice.
for col = 2:r(2)
    %Creates a new array every instance for the size
    newSize = r(2) - col +1;
    newArray = zeros(newSize,1);
    %Takes the last array instance and subtracts it
    for t = 1: newSize
        newArray(t) = (X(col+t-1) - X(col-1)) * final(col+t-1,col-1);
    end
    final(col:r(2),col) = newArray;  
end
%Reverses the array
g = y';

c = linsolve(final,g);

outputArg1 = c;
end

