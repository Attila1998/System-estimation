clear all;
close all;
clc;
t=0:0.01:1;
H=tf([3 4],[1 0 5]);
figure(1);
subplot(3,1,1);
[y,t]=step(H);
plot(t,y);
subplot(3,1,2);
[y1,t]=impulse(H);
plot(t,y1);
subplot(3,1,3);
u=square(0.1*t)
[y3,t]=lsim(H,u,t);
plot(t,y3);