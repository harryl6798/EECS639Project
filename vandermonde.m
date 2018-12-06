function [outputArg1] = vandermonde(X,y)
% Creates the Vandermonde Matrix and evaluates the data.

%   Inputs : X - The inputs for the X points
%            Y - The Inputs for the Y points
%   Output : outputArg1 - Outputs the finalized matrix for viewing
%   purposes. 
%
%   Function will output the resulting matrix after solving for vandermonde

r = size(X);
% Creates the initial Vandermonde matrix
van = zeros(r(2),r(2));

%Sets the first column 
van(:,1) = 1;

%For loop to fill the vandermonde
for col = 2:r(2)
    van(:,col) = X(:).^(col-1);  
end

%Reverse the matrix
g = y';

%Solve for c
c = linsolve(van,g);


%Output
outputArg1 = c;




end

