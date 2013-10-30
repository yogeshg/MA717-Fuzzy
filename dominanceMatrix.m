function [domH] = dominanceMatrix(H,m,n)

%Step 12
dominating = zeros(m,1);
for l=1:m
    if (dominating(l,1) == 1)
        %Row is already dominated
        continue;
    end
    
    for k=1:m
        if (l ~= k)
            isdom = 0;
            for j=1:n
                if (H(l,j)>0)
                    if ((H(k,j)>0) && (H(k,j)<=H(l,j)))
                        isdom = 1;
                    else
                        isdom = 0;
                        break;
                    end
                end
            end
            if (isdom == 1)
                dominating(k,1) = 1;
                %Row l dominates Row k;
                break;  
            end
        end    
    end
end

for i=1:m
    if (dominating(i,1) == 1)
        domH(i,:) = zeros(1,n);
    else
        domH(i,:) = H(i,:); 
    end
end

return;