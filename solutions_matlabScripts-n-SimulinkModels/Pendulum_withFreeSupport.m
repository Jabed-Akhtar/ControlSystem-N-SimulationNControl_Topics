% *************************************************************************
% By        : Jabed-Akhtar (github)
% date      : 24.04.2022
% *************************************************************************
% file      : Pendulum_withFreeSupport.m
% sim-file  : sim_Pendulum_withFreeSupport.slx
% brief     :
% *************************************************************************
% script (this) related infos:
%   - task-file can be found at location: '../Tasks/Pendulum_withFreeSupport_Task.jpg'
%   - evicences/pics can be found at location: '../evidendes/Pendulum_withFreeSupport.jpg'
% *************************************************************************
% Descriptions:
%   - equations:
%       1. x_dot_dot = m/(M+m)*l * ( (theta_dot^2*sin(theta)) -
%       (theta_dot_dot*cos(theta)) )
%       2. theta_dot_dot = -1/l * ( x_dot_dot*cos(theta) + g*sin(theta) )
% *************************************************************************

clc; clear; close all;


%% Variables --------------------------------------------------------------
M = 400; %kg
m = 200; %kg
l = 10; %m
x_max = 60; %m
v0 = 6; %m/s
theta0 = 30; %grad
theta0_rad = (pi/180)*theta0; %rad
t_sim = 25; %s
g = 9.8; %m/s^2

%% running simulink model -------------------------------------------------
simout = sim('sim_Pendulum_withFreeSupport.slx');


%% getting data and potting -----------------------------------------------
t = simout.tout;
x = simout.x.Data;
theta = simout.theta.Data;
theta_dot = simout.theta_dot.Data;
%plotting data
subplot(2,2,1)
plot(t, x)
xlim([0 t_sim]); grid;
xlabel('time [s]'); ylabel('x [m]');
subplot(2,2,2)
plot(t, theta)
xlim([0 t_sim]); grid;
xlabel('time [s]'); ylabel('theta [rad]');
subplot(2,2,4)
plot(t, theta_dot)
xlim([0 t_sim]); grid;
xlabel('time [s]'); ylabel('theta\_dot [rad/s]');


% *************************** END OF FILE *********************************