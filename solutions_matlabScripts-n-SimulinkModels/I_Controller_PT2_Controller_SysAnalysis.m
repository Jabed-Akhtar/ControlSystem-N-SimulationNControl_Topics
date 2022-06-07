% *************************************************************************
% By        : Jabed-Akhtar (github)
% date      : 07.06.2022
% *************************************************************************
% file      : I_Controller_PT2_Controller_SysAnalysis.m
% sim-file  : sim_I_Controller_PT2_Controller_SysAnalysis.slx
% brief     :
% *************************************************************************
% script (this) related infos:
%   - evicences/pics can be found at location: '../evidendes/I_Controller_PT2_Controller_SysAnalysis.jpg'
% *************************************************************************
% Descriptions:
%   - equation of Process (PT2-Process) (without Controller)
%       F_p(s) = K / (T^2*s^2 + 2*D*T*s + 1)
%   - equation of Controller (I-Controller)
%       F_p(s) = K / (T*s + 1)
%   - equation with Controller (I-Controller and PT1-Process)
%       F_w(s) = K / (T^2*T_I*s^3 + 2*D*T*T_I*s^2 + T_I*s + K)
% *************************************************************************

clc; clear; close all;


%% Variables --------------------------------------------------------------
K = 0.89005;
T = 0.24237;
D = 0.7;
T_I = 0.9;


%% running Simulink-Modell ------------------------------------------------
simout = sim('sim_I_Controller_PT2_Controller_SysAnalysis.slx');


%% PT1-Process (without Controller) ---------------------------------------
sys_p = tf(K, [T^2 2*D*T 1]);
% getting data from simulink
sysData_p = simout.sys_out_noController.Data;
% plotting both data
figure(1)
subplot(2,2,1)
step(sys_p); title('Step Response (no Controller)')
xlim([0 10]); grid;
subplot(2,2,3)
plot(simout.tout, sysData_p)
grid; title('simout - Step Response (no Controller)')


%% I-Controller and PT1-Process -------------------------------------------
sys_C = tf(K, [T^2*T_I 2*D*T*T_I T_I K]);
% getting data from simulink
sysData_C = simout.sys_out.Data;
% plotting both data
subplot(2,2,2)
step(sys_C); title('Step Response (with Controller)')
xlim([0 10]); grid;
subplot(2,2,4)
plot(simout.tout, sysData_C)
grid; title('simout - Step Response (with Controller)')


%% opening 'Control System Designer' for further analysis and design ------
% controlSystemDesigner(sys_C)


% *************************** END OF FILE *********************************