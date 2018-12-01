function [outputArg1] = vandermonde(x,y)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

r = size(x);
van = zeros(r(2),r(2));

van(:,1) = 1;

for col = 2:r(2)
    van(:,col) = x(:).^(col-1);
    
end

g = y';

c= van\g;

outputArg1 = c;




end

