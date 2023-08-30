%% Nathaniel Malmont
%% ME 4391L 
%% Lab Assignment 1


%% Problem 1
%%Begin a new script and start a new code cell for Problem 1 by using %%. Use rand to create an 8 × 7%% matrix A of random numbers in the range [0, 1]

 A = rand(8,7);

%% i

A([3, 6], :) = 2;

%% ii
A(:, 2:5) = 3;

%% iii
A(1:2:7, 2:2:8)=0.5;

%% iv
for ia=1:size(A,1)
    for ja=1:size(A,2)

    if A(ia,ja)<0.5
        A(ia,ja)=0;
    end
end
end

%% Problem 2
t2=0:0.01:2*3.14;
f=(sin(5*t2))/4;
g=cos(10*t2).*exp(-1*t2)

plot(t2,f);
hold on
plot (t2,g)
xlabel('Time (s)');
ylabel('f(t), g(t)');
title('Plot of f(t) and g(t)');
grid on
legend('f(t)','g(t)')

%% Problem 3
s3=tf('s')
p3=10/(s3^2+3*s3+10)
disp('p3')

[y3,t3]=impulse(p3);
plot(t3,y3)
xlabel('Time (s)');
ylabel('Amplitude');
title('Impluse of Transfer Function 3');
grid on

%% Problem 4
s4=tf('s')
p4=10/(s4^2+3*s4+10)
disp('p4')

[y4,t4]=step(p4);
plot(t4,y4)
xlabel('Time (s)');
ylabel('Amplitude');
title('Step of Transfer Function 4');
grid on

%% Problem 5
s5=tf('s')
p5=10/(s5^2+3*s5+10)
t5=[0:0.1:5]
u5=exp(-1*t5)
[y5,t5_out]=lsim(p5,u5,t5);
plot(t5_out,y5)
xlabel('Time (s)');
ylabel('Amplitude');
title('Exponential response of Transfer Function 5');
grid on

%% Problem 6
s6=tf('s')
p6=10/(s6^2+3*s6+10)
t6=[0:0.1:5]
u6=sin(t6)
[y6,t6_out]=lsim(p6,u6,t6);


% Top right plot 
tiledlayout(2,2);
nexttile
plot(t3,y3)
xlabel('Time (s)');
ylabel('Amplitude');
title('Impluse of Transfer Function 3');
grid on

hold on

% Top Left plot
nexttile
plot(t4,y4)
xlabel('Time (s)');
ylabel('Amplitude');
title('Step of Transfer Function 4');
grid on

hold on

nexttile
plot(t5_out,y5)
xlabel('Time (s)');
ylabel('Amplitude');
title('Exponential response of Transfer Function 5');
grid on

hold on
nexttile
plot(t6_out,y6)
xlabel('Time (s)');
ylabel('Amplitude');
title('Exponential response of Transfer Function 5');
grid on;