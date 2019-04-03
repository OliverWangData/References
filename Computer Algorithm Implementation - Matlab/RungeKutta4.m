function[result] = RungeKutta4(f,y0,a,b,h)
%Figure out number of iterations required
k = 1;
maxk = ((b-a)/h)-1;

%Creates a solution table with Tk and Yk values
solutionTable = zeros(maxk,2);
solutionTable(1,1) = a;
solutionTable(1,2) = y0;

%Creates a table holding the Fi and Yk+ai values
FslopeTable = zeros(4,2);

while k-1 <= maxk
    %Order 4 RK slope calculations
    %F1
    FslopeTable(1,1) = f(solutionTable(k,1),solutionTable(k,2));
    FslopeTable(1,2) = solutionTable(k,2) + (1/2)*FslopeTable(1,1)*h;
    %F2
    FslopeTable(2,1) = f(solutionTable(k,1) + (1/2)*h,FslopeTable(1,2));
    FslopeTable(2,2) = solutionTable(k,2) + (1/2)*FslopeTable(2,1)*h;
    %F3
    FslopeTable(3,1) = f(solutionTable(k,1) + (1/2)*h,FslopeTable(2,2));
    FslopeTable(3,2) = solutionTable(k,2) + FslopeTable(3,1)*h;
    %F4
    FslopeTable(4,1) = f(solutionTable(k,1) + h,FslopeTable(3,2));
    
    %Tk+1 and Yk+1 calculations
    solutionTable(k+1,1) = solutionTable(k,1) + h;
    solutionTable(k+1,2) = solutionTable(k,2) + (h/6)*(FslopeTable(1,1) + 2*FslopeTable(2,1) + 2*FslopeTable(3,1) + FslopeTable(4,1));
    k=k+1;
end

result = solutionTable(k,2);

end