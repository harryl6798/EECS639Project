%First Evaluation of all the functions e^x^2
figure
X1 =  linspace(.6,1,5);
Y1 = exp(X1.^2);

% vandermonde(1, Y1);
% Newton(X1, Y1);

subplot(3,2,4);
hold on
[Xout, Yout] = cubicSpline(X1, Y1, 'natural');
title("Natural Cubic Spline");
plot(X1, Y1, 'ro');
plot(Xout, Yout, 'b');

subplot(3,2,5);
hold on
[Xout, Yout] = cubicSpline(X1, Y1, 'complete');
title("Complete Cubic Spline");
plot(X1, Y1, 'ro');
plot(Xout, Yout, 'b');

subplot(3,2,6);
hold on
[Xout, Yout] = cubicSpline(X1, Y1, 'not-a-knot');
title("Not-a-Knot Cubic Spline");
plot(X1, Y1, 'ro');
plot(Xout, Yout, 'b');



%Second Evaluation of the functions. 1/(1+12*(x1*^2)
figure
X2 = linspace(-1,1,15);
Y2 = (1+12*(X2.^2)).^(-1);

% vandermonde(X2, Y2);
% Newton(X2, Y2);

subplot(3,2,4);
hold on
[Xout, Yout] = cubicSpline(X2, Y2, 'natural');
title("Natural Cubic Spline");
plot(X2, Y2, 'ro');
plot(Xout, Yout, 'b');

subplot(3,2,5);
hold on
[Xout, Yout] = cubicSpline(X2, Y2, 'complete');
title("Complete Cubic Spline");
plot(X2, Y2, 'ro');
plot(Xout, Yout, 'b');

subplot(3,2,6);
hold on
[Xout, Yout] = cubicSpline(X2, Y2, 'not-a-knot');
title("Not-a-Knot Cubic Spline");
plot(X2, Y2, 'ro');
plot(Xout, Yout, 'b');

%Third Evaluations 
figure()
X3base = 1994; % Use a base to decrease error coming from computing on large numbers
X3= [0 1 2 3 4 5 6 7 8 9];
Y3base = 67;
Y3= [0.052 1.008 2.803 5.024 6.400 5.063 7.669 7.487 7.065 9.777];

% vandermonde(X3, Y3);
% Newton(X3, Y3);

subplot(3,2,4);
hold on
[Xout, Yout] = cubicSpline(X3, Y3, 'natural');
title("Natural Cubic Spline");
plot(X3 + X3base, Y3 + Y3base, 'ro');
plot(Xout + X3base, Yout + Y3base, 'b');

subplot(3,2,5);
hold on
[Xout, Yout] = cubicSpline(X3, Y3, 'complete');
title("Complete Cubic Spline");
plot(X3 + X3base, Y3 + Y3base, 'ro');
plot(Xout + X3base, Yout + Y3base, 'b');

subplot(3,2,6);
hold on
[Xout, Yout] = cubicSpline(X3, Y3, 'not-a-knot');
title("Not-a-Knot Cubic Spline");
plot(X3 + X3base, Y3 + Y3base, 'ro');
plot(Xout + X3base, Yout + Y3base, 'b');
