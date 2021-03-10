function [MSE, Error] = myMSE(Prob,xt)

N_loc = length(xt);
Qinv = inv(Prob');
Q_temp = Qinv.^2;

UA = zeros(1,N_loc);
UI = zeros(1,N_loc);

for i = 1:N_loc   
    prior = xt(i);
    if(prior>0)
        P_temp = Prob(i,:);
        UA(i) = prior*sum(P_temp*Q_temp);
        UI(i) = prior*(1-Prob(i,i));
    end
end

MSE = sum(UA)-1;
Error = sum(UI);
end