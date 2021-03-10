function Prob = EM(D, epsilon)
% input:
% D - distance between different locations
% epsilon - a value

N_loc = size(D,1);


Prob = zeros(N_loc,N_loc);
for i = 1:N_loc
    p = exp(-0.5*epsilon.*D(i,:));
    Prob(i,:) = p/sum(p);
end


end
    