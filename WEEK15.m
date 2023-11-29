%%Problem 1

s = tf('s')
P= (s+12.1)/((s^2 + 2*s + 51.54) * (s^2 + 2.25*s + 5.75)) %Delcare the plant
w= [.1 .5 1 2 3 4 5 6 7 8 9 10] % declare modulus range as an array
mag = zeros(1,length(w));
t = 0:0.01:1000; % set a time variable betweem 0 and 1000 in intervals of .01

for i = 1:length(w) % beginning of For loop to run through all possible moduluses and known time invervals
u = sin(w(i)*t); %Input Signal 
y = lsim(P,u,t); %System Output
mag(i) = max(abs(y)); %steady state response stored as mag(i) (magnitude vector)
end

om = logspace(-2, 2, 100); % Define frequency vector
[bode_mag, pha] = bode(P,om); % Produce Bode magnitudes
loglog(om, squeeze(bode_mag)); % Display Bode magnitude plot
hold on
scatter(w,mag, 'r', 'filled')
hold off
xlim([0,100])
ylim([10*exp(-6),10*exp(-1)])
title('BODE magnitude plot for P(s)')
legend ('True Bode Plot','Simulated Magnitude Data')
grid on

%% Problem 2
h = bodeplot(P);
setoptions(h,'MagUnits', 'abs', 'Magscale', 'log');
grid
set(gcf,'PaperUnits','centimeters','position', [125 350, 1100, 450])
subplot(121)
h = bodeplot(P);
setoptions(h,'MagUnits', 'abs', 'Magscale', 'log');
grid
subplot(122)
nyquist(P)

%% Problem 3
numerator = [0, 1, 1]; % Example numerator coefficients
denominator = [1, -3, 2]; % Example denominator coefficients
open_loop_sys = tf(numerator, denominator); % Define open-loop transfer function
k_values = linspace(0, 1, 1000); % Adjust the range as needed

% Initialize an array to store stability results for each k value
stability_results = zeros(size(k_values));

% Iterate through each k value and check stability using Routh-Hurwitz criterion
for i = 1:length(k_values)
    % Create the closed-loop transfer function with varying gain k
    closed_loop_sys = feedback(k_values(i) * open_loop_sys, 1);
    
    % Extract the denominator coefficients of the closed-loop system
    closed_loop_denominator = cell2mat(closed_loop_sys.den);
    
    % Check the Routh-Hurwitz criterion for stability
    stability_results(i) = all(real(roots(closed_loop_denominator)) < 0);
end

% Find the range of k values that guarantee stability
stable_k_values = k_values(stability_results == 1);
min_stable_k = min(stable_k_values);
max_stable_k = max(stable_k_values);

%% Problem 3b
s=tf('s');
syms k
G = (s+1)/((s-1)*(s-2));
figure (1)
k=4; %Inside the stable range
subplot(2,2,1)
nyquist (k*G)
title('Open-loop Nyquist plot (k=4)');
subplot(2,2,2)
bode(k*G)
title('Open loop Bode plot');
subplot(2,2,3)
T=feedback(k*G,1); %Closed loop t.f.
impulse(T)
title('Closed loop impulse response');
subplot(2,2,4)
pzplot(T)
xlim([-3 3]);
ylim([-3 3]);
title('Closed-loop pole/zero map');

k=2; %outside the stable range
figure (2)
subplot(2,2,1)
nyquist (k*G)
title('Open-loop Nyquist plot (k=2)');
subplot(2,2,2)
bode(k*G)
title('Open loop Bode plot');
subplot(2,2,3)
T=feedback(k*G,1); %Closed loop t.f.
impulse(T)
title('Closed loop impulse response');
subplot(2,2,4)
pzplot(T)
xlim([-3 3]);
ylim([-3 3]);
title('Closed-loop pole/zero map')

