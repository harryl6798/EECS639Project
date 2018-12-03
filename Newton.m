function [outputArg1] = Newton(X,y)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
r= size(X);
a = ones(r(2));
final = tril(a);

for col = 2:r(2)
    newSize = r(2) - col +1;
    newArray = zeros(newSize,1);
    for t = 1: newSize
        newArray(t) = (X(col+t-1) - X(col-1)) * final(col+t-1,col-1);
    end
    final(col:r(2),col) = newArray;
    
end

g = y';

c= final\g;


outputArg1 = c;
end

