clear all;
close all;
clc;

%% meres
Ts = 0.01;
Tfinal = 50;
t = 0: Ts : Tfinal;
th = length(t);
alpha = 20;

num = 10;
denum = [1,9];
H = tf(num,denum); %atmenti fugveny

z = randn(size(t))*0.1;  %%zaj

u = zeros(size(t));
u(1) = alpha;

y = lsim(H,u,t)
yz = y + z'; %'-transzponalt

plot(t,yz,'r',t,y,'b.');
legend('zajos kimenet','Zaj nelkuli jel')



%% becsles
hz = yz / alpha; %zajos sulyfugg
h = y / alpha; %zaj nelkuli sulyfugg
figure(2);
plot(t,hz, 'r',t,h,'b.');
legend('Sulyfugg zajjal','Sulyfugveny zaj nelkul');



%%teszteles
uteszt = 24*square(2*pi*0.1*t);
figure(3);
plot(t,uteszt);
legend('teszt bemenet');

yt = lsim(H,uteszt,t)
y1 = conv (uteszt,u)
ylz = conv(uteszt,hz)

figure(4);
subplot(2,1,1)
plot(t,y1(1:th),'.',t,yt,'');
legend('modell kimenete zaj nelkul','mert kimenet');

subplot(2,1,2)
plot(t,yt,'.',t,ylz(1:th));
legend('mert kimenet','zajos model kimenet');
kh = yt-y1(1:th)

figure(5);
plot(t,kh);