function [ sol ] = fun_FTCS( p, IC, BC, disc )
%fun_FTCS finite difference for diffusion equation
%   Solves diffusion equation pdes using explicit finite differences.
%   Forward in time (FT) and central in space (CS).

% Discretisation
t_nodes = disc;
r_nodes = disc;

% Initial conditions

% Boundary conditions

% Parameters

% time loop
for i=1:t_nodes
    
    % space loop
    for j=1:r_nodes
        
        sol = p + IC + BC;
        
    end % end space loop
    
end % end time loop


end % end function