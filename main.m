% Model of dissolution of bolus into surrounding fluid

% Author: Alexander (Sandy) Lamond

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
%     internally is equal to the flux of glucose exteranlly.
%     * initial condition for the bolus and surrounding fluid is zero
%     glucose.
