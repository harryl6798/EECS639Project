%First Evaluation of all the functions e^x^2
figure
X1 =  linspace(.6,1,5);
Y1 = exp(X1.^2);

% Vandermonde Interpolation
subplot(3,2,1);
hold on
[Xout, Yout] = vandermonde(X1, Y1, 200);
title("VanderMonde Matrix");
plot(X1, Y1, 'ro');
plot(Xout, Yout, 'b');

% Newton Interpolation
subplot(3,2,2);
hold on
[Xout, Yout] = newton(X1, Y1, 200);
title("Newtons Method");
plot(X1, Y1, 'ro');
plot(Xout, Yout, 'b');



% Natural Cubic Spline
subplot(3,2,4);
hold on
[Xout, Yout] = cubicSpline(X1, Y1, 'natural', 200);
title("Natural Cubic Spline");
plot(X1, Y1, 'ro');
plot(Xout, Yout, 'b');

% Complete Cubic Spline
subplot(3,2,5);
hold on
[Xout, Yout] = cubicSpline(X1, Y1, 'complete', 200);
title("Complete Cubic Spline");
plot(X1, Y1, 'ro');
plot(Xout, Yout, 'b');

% Not-a-Knot Cubic Spline
subplot(3,2,6);
hold on
[Xout, Yout] = cubicSpline(X1, Y1, 'not-a-knot', 200);
title("Not-a-Knot Cubic Spline");
plot(X1, Y1, 'ro');
plot(Xout, Yout, 'b');


%Second Evaluation of the functions. 1/(1+12*(x1*^2)
figure
X2 = linspace(-1,1,15);
Y2 = (1+12*(X2.^2)).^(-1);

% Vandermonde Interpolation
subplot(3,2,1);
hold on
[Xout, Yout] = vandermonde(X2, Y2, 200);
title("VanderMonde Matrix");
plot(X2, Y2, 'ro');
plot(Xout, Yout, 'b');

% Newton Interpolation
subplot(3,2,2);
hold on
[Xout, Yout] = newton(X2, Y2, 200);
title("Newtons Method");
plot(X2, Y2, 'ro');
plot(Xout, Yout, 'b');



% Natural Cubic Spline
subplot(3,2,4);
hold on
[Xout, Yout] = cubicSpline(X2, Y2, 'natural', 200);
title("Natural Cubic Spline");
plot(X2, Y2, 'ro');
plot(Xout, Yout, 'b');

% Complete Cubic Spline
subplot(3,2,5);
hold on
[Xout, Yout] = cubicSpline(X2, Y2, 'complete', 200);
title("Complete Cubic Spline");
plot(X2, Y2, 'ro');
plot(Xout, Yout, 'b');

% Not-a-Knot Cubic Spline
subplot(3,2,6);
hold on
[Xout, Yout] = cubicSpline(X2, Y2, 'not-a-knot', 200);
title("Not-a-Knot Cubic Spline");
plot(X2, Y2, 'ro');
plot(Xout, Yout, 'b');

%Third Evaluations 
figure()
X3base = 1994; % Use a base to decrease error coming from computing on large numbers
X3= [0 1 2 3 4 5 6 7 8 9];
Y3base = 67;
Y3= [0.052 1.008 2.803 5.024 6.400 5.063 7.669 7.487 7.065 9.777];

% Vandermonde Interpolation
subplot(3,2,1);
hold on
[Xout, Yout] = vandermonde(X3, Y3, 200);
title("VanderMonde Matrix");
plot(X3 + X3base, Y3 + Y3base, 'ro');
plot(Xout + X3base, Yout + Y3base, 'b');

% Newton Interpolation
subplot(3,2,2);
hold on
[Xout, Yout] = newton(X3, Y3, 200);
title("Newtons Method");
plot(X3 + X3base, Y3 + Y3base, 'ro');
plot(Xout + X3base, Yout + Y3base, 'b');



% Natural Cubic Spline
subplot(3,2,4);
hold on
[Xout, Yout] = cubicSpline(X3, Y3, 'natural', 200);
title("Natural Cubic Spline");
plot(X3 + X3base, Y3 + Y3base, 'ro');
plot(Xout + X3base, Yout + Y3base, 'b');

% Complete Cubic Spline
subplot(3,2,5);
hold on
[Xout, Yout] = cubicSpline(X3, Y3, 'complete', 200);
title("Complete Cubic Spline");
plot(X3 + X3base, Y3 + Y3base, 'ro');
plot(Xout + X3base, Yout + Y3base, 'b');

% Not-a-Knot Cubic Spline
subplot(3,2,6);
hold on
[Xout, Yout] = cubicSpline(X3, Y3, 'not-a-knot', 200);
title("Not-a-Knot Cubic Spline");
plot(X3 + X3base, Y3 + Y3base, 'ro');
plot(Xout + X3base, Yout + Y3base, 'b');


% Part C Evaluations 
figure()

XCFive = 0:5:100;
YCFive = [13 34 51 13 64 61 54 24 23 65 31 51 60 46 55 47 71 47 36 50 83];

XCDaily = 0:1:100;
YCDaily = [13 23 29 27 32 34 39 50 45 55 51 20 21 33 35 13 26 41 47 52 64 47 35 52 67 61 58 41 32 52 54 42 37 52 38 24 21 32 55 47 23 35 38 51 62 65 38 57 57 67 31 28 33 37 40 51 63 71 60 56 60 69 67 57 44 46 48 63 60 46 55 54 67 78 62 47 55 49 47 56 71 64 54 52 55 47 53 46 60 64 36 38 44 47 70 50 46 38 49 65 83];

% Newton Interpolation - Every Five Days
subplot(2,2,1)
hold on
[Xout, Yout] = newton(XCFive, YCFive, 101);
title("Newton - 5 Days");
plot(XCDaily, YCDaily, 'ro');
plot(Xout, Yout, 'b');

% Newton Interpolation - Daily
subplot(2,2,2)
hold on
[Xout, Yout] = newton(XCDaily, YCDaily, 101);
title("Newton - Daily");
plot(XCDaily, YCDaily, 'ro');
plot(Xout, Yout, 'b');

% Natural Cubic Spline - Every Five Days
subplot(2,2,3)
hold on
[Xout, Yout] = cubicSpline(XCFive, YCFive, 'natural', 101);
title("Cubic - 5 Days");
plot(XCDaily, YCDaily, 'ro');
plot(Xout, Yout, 'b');

% Natural Cubic Spline - Daily
subplot(2,2,4)
hold on
[Xout, Yout] = cubicSpline(XCDaily, YCDaily, 'natural', 101);
title("Cubic - Daily");
plot(XCDaily, YCDaily, 'ro');
plot(Xout, Yout, 'b');
