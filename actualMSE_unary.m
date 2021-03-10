function MSE = actualMSE_unary(Prob,xt,N_test)

N_loc = size(Prob,1);
N_user = 10*N_loc;
p = Prob(1,1);
q = Prob(1,2);

var = zeros(1,N_test);
for k = 1:N_test
    
    users = randsrc(N_user,1,[1:N_loc; xt]); 
    
    B_reports = zeros(N_user,N_loc);
    for i = 1:N_user
        for j = 1:N_loc
            if(users(i) == j)
                temp = [1-p p];
            else
                temp = [1-q q];
            end
            B_reports(i,j) = randsrc(1,1,[0:1; temp]);
        end
    end
    
    temp = tabulate(users); 
    temp = temp(:,2);
    count_user = [temp; zeros(N_loc-length(temp),1)];

    count_row = sum(B_reports)';
    count_est = (count_row-N_user*q)/(p-q);

    var(k) = norm(count_user-count_est,2)^2/N_user;

end

MSE = [mean(var); mean(var)-min(var); max(var)-mean(var)];


end

