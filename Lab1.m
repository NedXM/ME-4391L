%% Andy Vo
%% ME4391L
%% Lab Assignment 1
%% Problem 1
% Create a Random 8x7 Matrix in the range [0,1]
A = rand(8,7);
% Replace Rows 3 and 6 of A with two
A([3, 6], :) = 2;
% Replace Columns 2 through 5 of A to three
A(:, 2:5) = 3;
% Change elements of A that are in odd number rows and even columns to 0.5
A(1:2:7, 2:2:8) = 0.5;
% Use for loops and if statements to change all elements in A that are less
% than 0.5 to zero
for i = 1:size(A, 1)
    for j = 1:size(A, 2)
        if A(i, j) < 0.5
            A(i, j) = 0
        end
    end
end
%% Problem 2
% Create an array t ranging from 0 to 2pi in increments of 0.01
t = 0:0.01:2*pi;
% Define functions
f = sin(5*t)/4;
g = exp(-t).*cos(10*t);

% Plot both functions on the same graph
figure
plot(t, f, t, g);
% Limit the range of the X-axis to be from 0 to 6 and the Y-axis to be from -1 to 1
xlim([0,6]);
ylim([-1,1]);
% Show the gridlines on the graph
grid on;
% Add title, legend, axes, and label
title('Plots of f(t) and g(t)');
legend('f(t)', 'g(t)');
ylabel('f(t), g(t)');
xlabel('Time (s)')

%% Problem 3
% Define the Transfer Function
s3 = tf('s');
p3 = 10/(s3^2 + 3*s3 + 10);
disp(p3);
% Store the data of the transfer function's impulse response for 5 seconds using Left-hand
% arguments
[y, t] = impulse(p3, 5);
% Define the 2x2 matrix subplot and position (Top left)
subplot(2,2,1)
% Plot the graph of the impulse response
plot(t, y);
% Show the gridlines on the graph
grid on;
% Add title, labels, and axes
title('Impulse response of P(s)');
xlabel('Time (s)');
ylabel('Amplitude')

%% Problem 4
% Define the Transfer Function
s4 = tf('s');
p4 = 10/(s4^2 + 3*s4 + 10);
disp(p4);
% Store the data of the transfer function's step response for 5 seconds using Left-hand
% arguments
[y, t] = step(p4, 5);
% Define the 2x2 matrix subplot and position (Top right)
subplot(2,2,2)
% Plot the graph of the step response
plot(t, y);
% Show the gridlines on the graph
grid on;
% Add title, labels, and axes
title('Step response of P(s)');
xlabel('Time (s)');
ylabel('Amplitude')

%% Problem 5
% Define the Transfer Function
s5 = tf('s');
p5 = 10/(s5^2 + 3*s5 + 10);
disp(p5);
% Set the duration of the simulation
t = [0:0.1:5];
% Define the function the response will be subject to
u = exp(-t);
% use the lsim function to store the data to be plotted
[y, t_out]=lsim(p5, u, t)
% Define the 2x2 matrix subplot and position (Bottom left)
subplot(2,2,3)
% Plot the graph of the exponential response
plot(t, y);
% Show the gridlines on the graph
grid on;
% Add title, labels, and axes
title('Exponential Response of P(s)');
xlabel('Time (s)');
ylabel('Amplitude')

%% Problem 6
% Define the Transfer Function
s6 = tf('s');
p6 = 10/(s6^2 + 3*s6 + 10);
disp(p6);
% Set the duration of the simulation
t = [0:0.1:5];
% Define the function the response will be subject to
u = sin(t);
% use the lsim function to store the data to be plotted
[y, t_out]=lsim(p6, u, t)
% Define the 2x2 matrix subplot and position (Bottom right)
subplot(2,2,4)
% Plot the graph of the sinusoidal response
plot(t, y);
% Show the gridlines on the graph
grid on;
% Add title, labels, and axes
title('Sinusoidal Response of P(s)');
xlabel('Time (s)');
ylabel('Amplitude');

