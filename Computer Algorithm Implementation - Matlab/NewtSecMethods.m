function[pn]=NewtSecMethods(f,fprime,methodIndex,p0,p1)

%Defining Newton and Secant iterations
fnewt = @(p0) p0-(f(p0)/fprime(p0));
fsec = @(p0,p1) p1-((f(p1)*(p1-p0))/(f(p1)-f(p0)));

%Performs one iteration of the specified method
if methodIndex == 1
    pn = fnewt(p0);
elseif methodIndex == 2
    pn = fsec(p0,p1);
end
end