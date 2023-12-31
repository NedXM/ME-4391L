%% Andy Vo
%  ME4391L
%  Lab Assignment 2
%  09/06/23
%% Problem 1
% Define constant variables a and b (to be overwritten)
a = 1;
b = 2;
% Define amplitude c and frequency d (in Hz)
c = 3;
d = 4;

%% Problem 2
% Define all variables
a = 2;
b = 3;
c = 0.25;
% Frequency must be converted to rad/s from Hz
d = 1 * 2*pi;
% Call the simulation for a duration of 10 seconds
sim("AVoWk3Prob1and2.slx", 10);
figure();
% Plot the simulation output against the time
plot(out.time, out.sim_out);
% Define legends, labels, title, and grid
legend("Sim Out");
xlabel("Time (s)");
ylabel("Output Amplitude");
title("Problem 1.2.a Simulated Output");
grid on;
ylim([-0.1, 0.5])

%% Problem 3
% Define all variables
a = 2;
b = 3;
c = 0.25;
% Frequency must be converted to rad/s from Hz
d = 1 * 2*pi;
% Call both the post-integration and pre-integration simulations for a duration of 10 seconds
sim("AVoWk3Prob3.slx", 10);
figure();
sim("simbeforeint.slx", 10);
figure();
% Plot the simulation output against the time
plot(out.time, out.sim_out, out.time, sim_out2);
% Define legends, labels, title, and grid
legend("Sim Out", "Sim Out pre-integration");
xlabel("Time (s)");
ylabel("Output Amplitude");
title("Problem 1.2.c Simulated Outputs");
grid on

%% Problem 4

% Call the simulation based on the given ODE for a duration of 20 seconds
sim("AVoWk3Prob4.slx", 20);
figure();
% Plot the output vs time and input vs time graphs
plot(out.time,out.y, 'b-', out.time,out.u, 'g-');

% Define legends, labels, title, and grid
legend("Output, y", "Input, u");
xlabel("Time (s)");
ylabel("Output Amplitude");
title("Problem 1.2.d Simulated Outputs");
grid on