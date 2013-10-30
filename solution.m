function [S] = solution(Xlow,Xgr)
% solution - Siven independent lower limits and upper limit solution set,
%               create the complete solution space
% function [S] = solution(Xlow,Xgr)
% Xlow - independent lower limits of solution space
% Xgr - greater limit of solution space
% S - total solution space
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
S = cell(1);
k=1;
[p,q] = size(Xlow);
for j=1:q
    Sj = cell(1);
    kj = 0;
    for i=1:p
        kj=kj+1;
        if (Xgr(i,1)== Xlow(i,j))
            Sj{kj}= sprintf('[%s]',num2str(Xlow(i,j)) );            
        else
            if (Xgr(i,1)> Xlow(i,j))
                Sj{kj} = sprintf('[%s,%s]',num2str(Xlow(i,j)),num2str(Xgr(i,1)) );
            else
                Sj{kj} = sprintf('[%s,%s]',num2str(Xgr(i,1)),num2str(Xlow(i,j)) );
            end
        end
    end

    S{k} = Sj;
    k=k+1;
end

return;
