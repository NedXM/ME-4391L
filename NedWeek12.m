

syms s k;
P = 11/(s+2)/(s^2+5*s+25);
C = k*(s+10)/(s+5);
G = C*P;
TFSYSTEM = G/(1+G);
TFSYSTEM1 = G/(1+G);%setting transfer function for a closed looped system
stable = 0; %setting stablity by declaring zero
kincremental = 0.01; %declaring the incremental steps to start at 0.01
while(stable ~= 1)
TFSYSTEM = subs(TFSYSTEM,k,kincremental); %setting new function as a sub of k, kincremental, and the orginal transfer function
[num,den] = numden(TFSYSTEM); %creates a function out of the numerator and deminator of the previous function
poles = solve(den == 0); %solve poles by setting the deniminator to zero
stable = 1;
for i = 1:length(poles) %create a for/if statement to run through and tests the incremental steps to calculate the Kcrit value 
if(real(double(poles(i))) > 0)
stable = 0; %setting stablity by declaring zero IF the real poles calculated are greater than zero (not negative) to test stablity
end
end
kincremental = kincremental + 0.01;
end
fprintf("The critical value of k = %f \n",kincremental);

%% Define system matrix 
clear 
clc
s3=tf('s')
kincremental2=.02
H=(11*kincremental2*(s3 + 10))/(((11*kincremental2*(s3 + 10))/((s3 + 2)*(s3 + 5)*(s3^2 + 5*s3 + 25)) + 1)*(s3 + 2))
% Plot pole-zero map
figure;
subplot(1,2,1);
pzmap(H);
title('Pole-Zero Map');

% Calculate and plot impulse response
t = 0:0.01:5; % Define time vector for impulse response
% Create state-space system
[y, t_step] = impulse(H, t); % Calculate impulse response
subplot(1,2,2);
plot(t_step, y);
title('Impulse Response');
xlabel('Time');
ylabel('Response')

%% Problem 2a
clear 
clc
s4 = tf('s')
ps4=(s4+1.5)/((s4+1)*(s4^2+s4+10))
%case 1
k4=1 
p4=2 
z4=1.1 
cs1 = k4*(s4+z4)/(s4+p4)
Tf3a = ps4*cs1 %transfer function
%plot rootlocus
figure, subplot(1,2,1)
rlocus(Tf3a);
title('Root locus p = 2');
t = 0:0.01:5; % Define time vector for impulse response
% Create state-space system
[y, t_step] = step(Tf3a, t); % Calculate step response
subplot(1,2,2);
plot(t_step, y);
title('Step Response');
xlabel('Time');
ylabel('Response')


k4a=1 
p4a=10 
z4a=1.1 
cs2 = k4a*(s4+z4a)/(s4+p4a)
Tf3b = ps4*cs2 %transfer function
%plot rootlocus
subplot(1,2,1)
rlocus(Tf3b);
title('Root locus p = 10')
[y, t_step] = step(Tf3b, t); % Calculate impulse response
subplot(1,2,2);
plot(t_step, y);
title('Impulse Response');
xlabel('Time');
ylabel('Response')

%%Problem 3
clear 
clc
s4 = tf('s')
ps4=(s4+1.5)/((s4+1)*(s4^2+s4+10))
%case 1
k4=1 
p4=1.1 
z4=2
cs1 = k4*(s4+z4)/(s4+p4)
Tf3a = ps4*cs1 %transfer function
%plot rootlocus
figure, subplot(1,2,1)
rlocus(Tf3a);
title('Root locus z = 2');
t = 0:0.01:5; % Define time vector for step response
% Create state-space system
[y, t_step] = step(Tf3a, t); % Calculate step response
subplot(1,2,2);
plot(t_step, y);
title('Step Response');
xlabel('Time');
ylabel('Response')


k4a=1 
p4a=10 
z4a=1.1 
cs2 = k4a*(s4+z4a)/(s4+p4a)
Tf3b = ps4*cs2 %transfer function
%plot rootlocus
subplot(1,2,1)
rlocus(Tf3b);
title('Root locus z = 10')
[y, t_step] = step(Tf3b, t); % Calculate step response
subplot(1,2,2);
plot(t_step, y);
title('Impulse Response');
xlabel('Time');
ylabel('Response')
