% Script with various dissolution functions
%
% Some of these may model the bolus dissolution better than the Fickian
% diffusion assumption used in the 'main.m' script.
% 
% Ref: Costa & Lobo (2001) 'Modeling and comparison of dissolution
% profiles'. Eur. J. Pharm. Sci. 13:2 pp123-133.
%
% Nomenclature
% t - time
% W0 - initial amount of dissoluting substance
% W - amount of dissoluting substance
% K - proportionality constant
% K0 - zero order release constant
% ft - fraction of dissolution species (=1-W/W0)
% Q0 - initial amount in solution
% Q - amount dissolved (released) per unit area
% C - concentration in solute
% Ce - solubility in equilibrium at surrounding temp
% Cs - solubility in matrix media
% m - accumulated fraction of dissolved species in solution
% D - is diffusivity of dissolved molecules
% h - distance of discontinuity concentration front from matrix
% dh - movement of the release front


%% Zero order kinetics
% W0 - W = K*t;
% f = K*t;
% Q = Q0 + K0*t

%% First order kinetics
% dCdt = K*(Ce - C);

%% Weibull model
% m = 1 - exp(-(t-Ti)^b*a);

%% Higuchi model
% f = Q = D*(2*C-Cs)*Cs*t;
% dQ = C*dh - 0.5*(Cs*dh); 
% dQdt = D*Cs/h; % Fick's 1st law!
% t = h^2*4*D*Cs*(2*C-Cs)+k; % k=0 if starting from t=0
% Q = t*D*Cs*(2*C-Cs);

%% Hixson-Crowell model
% W0^(1/3) - W^(1/3) = Ks*t;

%% Korsmeyer-Peppas model (Power law)
% f = a*t^n;
% Q/Qinf = K*t^n;

%% Baker-Lonsdale model (controlled release spherical matrix)
% 1.5*(1-(-Q/Qinf)^(2/3))-Q/Qinf = (3*Dm*Cms*t)/(r0^2*C0);
% 1.5*(1-(-Q/Qinf)^(2/3))-Q/Qinf = (3*Df*Cfs*ep*t)/(r0^2*C0*tau);
















