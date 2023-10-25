s3=tf('s')
timeconstant=((2.09*10^-5)*8.4)/(0.042*0.042)
k=1/0.042
kp=6
system=((kp*k)/timeconstant)/(s3^2+(1/timeconstant)*s3+((kp*k)/timeconstant))
[y1,t1]=step(system,5)
stepinfo(system,"SettlingTimeThreshold",0.01)
ess=2*pi-y1(end)

%%

e_ss = 15-angular_velocity(end);
e_ss = 15-angular_velocity(end);