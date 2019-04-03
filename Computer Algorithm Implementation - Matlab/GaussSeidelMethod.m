function[x_output] = GaussSeidelMethod(A,x_input)

[nrow, ncol] = size(A);
x_output = zeros(nrow,1);

for i = 1:nrow %Calculates for each Xi of the A matrix
    sum1 = 0;
    sum2 = 0;
    
    if i ~= 1 %Sum can only happen for i > 1
        for j1 = 1:(i-1) %Finds the sum of aij xj with j < i
            sum1 = sum1 + (A(i,j1)*x_output(j1));
        end
    end
    
    if i ~= ncol-1 %Sum can only happen for i < 1
        for j2 = (i+1):(ncol-1) %Finds the sum of aij xj with j > i
            sum2 = sum2 + (A(i,j2)*x_input(j2));
        end
    end
    
    x_output(i) = (1/A(i,i))*(A(i,ncol) - sum1 - sum2);
end
end