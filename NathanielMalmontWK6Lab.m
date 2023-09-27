%% Problem 2
s3=tf('s')
timeconstant=((2.09*10^-5)*8.4)/(0.042*0.042)
k=1/0.042
p3=k/(s3^2*timeconstant+s3+k)
step(p3,5)
stepinfo(p3,"SettlingTimeThreshold",0.01)

