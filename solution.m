function [S] = solution(Xlow,Xgr)
disp('Maximal Interval Solution')
S = cell(1);
k=1;
[p,q] = size(Xlow);
for j=1:q
    Sj = cell(1);
    kj = 0;
    disp('------------------------------------');
    disp('Xmax:');
    for i=1:p
        kj=kj+1;
        if (Xgr(i,1)== Xlow(i,j))
            Sj{kj}= strcat('[',num2str(Xlow(i,j)));
            Sj{kj}= strcat(Sj{kj},']');
            
        else
            if (Xgr(i,1)> Xlow(i,j))
                Sj{kj} = strcat('[',num2str(Xlow(i,j)));
                Sj{kj} = strcat(Sj{kj}, ',');
                Sj{kj} = strcat(Sj{kj}, num2str(Xgr(i,1)));
                Sj{kj} = strcat(Sj{kj}, ']'); 
            else
                Sj{kj} = strcat('[',num2str(Xgr(i,1)));
                Sj{kj} = strcat(Sj{kj}, ',');
                Sj{kj} = strcat(Sj{kj}, num2str(Xlow(i,j)));
                Sj{kj} = strcat(Sj{kj}, ']'); 
            end
        end
        disp(Sj{kj});
    end
    disp('------------------------------------');

    S{k} = Sj;
    k=k+1;
end

return;
