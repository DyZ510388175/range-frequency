function Prob = LE(D, epsilon)
% input:
% D - distance between different locations
% epsilon - a value

N_loc = size(D,1);


E = zeros(N_loc,N_loc);
for i = 1:N_loc
    for j = 1:N_loc
        E(i,j) = exp(-D(i,j)*epsilon);
    end
end
p = E\ones(N_loc,1);

flag = 1; %
for i = 1:N_loc
    if(p(i)<0 || p(i)>1)
        flag = 0;
        break;
    end
end
% flag == 1, when all elements of p is in [0 1];

if (flag == 1)
    Prob = E*diag(p);
else
    Prob = [];
    fprintf('error in LE\n');
end

end
    