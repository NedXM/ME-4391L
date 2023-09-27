%% Problem 2
w=47.619-47.619*exp(-8.3652*time)
subplot(1,2,1)
plot(time,w)

subplot(1,2,2)
yyaxis left 
plot(time,Speed)

yyaxis right
plot(time,Voltage)
ylim([0,4])
xlim([0,10])
