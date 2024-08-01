% *************************************************************************
% By        : Jabed-Akhtar (github)
% date      : 30.04.2022
% *************************************************************************
% file      : Pendulum_TrolleyWithSwingingLoad.m
% sim-file  : sim_Pendulum_TrolleyWithSwingingLoad.slx
% brief     :
% *************************************************************************
% script (this) related infos:
%   - a source used within this script: http://www.tm-aktuell.de/TM5/Laufkatze/laufkatze.html#DiagrAnimation
%   - task-file can be found at location: '../Tasks/Pendulum_TrolleyWithSwingingLoad_Task.pdf'
%   - evicences/pics can be found at location: '../evidendes/Pendulum_TrolleyWithSwingingLoad.jpg'
% *************************************************************************
% Descriptions:
%   - ...
% *************************************************************************

clc; clear; close all;


%% Variables --------------------------------------------------------------
m_k = 100; %kg
m_l = 500; %kg
J_l = 400; %kg*m^2
l = 4; %m
F0 = 2000; %N
c = 200000; %N/m
d_t = 1; %s
a = 5; %m
t_sim = 10; %s
g = 9.81; %m/s^2

%% running simulink model -------------------------------------------------
simout = sim('sim_Pendulum_TrolleyWithSwingingLoad.slx');


%% getting data and potting -----------------------------------------------
t = simout.tout;
x = simout.x_t.Data;
phi = simout.phi_t.Data;
%plotting data
subplot(2,1,1)
plot(t, x)
xlim([0 t_sim]); grid;
xlabel('time [s]'); ylabel('x [m]');
subplot(2,1,2)
plot(t, phi)
xlim([0 t_sim]); grid;
xlabel('time [s]'); ylabel('phi [rad]');


% *************************** END OF FILE *********************************