function [] = testing()
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

%First Evaluation of all the functions e^x^2
values = linspace(.6,1,5);
x1 = values;
y1 = exp(x1.^2);

vandermonde(x1,y1);
Newton(x1,y1);
% cubicSpline(x1, y1, 'natural');
% cubicSpline(x1, y1, 'complete');
% cubicSpline(x1, y1, 'not-a-knot');



%Second Evaluation of the functions. 1/(1+12*(x1*^2)
values = linspace(-1,1,15);
x1 = values;
y1 = (1+12*(x1.^2)).^(-1);

vandermonde(x1,y1);
Newton(x1,y1);
cubicSpline(x1, y1, 'natural');
%cubicSpline(x1, y1, 'complete');
%cubicSpline(x1, y1, 'not-a-knot');

%Third Evaluations 
x1= [1994, 1995, 1996,1997,1998,1999,2000,2001,2002,2003];
y1= [67.052,68.008,69.803,72.024,73.400,72.063,74.669,74.487,74.065,76.777];

vandermonde(x1,y1);
Newton(x1,y1);
% cubicSpline(x1, y1, 'natural');
% cubicSpline(x1, y1, 'complete');
% cubicSpline(x1, y1, 'not-a-knot');




end

