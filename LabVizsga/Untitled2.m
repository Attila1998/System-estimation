close all;
clear all;
clc;

%% meres
load pr4;
figure(1);
subplot(2, 1, 1);
plot(t, u);
title('u');
hold on;

subplot(2, 1, 2);
plot(t, y);
title('y');
hold on;

%% becsles
alpha = u(end);
yst = y(end);
k = yst/ alpha;
p = find(u ~= 0);
t1 = t(p(1));

subplot(2, 1, 1);
plot(t1, u(p(1)), 'r*');

p = find(y ~= 0);
t2 = t(p(1));

subplot(2, 1, 2);
plot(t2, y(p(1)), 'r*');

p = find(y <= 0.63*yst); %stacionarius ertek 65%
t3 = t(p(1));             %idoallando meghatarozasahoz szukseges idopont
plot(t3, y(p(1)), '*k');

T = t3 - t2;           %idoallando
tau = t2 - t1;         %holtido

s = tf('s');
H = k/(T*s + 1) * exp(-tau*s);

%% teszteles
y_becsult = lsim(H, u, t);
figure(2);
plot(t, y, 'g', t, y_becsult, 'r')
legend('mert', 'becsult');

% y_b1 = lsim(H, ut1, tt);
% figure(3);
% plot(tt, yt1, 'g', tt, y_b1, 'r');
% legend('mert kimenet', 'becsult kimenet');
% 
% y_b2 = lsim(H, ut2, tt);
% figure(4);
% plot(tt, yt2, 'g', tt, y_b2, 'r');
% legend('mert kimenet', 'becsult kimenet');


