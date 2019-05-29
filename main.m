% Model of dissolution of bolus into surrounding fluid
%
% Author: Alexander (Sandy) Lamond
%
% Description
% This script models the dissolution of food bolus into the surrounding
% gastric fluid.
% Some assumptions are made;
%     * the bolus is a homogenous sphere.
%     * the bolus contains starch that is reacted with salivary amylase to
%     produce glucose, which then diffuses from the surface of the bolus
%     into the surrounding fluid.
%     * the surrounding fluid is stagnant and has a finite boundary
%     * there is no flux at the boundary of fluid
%     * at the boundary of the bolus and fluid, the flux of glucose
%     internally is equal to the flux of glucose externally.
%     * initial condition for the bolus and surrounding fluid is zero
%     glucose.
%
% Nomenclature
% g1 - concentration of glucose on the bolus
% g2 - concentration of glucose in the surrounding fluid
% s - concentration of starch
% D1 - diffusion coefficient in the bolus
% D2 - diffusion coefficient in the surrounding fluid
% r - radial axis reference 0 at the centre of the bolus
% a - bolus radius
% R - fluid radius
% t - time
% k - reaction rate constant

% Housekeeping
close; clear; clc

% Simulation space-time
t_sim = 1;
r_sim = 1;

% Parameters
a = 0.1;
A = r_sim - a;
D1 = 1;
D2 = 1;
k = 1;

% FD discretisation
t_nodes = 101;
r_nodes = 11;
t = linspace(0, t_sim, t_nodes);
r = linspace(0,r_sim, r_nodes);

% Initial conditions
s0 = ones(t,r).*0.1;
g1_0 = ones(t_nodes,a).*0.1;
g2_0 = ones(t_nodes,A).*0.1;
