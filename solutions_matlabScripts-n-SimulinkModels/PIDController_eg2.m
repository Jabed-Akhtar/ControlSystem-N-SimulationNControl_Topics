% *************************************************************************
% By        : Jabed-Akhtar (github)
% date      : 01.04.2022
% *************************************************************************
% file      : PIDController_eg2.m
% sim-file  : zz_sim_PIDController_eg2.slx
% brief     :
% *************************************************************************
% script (this) related infos:
%   - a source used within this script: https://youtu.be/ThA7zhLX98A
%   - evicences/pics can be found at location: '../docs_images__/PIDController_eg2_***.png'
% *************************************************************************
% Descriptions:
%   - ---
% *************************************************************************

clc; clear; close all;

%% Variables --------------------------------------------------------------
H = [1]

%% Transfer function of Plant ---------------------------------------------
num = [1 6 10];
den = [1 0 7 1];

Gp = tf(num, den) % transfer-function of plant

%% Defining PID Controller ----------------------------------
Kp = 5;
Ki = 5;
Kd = 1;

Gc = pid(Kp, Ki, Kd);

%% Closed-loop tf with Controller  ----------------------------------------
M = feedback(Gc*Gp, H)

%% Step response ----------------------------------------------------------
figure(1)
step(M)
grid;


%% Saving all figures -----
saveas(figure(1), 'PIDController_eg2_step.png')


% *************************** END OF FILE *********************************