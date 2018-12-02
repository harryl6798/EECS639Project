function [] = cubicSpline(X,Y,splineType)
% Creates the cubic spline from the given data
%
% Input:
% X = x-values of the data
% Y = corresponding y-values of the data
% splineType = type of cubic spline to use
%              'natural' for natural cubic spline
%              'complete' for complete cubic spline
%              'not-a-knot' for not-a-knot cubic spline
%
% Output:
% Plots the computed cubic spline with the data passed in

%
% Calculate the coeffecients for the spline equations
%

n = length(X); % Length of the data
A = zeros((n-1)*4); % Holds the system of equations
b = zeros((n-1)*4,1); % Holds the y values

% Populate A with P1(t), P2(t), ..., Pn-1(t)
for i=1:(n-1)
    P = [1 X(i) X(i).^2 X(i).^3
         1 X(i+1) X(i+1).^2 X(i+1).^3]; % Pi(t)
    A(i*2-1:i*2,i*4-3:i*4) = P;
end

% Populate A with first & second derivative of P(t)
off1 = (n-1)*2; % Offset for P'(t)
off2 = off1 + (n-2); % Offset for P''(t)
for i=1:(n-2)
    P1 = [0 1 2*X(i+1) 3*X(i+1).^2]; % First derivative of Pi(t)
    P2 = [0 0 2 6*X(i+1)]; % Second derivative of Pi(t)
    A(i+off1,i*4-3:i*4) = P1;
    A(i+off1,(i+1)*4-3:(i+1)*4) = -P1;
    A(i+off2,i*4-3:i*4) = P2;
    A(i+off2,(i+1)*4-3:(i+1)*4) = -P2;
end

% Populate b with its y values
for i=1:(n-1)
    b(i*2-1) = Y(i);
    b(i*2) = Y(i+1);
end

% SPLINE CALCULATIONS:

if isequal(splineType, 'natural') % Natural Cubic Spline
    A((n-1)*4-1,3:4) = [2 6*X(1)];
    A((n-1)*4,(n-1)*4-1:(n-1)*4) = [2 6*X(n)];
    % Keep b values equal to 0
elseif isequal(splineType, 'complete') % Complete Cubic Spline
    A((n-1)*4-1,2:4) = [1 2*X(1) 3*X(1).^2];
    A((n-1)*4,(n-1)*4-2:(n-1)*4) = [1 2*X(1) 3*X(1).^2];
    b((n-1)*4-1:(n-1)*4) = [5 1]; % Arbitrary values
elseif isequal(splineType, 'not-a-knot') % Not-a-Knot Cubic Spline
    A((n-1)*4-1,4) = 1;
    A((n-1)*4,(n-1)*4) = -1;
else % Error
    error("splineType is not recognized!")
end

% Calculate coeffecients
coef = inv(A)*b;

%
% Plot the spline
%

% Plot given data
hold on
plot(X,Y,'r.')

% Plot calculated spline
for i=1:(n-1)
    x = linspace(X(i),X(i+1),50);
    y = coef(i*4-3) + coef(i*4-2)*x + coef(i*4-1)*(x.^2) + coef(i*4)*(x.^3);
    plot(x,y,'b');
end
hold off

end
