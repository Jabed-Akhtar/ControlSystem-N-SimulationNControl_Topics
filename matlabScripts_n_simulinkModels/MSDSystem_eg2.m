% *************************************************************************
% By        : Jabed-Akhtar (github)
% date      : 14.04.2022
% *************************************************************************
% file      : MSDSystem_eg2.m
% sim-file  : sim_MSDSystem_eg2.slx
% brief     :
% *************************************************************************
% script (this) related infos:
%   - a source used within this script: https://youtu.be/kbxzXw_fXUc
%   - task-file can be found at location: '../Tasks/MSDSystem_eg2_Task.png'
%   - evicences/pics can be found at location: '../docs_images__/MSDSystem_eg2_***.jpg'
% *************************************************************************
% Descriptions:
%   - a Mass-Spring-Damper system
%   - equation: m*x_dot_dot + c*x_dot + k*x = F
%       => x_dot_dot = 1/m (F - c*x_dot - k*x)
%       => Laplace tf: m*s_2*X(s) + c*s*X(s) + k*X(s) = F
%           -> TF: W(s) = X(s)/F(s) = 1/m ( (m*s_2 + c*s + k) / (1) )
% *************************************************************************

clc; clear; close all;

%% Variables --------------------------------------------------------------
F = 10; % N
m = 4; % Kg
c = 3; % Damping constant
k = 20; % spring constant

H = [1];

%% Transfer function representation ---------------------------------------
num = 1;
den = [m c k];

Gp = tf(num, den); % transfer-function of plant

%% Step response ----------------------------------------------------------
[step1, timeStep1] = step(Gp);
% plotting step response
figure(1)
plot(timeStep1, step1) % is same as step(W)
title('step - tf'); grid

%% Impulse response -------------------------------------------------------
[impulse1, timeImpulse1] = impulse(Gp);
% plotting step response
figure(2)
plot(timeImpulse1, impulse1) % is same as impulse(W)
title('impulse - tf'); grid

%% Designing PID Controller -----------------------------------------------
% Step-1: get PID parameters with help of 'PID Tuner' tool and export the
%   controller to Matlab-Workspace
%   - some screenshots from 'PID Tuner' can be found at location: '../docs_images__/MSDSystem_eg2_PIDTuner_***.jpg'
% saving the exported PID Controller
save('var_MSDSystem_eg2_Controller_PID', "Controller_PID")

% Step-2: getting Kp, Ki and Kd from exported PID-Controller exported from 'PID Tuner'
load('var_MSDSystem_eg2_Controller_PID')
Kp = Controller_PID.Kp;
Ki = Controller_PID.Ki;
Kd = Controller_PID.Kd;

Gc = pid(Kp, Ki, Kd);

%% Closed-loop tf with Controller  ----------------------------------------
M = feedback(Gc*Gp, H);

%% Step response with PID Controller --------------------------------------
figure(3)
step(M)
grid;

%% Saving all figures -----
saveas(figure(1), 'MSDSystem_eg2_step.jpg')
saveas(figure(2), 'MSDSystem_eg2_impulse.jpg')
saveas(figure(3), 'MSDSystem_eg2_stepResponseWithPIDController.jpg')


% *************************** END OF FILE *********************************