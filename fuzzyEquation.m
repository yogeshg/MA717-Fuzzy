function S = fuzzyEquation(A,B,display)
% fuzzyEquation - Solves Fuzzy Linear Programming Problem
% function S = fuzzyEquation(A,B,display)
% A - Coefficient Matrix
% B - RHS Vector
% display - Display parameters involved?
% S - Solution set
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

[m,n] = size(A);

if (nargin < 3)
    display = false;
end

%Rearranging the rows to get the system in normal form
SortEq = sortrows([A B],-(n+1));
A = SortEq(:,1:n);
B = SortEq(:,n+1);

% Compute augmented matrix
Aug = augmentedMatrix( A, B );
if( display )
    disp('-----------------Augmented Matrix-------------------------')
    disp(Aug)
end

[H, IND, Xgr] = helpMatrix( Aug );

% Check if consistent
for i=1:m
    if (IND(i) == 0)
        disp('System is inconsistent');
        return;
    end
end

if( display )
    disp('---------------- Help Matrix -----------------------------');
    disp(H);
end

domH = dominanceMatrix(H);

if( display )
    disp('----------------Dominance Matrix--------------------------');
    disp(domH);
end

Xlow = lowerSolution(domH);

if( display )
    disp('----------------Complete Solution Set---------------------');
    disp('Greatest Solution(Xgr)')
    disp(Xgr)
    disp('Lower Point Solutions(Xlow)')
    disp(Xlow)
end

S = solution(Xlow,Xgr);

if( display )
disp('Maximal Interval Solution')
    for i = 1:size(S,2)
        sol = S{i};
        disp('------------------------------------')
        disp('Xmax:')
        disp(sol')
    end
end

return;
