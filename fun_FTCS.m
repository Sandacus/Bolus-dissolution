function [ g1,g2 ] = fun_FTCS( p, IC, disc, var )
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
g1 = var{1,1};
g2 = var{1,2};

% Initial conditions
% IC = [s0, g1_0, g2_0];
g1(1,:) = IC{1,2};
g2(1,:) = IC{1,3};

% Boundary conditions

% Parameters
% p = [a, A, D1, D2, k];
D1 = p(3);
D2 = p(4);
k = p(5);


% time loop
for i=1:t_nodes-1
    
    
    % ---------- BOUNDARY ----------
    % Boundary condition r=0 (use l'Hopitals rule)
    g1(i+1,1) = g1(i,1) + (dt*D1/dr^2)*3*2*(g1(i,2)-g1(i,1)) + dt*k;    
    
    % ---------- Space loop inside bolus ----------
    % positions 0 < r < a
    for j=2:aidx-1      
        g1(i+1,j) = g1(i,j) + (dt*D1)/(j*dr^2)*...
            ((j+1)*g1(i,j+1)-2*j*g1(i,j)+(j-1)*g1(i,j-1))...
            + dt*k;       
    end % end space loop
    
    % ---------- BOUNDARY ----------
    % Boundary condition @ r = a; g1 = f(t)
    g1(i+1,aidx) = g1(i,aidx) + dt*k;
    g2(i+1,1) = g1(i+1,aidx);
    
    % ---------- Space loop outside bolus ----------
    % positions a < r < A
    for j=2:r_nodes-aidx
        g2(i+1,j) = g2(i,j) + (dt*D2)/(j*dr^2)*...
            ((j+1)*g2(i,j+1)-2*j*g2(i,j)+(j-1)*g2(i,j-1));     
    end
    
    % ---------- BOUNDARY ----------
    % Boundary r = A
    g2(i+1,r_nodes-aidx+1) = g2(i,r_nodes-aidx) + (dt*D2)/(dr^2)*...
        (2*g2(i,r_nodes-aidx-1)-2*g2(i,r_nodes-aidx));
        
end % end time loop


end % end function