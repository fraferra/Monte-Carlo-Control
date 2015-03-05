function [ updateState, reward ] = step( currentState, firstDealerCard, action )
%
%   
    %action
    %1- hit
    %2- stick
    reward=99;
    dealerSum=firstDealerCard;
    
    if action == 1
        %Draw a new card
        newcard=newCard();

        %Update State
        updateState=currentState+newcard;
        
        %if update status terminates games
        if updateState < 1 || updateState > 21
            reward=-1;
        end
    % if action = stick
    else
        updateState=currentState;
        % dealer's actions
        while dealerSum<17 && dealerSum>=1
            newcard=newCard();
            dealerSum=dealerSum+newcard;
            
        end
        
        if dealerSum <1 || dealerSum>21
            reward=+1;
        else
            if dealerSum==updateState
                reward=0;
            end
            if dealerSum>updateState
                reward=-1;
            end
            if dealerSum<updateState
                reward=+1;
            end
        end
    end

end

