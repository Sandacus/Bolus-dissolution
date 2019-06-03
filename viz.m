% Script for plotting 2D polar surfaces.
% 
% Alexander Lamond
%
% Adapted from the "Compendium of PDE's in Matlab"

% Housekeeping
close all; clear; clc

% Run main script first to populate workspace
main;

% Parameters
th_nodes = 10;
th0=2*pi;% pi/2.0;
th=zeros(1,th_nodes-1);
dth=th0/(th_nodes-1);
for j=1:th_nodes
    th(j)=(j-1)*dth;
end

% Add theta component for 'u', assuming symmetry
sol = repmat(sol,1,1,th_nodes);

% Set up plotting vars
r1 = linspace(-r_sim, r_sim, 2*r_nodes);
th1 = linspace(0, 2*pi, 2*th_nodes);

% Create mesh for single quadrant image
[R1, Theta1] = meshgrid(r1,th1);

% Create mesh for four quadrant mesh
[R2, Theta2] = meshgrid(r1,th1);

% Convert meshes to Cartesian form
[X1,Z1] = pol2cart(Theta1,R1);
[X2,Z2] = pol2cart(Theta2,R2);
% plotType = 2; % set plot type: 1=single-quadrant, 2=four-quadrant

% Plot dependent variable, u(r,theta) over one quadrant
% at t=tf
h = figure;
axis tight manual % ensures getframe() returns a consistent size
for it=1:2:t_nodes
    
    % Create 2D matrix of simulation output data at t(it)
    U0(:,:) = sol(it,:,:);
    
    % Convert results data to be suitable for use with meshgrid using cubic
    % interpolation.
    U1 = interp2(th,r,U0,Theta1,R1,'cubic');
   
    % Create plot from single quadrant data
    surf(Z1,X1,U1); hold on;
    
    % graph options
    shading interp
    colormap jet
    axis tight; 
    axis square
    %colorbar(128); caxis([0,1]); % Add color key
    xlabel('X'); ylabel('Z'); zlabel('u(r,\theta)');
    view([0,90]); % set azimuth and elevation
    
    drawnow
    
    % Capture plot as an image
    frame = getframe(h);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    
    % Write to GIF file
    if it == 1
        imwrite(imind,cm,'dataviz.gif', 'gif', 'Loopcount', inf);
    else
        imwrite(imind,cm,'dataviz.gif', 'gif', 'WriteMode', 'append');
    end
    
end












