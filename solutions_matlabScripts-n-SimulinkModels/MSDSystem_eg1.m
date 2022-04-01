% *************************************************************************
% By        : Jabed-Akhtar (github)
% date      : 01.04.2022
% *************************************************************************
% file      : MSDSystem_eg1.m
% brief     :
% *************************************************************************
% script (this) related infos:
%   - a source used within this script: https://aleksandarhaber.com/introduction-to-matlab-control-system-toolbox/
%   - task-file can be found at location: '../Tasks/MSDSystem_eg1_Task.pdf'
%   - evicences/pics can be found at location: '../docs_images__/MSDSystem_eg1_***.jpg'
% *************************************************************************
% Descriptions:
%   - a Mass-Spring-Damper system
%   - equation: m*x_dot_dot + K_d*x_dot + k_s*x = F
%       => Laplace tf: m*s_2*X(s) + K_d*s*X(s) + k_s*X(s) = F
%           -> TF: W(s) = X(s)/F(s) = 1 / (m*s_2 + K_d*s + k_s)
% *************************************************************************

clc; clear; close all;

%% Variables --------------------------------------------------------------
m = 10;
kd = 1;
ks = 10;

%% Transfer function representation ---------------------------------------
num = 1;
den = [m kd ks];

W = tf(num, den)

%% State-space representation ---------------------------------------------
A = [0 1; -ks/m -kd/m];
B = [0; 1/m];
C = [1 0];
D = 0;
sysSS = ss(A, B, C, D);

%% Step response ----------------------------------------------------------
[step1, timeStep1] = step(W)
[step2, timeStep2] = step(sysSS)
% plotting step response
figure(1)
subplot(2,1,1)
plot(timeStep1, step1) % is same as step(W)
title('step1 - tf'); grid
subplot(2,1,2)
plot(timeStep2, step2) % is same as step(sysSS)
title('step2 - state-space'); grid

%% Impulse response -------------------------------------------------------
[impulse1, timeImpulse1] = impulse(W)
[impulse2, timeImpulse2] = impulse(sysSS)
% plotting step response
figure(2)
subplot(2,1,1)
plot(timeImpulse1, impulse1) % is same as impulse(W)
title('impulse1 - tf'); grid
subplot(2,1,2)
plot(timeImpulse2, impulse2) % is same as impulse(sysSS)
title('impulse2 - state-space'); grid

%% Initial condition response ---------------------------------------------
X0 = [5;5];
[initial1, timeInitial1] = initial(sysSS, X0)
% plotting
figure(3)
plot(timeInitial1, initial1)
title('response with initial condition [5;5]'); grid

%% Response to an arbitrary signal and initial condition ------------------
X0_lsim = [-0.1,-0.1];
timeSignal = 0:0.01:100;
signal = sin(0.5*(timeSignal)) + 2*ones(size(timeSignal));
[signalResponse, timeSignalResponse] = lsim(sysSS, signal, timeSignal, X0_lsim);
% plotting
figure(4)
subplot(2,1,1)
plot(timeSignal, signal)
title('input signal - sine'); grid
subplot(2,1,2)
plot(timeSignalResponse, signalResponse)
title('signal response'); grid

%% Saving all figures -----
saveas(figure(1), 'MSDSystem_eg1_step.jpg')
saveas(figure(2), 'MSDSystem_eg1_impulse.jpg')
saveas(figure(3), 'MSDSystem_eg1_initialConditionResponse.jpg')
saveas(figure(4), 'MSDSystem_eg1_ResponseToSineSignal.jpg')


% *************************** END OF FILE *********************************