function[ApproxValue] = CompositeSimpson(f, n, a, b)
stepSize = (b-a)/n;

%Calculating first summation in Simpsons Composite
sum1 = 0;
for i = 1:(n/2)-1
    sum1 = sum1 + f(a + (2*i)*stepSize);
end

%Calculating second summation
sum2 = 0;
for j = 1:(n/2)
    sum2 = sum2 + f(a + (2*j-1)*stepSize);
end

ApproxValue = (f(a) + 2*sum1 + 4*sum2 + f(b))*(stepSize/3);
    

end