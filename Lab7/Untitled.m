celar all;
close all;
clc

%% meres
Ts = 0.1;
z = tf('z'.Ts);
H = 2/(z^2 + 0.52*z + 0.3);

t = 0:Ts:10;
u = square(0.8*t);

y = lsim(H,u,t);
e = randn(size(t)) *0.5;

yz = y + e';
subplot(2,1,1);
plot(t,y);
subplot(2,1,2);
plot(t ,yz, 'r');

%% becsles

na = 2;
mb = 0+1;
nk = 2;
dates = iddata(yz,u',Ts);
orders = [na nb nk];
M = arx(dates,orders);

%% teszteles

ut = sin(t);
yt = lsim(H,ut,t);
ybecsult = sim(M,ut');

figure(2);
plot(t,yt,'*g',t,ybecsult,'r');