function [ sol ] = fun_FTCS( p, IC, disc, var )
%fun_FTCS finite difference for diffusion equation
%   Solves diffusion equation pdes using explicit finite differences.
%   Forward in time (FT) and central in space (CS).

% Discretisation
% disc = {t_nodes, r_nodes, dt, dr, aidx};
t_nodes = disc{1,1};
r_nodes = disc{1,2};
dt = disc{1,3};
dr = disc{1,4};
aidx = disc{1,5};

% Variables to solve for
g1 = var;

% Initial conditions
% IC = [s0, g1_0, g2_0];
g1(1,:) = IC{1,2};

% Boundary conditions

% Parameters
% p = [a, A, D1, D2, k];
D1 = p(3);


% time loop
for i=1:t_nodes-1
    
    % Boundary condition r=0
    g1(i+1,1) = 1;
    
    % space loop (inbetween boundaries)
    for j=2:aidx-1
        
        g1(i+1,j) = g1(i,j) + (dt*D1)/(j*dr^2)*...
            ((j+1)*g1(i,j+1)-2*j*g1(i,j)+(j-1)*g1(i,j-1));
        
    end % end space loop
    
    % Boundary condition @ r = bolus edge
    g1(i+1,aidx) = 0;
    
end % end time loop

sol = g1;

end % end function