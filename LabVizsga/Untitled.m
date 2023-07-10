%% 2-es feladat
clear all;
close all;
clc

Ts = 0.1;
z = tf('z',Ts);
H = 3*z/(1-2*z^2+1.9*z-0.8*z^3);

t = 0:Ts:10;
u = 5*(square(t));

y = lsim(H, u, t);
e = randn(size(t)) * 0.1;

yz = y + e';
figure(1);
subplot(2, 1, 1);
plot(t, y);
subplot(2, 1, 2);
plot(t, yz, 'r');

%% becsles
na = 1;      %
nb = 0 + 1;  %
nk = 2;      %
dates = iddata(yz, u', Ts);
orders = [na nb nk];
M = arx(dates, orders);

%% teszteles
ut = sin(t);
yt = lsim(H, ut, t);
ybecsult = sim(M, ut');
H2 = (1.755  * z^(-2))/(1 + 0.3197 * z^(-1));
yt2 = lsim(H2, ut, t);

figure(2);
plot(t, yt, '*g', t, ybecsult, 'r', t, yt2, 'k');