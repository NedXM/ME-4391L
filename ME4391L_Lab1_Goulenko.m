%% Problem 1
A=rand(8,7);
A([3,6],:)=2;
A(:,[2:1:5])=3;
A([1:2:end],[2:2:end])=0.5;

for x=1:8
    for y=1:7

       if A(x,y)<0.5
           A(x,y)=0;
       end
    end
end

%% Problem  2
t=0:0.01:2*pi;
f=(sin(5*t))/4;
g=exp(-1*t).*cos(10*t);

plot (t, f);

hold on;

plot (t, g);

xlim([0 6]);

ylim([-1 1])

title ('Plots of f(t) and g(t)')

xlabel('Time (s)')

ylabel('f(t), g(t)')

legend( 'f(t)', 'g(t)');

grid on;

%% Problem 3

% Create a transfer function model for the variable "s3"

s3 = tf('s');

p3 = 10/(s3^2 + 3*s3 + 10);

disp(p3);

% Compute impulse response

[y, tout] = impulse (p3, 5);

% Plot impulse response

plot (t,y);

% This line corresponds to Problem 6 subplot
subplot(2,2,1)
plot (t,y);
title('Impulse response of P(s)');
% Add title, label on axes, and gridlines

title('Impulse response of P(s)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

%% Problem 4

% Create transfer funtion
s4= tf('s')
p4= 10/(s4^2+3*s4+10)

% Compute step response 

[y, tout]= step(p4,5)

% Plot the step response

plot(t,y);

% This line corresponds to Problem 6 subplot
subplot(2,2,2)
plot (t,y);
title('Step response of P(s)');


% Add title, label on axes, and gridlines

title('Step response of P(s)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

%% Problem 5

% Create transfer function

s5 = tf('s');
p5= 10/(s5^2+3*s5+10);

% Define input and time range variables

u1= exp(-t);
t= 0:0.01:5;

% Compute simulated time response

[y,t_out]=lsim(p5,u1,t);

% Plot exponential response 
plot(t,y);

% This line corresponds to Problem 6 subplot
subplot(2,2,3)
plot (t,y);
title('Exponential response of P(s)');


% Add title, label on axes, and gridlines

title('Exponential response of P(s)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

%% Problem 6

% Create transfer function

s6= tf('s')
p6= 10/(s6^2+3*s6+10);

% Define input and time range variables

u2= sin(t);
t= 0:0.01:5;

% Compute simulated time response

[y,t_out]=lsim(p6,u2,t);

% Plot exponential response 
plot(t,y);

% This line corresponds to Problem 6 subplot
subplot(2,2,4)
plot (t,y);
title('Sinusoidal response of P(s)');

% Add title, label on axes, and gridlines

title('Sinusoidal response of P(s)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;