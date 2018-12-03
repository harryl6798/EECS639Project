function [outputArg1] = vandermonde(X,y)
% Creates the Vandermonde Matrix and evaluates the data.

%   Inputs : X - The inputs for the X points
%            Y - The Inputs for the Y points
%   Output : outputArg1 - Outputs the finalized matrix for viewing
%   purposes. 
%
%   Function will output the resulting matrix after solving for vandermonde

r = size(X);

van = zeros(r(2),r(2));

van(:,1) = 1;

for col = 2:r(2)
    van(:,col) = X(:).^(col-1);
    
end

g = y';

c= van\g;

hold on
plot(X,y,'r.')
r = size(c);
Y=0;
% Plot calculated spline
    x = linspace(X(1),X(r(1)),50);
    for i=1:(r(1))
   % x = linspace(X(i),X(i+1),50);
    Y = Y + c(i)*x.^(i-1) ;
    end
    plot(x,Y,'b');


hold off

outputArg1 = c;




end

