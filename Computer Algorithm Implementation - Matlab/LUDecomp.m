function[L,A,P] = LUDecomp(A)
%Note: This is similar to my code in GaussElimBS, with some things removed
%in an effort to speed execution. Default reduction method chosen as there is less
%looping required (faster).

%P is only changed if required, and will stay identity if not


[nrow,~] = size(A);
P = eye(nrow); %New, P matrix
L = eye(nrow);

for i = 1:(nrow-1)
    if A(i,i) == 0 
        j = i+1;
        while (A(j,i) == 0) && (j <= nrow)
            j = j+1;
        end
        
        if j > nrow %Probability likely pretty low, may improve speed if removed
            return
        elseif A(j,i) ~= 0
            A = RowOps(A,"swap",i,j);
            P = RowOps(P,"swap",i,j); %New, Row Op on P (If needed)
        end
    end
    
    

    for j3 = (i+1):nrow
        L(j3,i) = A(j3,i)/A(i,i); %New, saves term from GE for L
        A = RowOps(A,"add",i,j3,(A(j3,i)/A(i,i)));
    end
end


end