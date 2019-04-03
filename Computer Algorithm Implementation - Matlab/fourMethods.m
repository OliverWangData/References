function[pn] = fourMethods(methodIndex,initialPoint,iterations)

%Iteration methods we want to test
methoda = @(p) p*((1+(7-(p^5))/(p^2))^3);
methodb = @(p) p-(((p^5)-7)/(p^2));
methodc = @(p) p-(((p^5)-7)/(5*(p^4)));
methodd = @(p) p-(((p^5)-7)/12);
p = initialPoint;

%Computes a specified number of iterations of a specified method
if methodIndex == 1
    for  i= 1:iterations
        p = methoda(p);
    end
elseif methodIndex == 2
    for  i= 1:iterations
        p = methodb(p);
    end
elseif methodIndex == 3    
    for  i= 1:iterations
        p = methodc(p);
    end
elseif methodIndex == 4    
    for  i= 1:iterations
        p = methodd(p);
    end
    
end
pn = p;
end