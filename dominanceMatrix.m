function [domH] = dominanceMatrix(H)
% dominanceMatrix - Given Help Matrix, create dominance Matrix
% function [domH] = dominanceMatrix(H)
% H - Help Matrix
% domH - Dominance Matrix
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

[m, n] = size(H);
%Step 12
dominatedBy = zeros(m,1);
for l=1:m
    if (dominatedBy(l,1) > 0)
        %Row is already dominated
        continue;
    end
    
    for k=1:m
        if (l ~= k)
            isdom = 1;
            for j=1:n
                if (H(l,j)>0)
                    isdom = isdom && ((H(k,j)>0) && (H(k,j)<=H(l,j)));
                end
            end
            if (isdom == 1)
                dominatedBy(k,1) = l;
                %Row l dominates Row k;
                break;  
            end
        end    
    end
end
domH = H;
for i=1:m
    if (dominatedBy(i,1) > 0)
        domH(i,:) = zeros(1,n);
    end
end

return;
