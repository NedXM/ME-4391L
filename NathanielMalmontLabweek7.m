%% Week 7 lab

s=tf('s')
timeconstant=((2.09*10^-5)*8.4)/(0.042*0.042)
k=1/0.042
Ps=k/(s*(s*timeconstant+1))

%%0<kp<8.421 for stable systems

kp=8

Cs=kp/(s+10)


%For H(s) =Y/W
Hs1=Ps/(1+Cs*Ps)

%For H(s)=Y/Z
Hs2=(1/(1+Cs*Ps))

%For H(s)=Y/V
Hs3=(-Cs*Ps/(1+Cs*Ps))

subplot(1,3,1)
impulseplot(Hs1,5)
title('H(s) = Y/W')
subplot(1,3,2)
impulseplot(Hs2,5)
title('H(s) = Y/Z')
subplot(1,3,3)
impulseplot(Hs3,5)
title('H(s) = Y/V')

