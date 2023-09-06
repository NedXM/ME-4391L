%% Nathaniel Malmont

%% Lab WK3 Simulink

%% Problem 1
simulink
% Two constant values (WILL BE OVERWRITTEN IN PROBLEM 2)
a1= 10
b1= 5

%sine function
c1= 1; % amplitude
d1= 1; % frequency
initial_condition_1= 0;

%% Problem 2
% Two constant values 
a1= 2
b1= 3
rad=6.283185
%sine function
c1= 0.25; % amplitude
d1= 1*rad; % frequency
initial_condition_1= 0;

sim("WK3_Problem1.slx",10) %BE SURE TO RUN THE SIMLINK BEFORE CODE
figure()
plot(out.time,out.simout) % Plot a Time vs Output Graph

xlabel('Time (s)'); % Label X axis as Time
ylabel('Output Amplitude');% Label Y axis as Output Amplitude
ylim([-0.1,0.5]) % Set the outer limits of the Y Axis to -0.1 and 5
title('Problem 1.2a Simulated Output');
legend('Sim Out')
grid on

%% Problem 3
% Two constant values 
a1= 2
b1= 3
rad=6.283185
%sine function
c1= 0.25; % amplitude
d1= 1*rad; % frequency
initial_condition_1= 0;

sim("WK3_Problem3.slx",10)% BE SURE TO RUN THE SIMLINK BEFORE CODE
figure() 
plot(out.time,out.simout_original, 'b-') % Plot a Time vs Orginal Output Graph
hold on % Allows to plot two lines
plot(out.time,out.simout_prior_to_intergration  , 'r-')% Plot a Time vs Prior Output Graph
xlabel('Time (s)'); % Label X axis as Time
ylabel('Output Amplitude');% Label Y axis as Output Amplitude
title('Problem 1.2c Simulated Outputs');
legend('Sim Out','Sim Out pre-integration')% Set the Legend to appropiete values
grid on

%% Problem 4

% ODE->   Y**=5u*+10u-2y*-12y
sim("WK3_Problem4.slx",20)% BE SURE TO RUN THE SIMLINK BEFORE CODE
figure()
plot(out.time4,out.output_y, 'b-')% Plot a Time vs Output Graph
hold on % Allows to plot two lines
plot(out.time4,out.Input_U, 'g-')% Plot a Time vs Input on the same Graph
xlabel('Time (s)');% Label X axis as Time
ylim([-5,12])% Set the outer limits of the Y Axis to -5 and 12
ylabel('Output Amplitude');% Label Y axis as Output Amplitude
title('Problem 1.2d Simulated Outputs');
legend('Output y','Input u')% Set the Legend to appropiete values
grid on
