clear all;
close all;
clc;
% P�l J�nos-Attila, grafikus identifik�ci�
load adat_3;

figure(1);
subplot(2,1,1)
plot(t,um,'linewidth',3);
%axis([t(1)-1 t(end)+1 um(end)-1 um(1)+1]);
hold on;
grid on;

grid on;
subplot(2,1,2)
plot(t,ym,'linewidth',3);
%axis([t(1)-1 t(end)+1 ym(1)-1 ym(end)+1]);
hold on;
grid on;

%%% becsl�s
L = um(end) %%alfa
yst = ym(end)

k = yst/L
p = find(um~=0);
t1 =t(p(1));
subplot(2,1,1)
plot(t1,um(p(1)),'r*')

p = find(ym~=0);
t2 =t(p(1));
subplot(2,1,2)
plot(t2,ym(p(1)),'g*')

p = find(abs(ym)>=abs(0.63*yst)); %%stac �llapot 63%-a
t3 = t(p(1)) %%id� �lland� meghat�roz�s�hoz szuks�ges idopont
plot(t3,ym(p(1)),'*r');
T = t3-t2 %idoallando
tau = t2-t1 %holtido

s = tf('s'); %% atviteli fugveny
H = k/(T*s + 1) * exp(-tau*s);

%%% adat4 tulloves csillapitasi tenyezo osszefigges
% cst=0:0.01:1;
% szigma=exp(-cst*pi./sqrt(1-cst))*100;
% 
% plot(cst,szigma);

