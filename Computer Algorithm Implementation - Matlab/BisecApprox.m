function [newa,newb] = BisecApprox(inputFunction,a,b)

%C value function to check evaluation
cValue = @(x,y) (1/2) * (x + y);

%Bisection method conditions
if inputFunction(a)*inputFunction(cValue(a,b)) > 0
    newa = cValue(a,b);
    newb = b;
    return;
elseif  inputFunction(b)*inputFunction(cValue(a,b)) > 0
    newa = a;
    newb = cValue(a,b);
    return;
else
    newa = cValue(a,b);
    newb = cValue(a,b);
    return;
end
end
