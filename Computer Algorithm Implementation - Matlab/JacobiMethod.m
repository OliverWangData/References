function[x_output] = JacobiMethod(A,x_input)

[nrow, ncol] = size(A);
x_output = zeros(nrow,1);

for i = 1:nrow %Calculates for each Xi of the A matrix
    sum = 0;
    for j = 1:(ncol-1) %Finds the sum of aij xj
        if i ~= j
            sum = sum + (A(i,j)*x_input(j));
        end
    end
    
    x_output(i) = (1/A(i,i))*(A(i,ncol) - sum);
end
end