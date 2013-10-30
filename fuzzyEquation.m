function fuzzyEquation(A,B)

[m,n] = size(A);

%Rearranging the rows to get the system in normal form
SortEq = sortrows([A B],-(n+1));
A = SortEq(:,1:n);
B = SortEq(:,n+1);

% Compute augmented matrix
Aug = augmentedMatrix( A, B );
disp('-----------------Augmented Matrix-------------------------')
disp(Aug)

% Row Independence
IND = zeros(m,1);
% Help matrix
H = zeros(m,n);
% Xgr
Xgr = ones(n,1);

for j=1:n
    %Step 8
    % in every column, find kth cell which is 1
    k = 0;
    for i=1:m
        if (Aug(i,j) == 1) 
            k = i;
        end
    end    
    % if such k is found
    if (k ~=0)
        Xgr(j) = B(k);
        IND(k) = IND(k) + 1;
        H(k,j) = B(k);
        
        for i=1:(k-1)
            if ((Aug(i,j) >= B(i))&&(B(i) == B(k)))
                IND(i) = IND(i) + 1;
                H(i,j) = B(i);
            end
        end
        
        for i=(k+1):m
            if Aug(i,j) == B(i)
                IND(i) = IND(i) + 1;
                H(i,j) = B(i);
            end
        end
    else
        %Step 9
        % in every column, find first rth cell which is b(i)    
        r = 0;
        for i=1:m
            if (Aug(i,j) == B(i))
                r = i;
                break;
            end
        end
        
        if (r ~=0)
            for i=r:m
                if (Aug(i,j) == B(i))
                    IND(i) = IND(i) + 1;
                    H(i,j) = B(i);
                end
            end
            
        end
    end
end

%step 10
for i=1:m
    if (IND(i) == 0)
        disp('System is inconsistent');
        return;
    end
end

%Step 12
disp('---------------- Help Matrix -----------------------------');
disp(H);
disp('---------------- Independence ----------------------------');
disp(IND);


domH = dominanceMatrix(H,m,n);
disp('----------------Dominance Matrix--------------------------');
disp(domH);


%Step 13
disp('----------------Complete Solution Set---------------------');
disp('Greatest Solution(Xgr)')
disp(Xgr)
disp('Lower Point Solutions(Xlow)')
Xlow = lowerSolution(domH,m,n);
disp(Xlow)

S = solution(Xlow,Xgr);

return;



