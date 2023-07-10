%28 t�tel
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

k=ystac/L; %er?s�t�s
p=find(u~=0) %megtal�lja hol v�ltozik a bemeneti jel
t1=t(p(1)) %v�ltoz�s id?pillanata

p=find(y~=0)
t2=t(p(1))
plot(t2, y(p(1)), '*r')
hold on


p=find(y>=0.63*ystac)  % 63% sz�m�t�sa

t3=t(p(1)); %mikor �rte el a 63%
plot(t3,y(p(1)), '*y');

T=t3-t2; %it? �lland� (amikor el�rte a stac a kezdett v�ltozni)
tau=t2-t1; %holtid?

s=tf('s');
H=k/(T*s+1)*exp(-tau*s);


%% Teszteles
ybecsult=lsim(H,u, t);
figure (3)
plot(t,y, 'r', t,ybecsult, 'g');
legend('Mert kimenet', 'Becsult kimenet')

