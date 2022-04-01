% *************************************************************************
% By        : Jabed-Akhtar (github)
% date      : 01.04.2022
% *************************************************************************
% file      : PIDController_eg1.m
% brief     :
% *************************************************************************
% script (this) related infos:
%   - a source used within this script: https://youtu.be/lfMMPe7s9nU
%   - evicences/pics can be found at location: '../docs_images__/PIDController_eg1_***.png'
% *************************************************************************
% Descriptions:
%   - ---
% *************************************************************************

clc; clear; close all;

%% Variables --------------------------------------------------------------
H = [1]; % feedback

%% Transfer function of Plant ---------------------------------------------
num = [1];
den = [1 3 1];

Gp = tf(num, den) % transfer-function of plant

%% Closed-loop tf with No controller  -------------------------------------
M_noController = feedback(Gp, H)

%% Defining PID Controller ----------------------------------
Kp = 1;
Ki = 0;
Kd = 0;

Gc = pid(Kp, Ki, Kd);

%% Closed-loop tf with Controller  ----------------------------------------
M_withController = feedback(Gc*Gp, H)

%% Step response ----------------------------------------------------------
figure(1)
step(M_noController)
hold on; grid;
step(M_withController, 'xr')
legend('step-response with no Controller', 'step-response with PID Controller - P1I0D1','Location','southeast')

%% Plotting Step responses with varoius PID variables ---------------------
Kp = [1 5 10 20 24];
Ki = [0 0 0 1 1];
Kd = [0 2 6 7 8];
figure(2)
title('step-response with PID Controller')
hold on; grid;
for n=1:5
    Gc = pid(Kp(n), Ki(n), Kd(n));
    M_withController = feedback(Gc*Gp, H);
    step(M_withController)
    legend('P1I0D1', 'P5I0D2', 'P10I0D6', 'P20I1D7', 'P24I1D8', 'Location', 'southeast')
end

%% Step response ----------------------------------------------------------
figure(3)
impulse(M_noController)
hold on; grid;
xlim([0 6])
impulse(M_withController)
legend('impulse-response with no Controller', 'impulse-response with PID Controller - P1I0D1','Location','northeast')

%% Plotting Step responses with varoius PID variables ---------------------
Kp = [1 5 10 20 24];
Ki = [0 0 0 1 1];
Kd = [0 2 6 7 8];
figure(4)
title('impulse-response with PID Controller')
hold on; grid;
xlim([0 6])
for n=1:5
    Gc = pid(Kp(n), Ki(n), Kd(n));
    M_withController = feedback(Gc*Gp, H);
    impulse(M_withController)
    legend('P1I0D1', 'P5I0D2', 'P10I0D6', 'P20I1D7', 'P24I1D8', 'Location', 'northeast')
end

%% Saving all figures -----
saveas(figure(1), 'PIDController_eg1_step_withoutNWithController.png')
saveas(figure(2), 'PIDController_eg1_step_withVariousPIDVariables.png')
saveas(figure(3), 'PIDController_eg1_impulse_withoutNWithController.png')
saveas(figure(4), 'PIDController_eg1_impulse_withVariousPIDVariables.png')


% *************************** END OF FILE *********************************