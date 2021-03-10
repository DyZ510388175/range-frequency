function [MSE, Prob] = OU(D, epsilon)
% Optimized Unary Encoding

N_loc= size(D,1);


% probability to report itself
p = 1/2;

% probability to report others
q = 1/(exp(epsilon)+1);



Prob = q*ones(N_loc,N_loc);
Prob(1:(N_loc+1):end) = p;

MSE = N_loc*q*(1-q)/(p-q)^2 + (1-p-q)/(p-q);


end