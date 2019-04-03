function[Aprime,OpTrack] = ColSwap(A,col1, col2)
[nrow,~] = size(A);
Aprime = A;

for i = 1:nrow
    Aprime(i,col1) = A(i,col2);
    Aprime(i,col2) = A(i,col1);
end
OpTrack = strcat("Col",num2str(col1)," swap Col", num2str(col2));
end