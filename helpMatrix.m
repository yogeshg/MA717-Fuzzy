function [H, IND, Xgr] = helpMatrix( Aug )
% helpMatrix - Given FLP's augmented matrix in normal form, make Help
%               matrix, independence matrix and greater limit of Solution
% function [H, IND, Xgr] = helpMatrix( Aug )
% Aug - Augmented Matrix
% H - Help Matrix
% IND - Independence Matrix
% Xgr - Solution Space Greater Limit
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

[m,n] = size(Aug);

% Row Independence
IND = zeros(m,1);
% Help matrix
H = zeros(m,n-1);
% Xgr
Xgr = ones(n-1,1);

for j=1:n-1
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
        Xgr(j) = Aug(k,n);
        IND(k) = IND(k) + 1;
        H(k,j) = Aug(k,n);
        
        for i=1:(k-1)
            if ((Aug(i,j) >= Aug(i,n))&&(Aug(i,n) == Aug(k,n)))
                IND(i) = IND(i) + 1;
                H(i,j) = B(i);
            end
        end
        
        for i=(k+1):m
            if Aug(i,j) == Aug(i,n)
                IND(i) = IND(i) + 1;
                H(i,j) = Aug(i,n);
            end
        end
    else
        %Step 9
        % in every column, find first rth cell which is b(i)    
        r = 0;
        for i=1:m
            if (Aug(i,j) == Aug(i,n))
                r = i;
                break;
            end
        end
        
        if (r ~=0)
            for i=r:m
                if (Aug(i,j) == Aug(i,n))
                    IND(i) = IND(i) + 1;
                    H(i,j) = Aug(i,n);
                end
            end
            
        end
    end
end
