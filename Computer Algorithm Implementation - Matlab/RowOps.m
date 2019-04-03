function[Aprime,OpTrack] = RowOps(A,method, inRow, outRow, scale)
[~,ncol] = size(A);
Aprime = A;

if method == "scale"
    for i = 1:ncol
        Aprime(outRow,i) = scale*A(outRow,i);
    end
    OpTrack = strcat(num2str(scale)," x Row",num2str(inRow)," -> Row", num2str(inRow));
elseif method == "swap"
    for i = 1:ncol
        Aprime(inRow,i) = A(outRow,i);
        Aprime(outRow,i) = A(inRow,i);
    end
    OpTrack = strcat("Row",num2str(inRow)," <-> Row", num2str(outRow));
elseif method == "add"
    for i = 1:ncol
        Aprime(outRow,i) = A(outRow,i) - scale*A(inRow,i);
    end
    OpTrack = strcat(num2str(scale)," x Row",num2str(inRow)," - Row",num2str(outRow)," -> Row", num2str(outRow));
end
end