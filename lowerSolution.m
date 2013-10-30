
function [Xlow] = lowerSolution(domH,m,n)

%Step 13
sol = cell(1);
count = 0;
P = [];
countP = 0;
for i=1:m
     c = cell(1);
     k = 0;
     for j=1:n
         if (domH(i,j)>0)
             k = k+1;
             countP = countP + 1;
             P = [P;[domH(i,j) j]];
             c{k} = int2str(countP);
         end
     end
     
     if (k~=0)
         count = count+1;
         sol{count} = c;
     end
end

y = size(sol,2);
while y > 1
    d = cell(1);
    count = 0;
    d1 = sol{1};
    d2 = sol{2};
    for i=1:size(d1,2)
        for j=1:size(d2,2)
            s = strcat(d1{i},',');
            count = count + 1;
            d{count} = strcat(s,d2{j});
        end    
    end
    
    temp = cell(1);
    temp{1} = d;
    k = 1;
    y = size(sol,2);
    if (y > 2)
        for i=3:y
            k=k+1;
            temp{k} = sol{i};
        end
    end
    sol = temp;
    y = size(sol,2);
end

Xtemp = sol{1};
Xlow = zeros(size(Xtemp,2),n);
for j=1:size(Xtemp,2)
    rem = Xtemp{j};
    loop=1;
    Xrule = [];
    while loop==1
        [s,rem] = strtok(rem,',');
        index=str2num(s);
        Xrule = [Xrule index];
        if isempty(rem)==1
            loop=0;
        end
    end
    
    for k=1:size(Xrule,2)
        index = Xrule(k);
        if (Xlow(j,P(index,2)) < P(index,1))
            Xlow(j,P(index,2)) = P(index,1);
        end
    end 
    
end
Xlow = Xlow';
disp('')

return;