function [Aug] = augmentedMatrix(A, B)
% augmentedMatrix - Calculate the augmented matrix for FLP
% function [Aug] = augmentedMatrix(A, B)
% A - Coefficient Matrix
% B - RHS Vector
% Aug - Augmented Matrix
% 
% AUTHOR    : Sameer Saksena
%             20xxXXxxxxx
% AUTHOR    : Yogesh Garg
%             2009MT50635
% DATE      : 31-Oct-2013
% COURSE    : MAL717 Fuzzy Sets and Applications
%             Prof. Suresh Chandra
%             Indian Institute of Technology, Delhi
%%

[m, n] = size([A B]);
Aug = zeros(m,n);
for i = 1:m
    for j=1:n-1
        if (A(i,j) < B(i))
            Aug(i,j) = 0;
        elseif (A(i,j) == B(i))
            Aug(i,j) = B(i);
        else 
            Aug(i,j) = 1;
        end
    end
    Aug(i,n) = B(i);
end

end
