function[A,operation_hist] = GaussElimBS(A, method)
[nrow,~] = size(A);
operation_hist = "Here is the operation history:";

%Sets method to default (opposed to partial/scaled) if no method given
if nargin < 2
    method = "default";
end

for i = 1:(nrow-1) %Forward row reducing, every row except the last
    
    %Check current pivot for 0
    if A(i,i) == 0 
        j = i+1; %Element right below current pivot
        while (A(j,i) == 0) && (j <= nrow) %Keeps checking below until it finds non-0 or runs out of rows
            j = j+1;
        end
        
        if j > nrow %Quits checking if there are no rows left (Free variables / impossible solution)
            return
        elseif A(j,i) ~= 0 %Swaps with non-zero row
            [A,tempOp] = RowOps(A,"swap",i,j);
            operation_hist = operation_hist + newline + tempOp;
        end
    end
    
    
    
    if method == "partial" %Partial row swaps
        
        max0 = 0;
        max_index = 0;
        for j1 = i:nrow %Check for biggest element in rows
            if abs(A(j1,i)) > max0
                max0 = A(j1,i);
                max_index = j1;
            end
        end
        [A,tempOp] = RowOps(A,"swap",i,max_index);
        operation_hist = operation_hist + newline + tempOp;
        
    elseif method == "scaled" %Scaled row swaps
        
        max1 = 0; %column-wise maximum
        max1_index = 0;
        max2 = max(abs(A),[],2); %row-wise max
        
        for j2 = i:nrow %Check for biggest element in rows
            if abs(A(j2,i)/max2(j2)) > max1
                max1 = A(j2,i);
                max1_index = j2;
            end
        end
        if i ~= max1_index
            [A,tempOp] = ColSwap(A,i,max1_index);
            operation_hist = operation_hist + newline + tempOp;
        end

    end
    
    
    %Reduces all rows below
    for j3 = (i+1):nrow
        [A,tempOp] = RowOps(A,"add",i,j3,(A(j3,i)/A(i,i)));
        operation_hist = operation_hist + newline + tempOp;
    end
end

%FOR CLARITY, ROW REDUCING IS DONE AT THIS POINT. ALL THAT IS LEFT IS BACK
%SUBSTITUTION

%Backsubstitution
for i = nrow:-1:1
    %Scale Aii to be 1
    [A,tempOp] = RowOps(A,"scale",i, i, 1/A(i,i));
    operation_hist = operation_hist + newline + tempOp;
    
    for j4 = (i-1):-1:1
        [A,tempOp] = RowOps(A,"add",i,j4,A(j4,i));
        operation_hist = operation_hist + newline + tempOp;
    end
    
end
end