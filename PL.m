function [MSE, Error] = PL(locations,D,epsilon,xt,N_test)
% input:
% D - distance between different locations
% epsilon - a value
% SamNum - smaple number

N_loc = size(D,1);
side = sqrt(N_loc);
N_user = 100*N_loc;


var = zeros(1,N_test);
err = zeros(1,N_test);


for k = 1:N_test
    
    users = randsrc(N_user,1,[1:N_loc; xt]); 
    
    r = (lambertw(-1,(rand(N_user,1)-1)./exp(1))+1)/(-epsilon);
    theta = 2*pi*rand(N_user,1);
    temp = locations(users,:) + [r.*cos(theta), r.*sin(theta)];
    temp = round(temp); temp(temp<1) = 1; temp(temp>side) = side;
    reports = side*(temp(:,1)-1)+temp(:,2);    
    
    temp = tabulate(users); 
    temp = temp(:,2);
    count_user = [temp; zeros(N_loc-length(temp),1)];

    temp = tabulate(reports); 
    temp = temp(:,2);
    count_est = [temp; zeros(N_loc-length(temp),1)];

    var(k) = norm(count_user-count_est,2)^2/N_user;
    err(k) = sum((users-reports)~=0)/N_user;

end

MSE = [mean(var); mean(var)-min(var); max(var)-mean(var)];
Error = [mean(err); mean(err)-min(err); max(err)-mean(err)];


end
    
    
