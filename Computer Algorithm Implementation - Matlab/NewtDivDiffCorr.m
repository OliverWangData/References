function[PolyCoeffs]=NewtDivDiffCorr(degree,approxValue1)
f = @(x) sqrt(1+x);
step = 0;
i1 = 1;
i2 = 1;
i3 = 1;
DivDiffTable = zeros(degree+1,degree+1);

%Creates X Values with the specified number of steps as an Array
while i1 <= degree+1
    xvalues(i1) = step;
    yvalues(i1) = f(step);
    i1 = i1+1;
    step = step + (1/degree);
end

%Sets the First row as yvalues
while i3 <= (degree+1) - (i2-1)
    DivDiffTable(i2,i3) = yvalues(i3);
    i3=i3+1;
end

%Fills in the remaining Div Diff Table
i2 = 2;
i3 = 1;
while i2 <= degree+1 %Creating the rows to hold each 1-to-N variable functions
    while i3 <= (degree+1) - (i2-1) %Creating Columns to hold the values of those function 
        DivDiffTable(i2,i3) = (DivDiffTable(i2-1,i3+1) - DivDiffTable(i2-1,i3)) / (xvalues(i3+i2-1)-xvalues(i3));
        i3 = i3 + 1;
    end
    i3 = 1;
    i2 = i2 + 1;
end

%Creating Vector for polynomial evaluation Using DivDiffTable
i4 = 1;
PolyCoeffs = zeros(degree+1,1);
while i4 <= degree
    if i4 == 1
        PolyCoeffs(i4,1) = DivDiffTable(degree+2-i4,1);
    else
        sums = 0;
        for  i5 = 1:i4
            tempCoef = zeros(i4,1);
            tempCoef(1,1) = 1;
            
            tempCoef(i5+1,1) = (approxValue1 - xvalues(i5))*tempCoef(i5,1);
            sums = sums + DivDiffTable(degree+2-i4,1)*tempCoef(i5,1);
        end
        PolyCoeffs(i4,1) = PolyCoeffs(i4-1,1)+ sums;
    end
    i4=i4+1;
end
end