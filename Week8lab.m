%% Week 8 lab

s=tf('s') % setting transfer function s
Y= s+10 % Create Y(s)
U=s^2+3*s+10 % Create U(s)
Ps=Y/U %Functions Y(s)/U(s)= Ps

%Find and declare k value
Cs=k*((s+1)/(s+5))

Ls=Cs*Ps


krouth=1

% Define the setpoint
setpoint = 1;
sys_with_controller = feedback(Cs* Ps, 1);

% Simulate the system's response to a step input
time = 0:0.01:30;
step_input = setpoint * ones(size(time));
[y, t] = step(sys_with_controller, time);

% Compute steady-state error
final_output = y(end);
ess = setpoint - final_output;

k
ess

plot(simtime1,simout,simtime1,simin)
xlim([0,30])
ylim([0,1.5])
title('TYPE 0: k=1, E(inf)step=.8333')
legend ('Output','Reference')
grid on

plot(simtime1,simout5,simtime1,simin5)
xlim([0,30])
ylim([0,1.5])
title('TYPE 0: k=5, E(inf)step=.5')
legend ('Output','Reference')
grid on

plot(simtime1,simout15,simtime1,simin15)
xlim([0,30])
ylim([0,1.5])
title('TYPE 0: k=15, E(inf)step=.25')
legend ('Output','Reference')
grid on

plot(simtime1,simout100,simtime1,simin100)
xlim([0,30])
ylim([0,1.5])
title('TYPE 0: k=100, E(inf)step=.0476')
legend ('Output','Reference')
grid on

plot(simtime1,simoutrampzero,simtime1,siminrampzero)
xlim([0,30])
ylim([0,1.5])
title('TYPE 0: k=10, E(inf)step=0')
legend ('Output','Reference')
grid on


plot(simtime1,simoutramp,simtime1,siminramp)
xlim([0,30])
ylim([0,1.5])
title('TYPE 0: k=10, E(inf)step=0')
legend ('Output','Reference')
grid on


plot(simtime1,simoutramp3,simtime1,siminramp3)
xlim([0,20 ...
    ])
ylim([0,10])
title('TYPE 0: k=5, E(inf)step=0')
legend ('Output','Reference')
grid on



