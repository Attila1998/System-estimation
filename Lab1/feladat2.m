clear all;
close all;
clc;
Ts=0.01;
H=tf(8, [1 0.8 0], Ts)
H.variable='z^-1'
t=0:Ts:6;
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