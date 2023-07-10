%28 tétel
clear all;
close all;
clc;

%% 2-es feladat:
Ts=0.1;
z=tf('z',Ts);


load gr15.mat;

plot(t,y, t, u);
hold on


L=u(end); %bement amplitudo
ystac=y(end); %kimenet stac pont ahol beall

k=ystac/L; %er?sítés
p=find(u~=0) %megtalálja hol változik a bemeneti jel
t1=t(p(1)) %változás id?pillanata

p=find(y~=0)
t2=t(p(1))
plot(t2, y(p(1)), '*r')
hold on


p=find(y>=0.63*ystac)  % 63% számítása

t3=t(p(1)); %mikor érte el a 63%
plot(t3,y(p(1)), '*y');

T=t3-t2; %it? állandó (amikor elérte a stac a kezdett változni)
tau=t2-t1; %holtid?

s=tf('s');
H=k/(T*s+1)*exp(-tau*s);


%% Teszteles
ybecsult=lsim(H,u, t);
figure (3)
plot(t,y, 'r', t,ybecsult, 'g');
legend('Mert kimenet', 'Becsult kimenet')

