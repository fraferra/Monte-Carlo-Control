function a = policy( s, d0, stateMatrix, hitMatrix, stickMatrix )
% a=1 -> hit
% a=2 -> stick
%   Detailed explanation goes here

    m=2; %number of actions
    Ns=stateMatrix(s,d0);
    e=greedyExplorationFactor(Ns);
    
    Pgreedy= e/m + 1- e;
    Pother= e/m;
    %Find greedy action based on action value fucntion
    if hitMatrix(s,d0)>stickMatrix(s,d0)
        greedyAction=1;
        otherAction=2;
    elseif hitMatrix(s,d0)<stickMatrix(s,d0)
        greedyAction=2;
        otherAction=1;
    else
        tmp=randperm(2);
        greedyAction=tmp(1);
        otherAction=tmp(2);
    end
    %get random number
    randomExtraction=rand;
    %choose action to take based on probability
    if randomExtraction<=Pgreedy
        a=greedyAction;
    else
        a=otherAction;
    end
    

end

