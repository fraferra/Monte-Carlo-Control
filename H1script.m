
clear all
%State is defined by (s, d0)
%hit - 1
%stick - 2

agentStates=21;
%Initialize N(s) and value function
Ns=zeros(agentStates,10);
Vs=zeros(agentStates,10);
%Initialize N(s,a) - Nsa(:,:,1)=hit Nsa(:,:,2)=stick
Nsa=zeros(agentStates,10,2);
%Initialize action value function Q(s,a)
Qsa=zeros(21,10,2);

iterations=5*10^5;

for i=1:iterations
    s0=randi(10);
    d0=randi(10);
    %determine action to take folllowing greedy policy
    a=policy(s0, d0, Ns, Qsa(:,:,1), Qsa(:,:,2) );

    s=s0;
    r=99;
    if rem(i, 10^5)==0
        fprintf('Iteration # %i\n\n',i)
    end
    while 1
 
        %call step function and check reward
        [s_prime r]=step(s, d0, a);
        %update value of N(s) and N(s,a) based on current state
        Ns(s, d0)=Ns(s, d0)+1;
        Nsa(s,d0,a)=Nsa(s,d0,a)+1;
        %if reward is different from 99 it means we reached a termination
        %state
        if r~=99
            %update action value function based on last state and action
            %taken from last state
            alpha = 1/(Nsa(s,d0,a));
            Qsa(s,d0,a) = Qsa(s,d0,a) + alpha*(r - Qsa(s,d0,a));

            break
        end
        s=s_prime;
       %update action if episode is not terminated
        a=policy(s, d0, Ns, Qsa(:,:,1), Qsa(:,:,2) );
        
    end

end

figure(1)
surf(Qsa(:,:,1))
figure(2)
surf(Qsa(:,:,2))


%max policy
for i=1:21
    for j=1:10
        Vs(i,j)=max(Qsa(i,j,:));
    end
end
figure(3)
surf(Vs)
