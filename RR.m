function Prob = RR(D, epsilon)
% Ramdom Response

N_loc= size(D,1);


% probability to report itself
p = exp(epsilon)/(exp(epsilon) + N_loc - 1);

% probability to report others
q = (1 - p)/(N_loc - 1);



Prob = q*ones(N_loc,N_loc);
Prob(1:(N_loc+1):end) = p;

end