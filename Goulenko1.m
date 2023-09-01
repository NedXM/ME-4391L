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
g=exp(-1*t).*cos(10*t)