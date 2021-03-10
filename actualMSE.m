function [MSE, Error] = actualMSE(Prob,xt,N_test)

N_loc = size(Prob,1);
N_user = 10*N_loc;

var = zeros(1,N_test);
err = zeros(1,N_test);
for k = 1:N_test
    
    users = randsrc(N_user,1,[1:N_loc; xt]); 
    reports = zeros(N_user,1);
    for i = 1:N_user
        reports(i) = randsrc(1,1,[1:N_loc; Prob(users(i),:)]);
    end
    
    temp = tabulate(users); 
    temp = temp(:,2);
    count_user = [temp; zeros(N_loc-length(temp),1)];

    temp = tabulate(reports); 
    temp = temp(:,2);
    count_row = [temp; zeros(N_loc-length(temp),1)];
    count_est = (Prob')\count_row;

    var(k) = norm(count_user-count_est,2)^2/N_user;
    err(k) = sum((users-reports)~=0)/N_user;

end

MSE = [mean(var); mean(var)-min(var); max(var)-mean(var)];
Error = [mean(err); mean(err)-min(err); max(err)-mean(err)];

end

