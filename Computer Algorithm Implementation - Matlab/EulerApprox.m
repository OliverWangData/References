function[result] = EulerApprox(f,y0,a,b,h)
%Note for future: Function f required to be a function of t,y
%(b-a / h) must be an integer/natural number

%Figure out number of iterations required
k = 1;
maxk = ((b-a)/h)-1;

%Creates a solution table with Tk and Yk values
solutionTable = zeros(maxk,2);
solutionTable(1,1) = a;
solutionTable(1,2) = y0;

while k-1 <= maxk
    solutionTable(k+1,1) = solutionTable(k,1) + h;
    solutionTable(k+1,2) = solutionTable(k,2) + (f(solutionTable(k,1),solutionTable(k,2))*h);
    k=k+1;
end

result = solutionTable(k,2);

end