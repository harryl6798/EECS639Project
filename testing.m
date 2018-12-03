%First Evaluation of all the functions e^x^2
figure
X1 =  linspace(.6,1,5);
Y1 = exp(X1.^2);

%VanderMonde Matrix1
subplot(3,2,1);
title("VanderMonde Matrix");

out = vandermonde(X1, Y1);
hold on
r = size(out);
yy=0;
 xx = linspace(X1(1),X1(r(1)),50);
 for i=1:(r(1))
    yy = yy + out(i)*xx.^(i-1) ;
 end
plot(X1,Y1,'ro')
plot(xx,yy,'b');

%Newton Matrix 1
subplot(3,2,2);
title("Newtons Method");
out = Newton(X1, Y1);
hold on
r = size(out);
xx = linspace(X1(1),X1(r(1)),50);
Y3 = 0;
for i=1:(r(1))
   Y3 = Y3 + out(2).*(xx - X1(1)) ;
end
plot(X1,Y1,'ro')
plot(xx,yy,'b');


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


%VanderMonde Matrix1
subplot(3,2,1);
title("VanderMonde Matrix");
out = vandermonde(X2, Y2);
hold on
r = size(out);
yy=0;
 xx = linspace(X2(1),X2(r(1)),50);
 for i=1:(r(1))
    yy = yy + out(i)*xx.^(i-1) ;
 end
plot(X2,Y2,'ro')
plot(xx,yy,'b');

%Newton Matrix 1
subplot(3,2,2);
title("Newtons Method");
out = Newton(X2, Y2);
hold on
r = size(out);
xx = linspace(X2(1),X2(r(1)),50);
Y3 = 0;
for i=1:(r(1))
   Y3 = Y3 + out(2).*(xx - X2(1)) ;
end
plot(X2,Y2,'ro')
plot(xx,yy,'b');

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

%VanderMonde Matrix1
subplot(3,2,1);
title("VanderMonde Matrix");
out = vandermonde(X3, Y3);
hold on
r = size(out);
yy=0;
 xx = linspace(X3(1),X3(r(1)),50);
 for i=1:(r(1))
    yy = yy + out(i)*xx.^(i-1) ;
 end
plot(X3 + X3base, Y3 + Y3base, 'ro');
plot(xx + X3base, yy + Y3base, 'b');

%Newton Matrix 1
subplot(3,2,2);
title("Newtons Method");
out = Newton(X3, Y3);
hold on
r = size(out);
xx = linspace(X3(1),X3(r(1)),50);
yy = 0;
for i=1:(r(1))
   yy = yy + out(2).*(xx - X3(1)) ;
end
plot(X3 + X3base, Y3 + Y3base, 'ro');
plot(xx + X3base, yy + Y3base, 'b');


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
