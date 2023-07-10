clc; clear all; close all;
Ts=0.1;
z=tf('z',Ts);


load gr1.mat;

plot(t,y, t, u);
hold on


L=u(end); 
ystac=y(end);

k=ystac/L;
p=find(u~=0)
t1=t(p(1))
%subplot(2,1,1)
%plot(t, u(p(1)), '*r')


p=find(y~=0)
t2=t(p(1))
%subplot(2,1,2)
plot(t2, y(p(1)), '*r')
hold on


p=find(y>=0.63*ystac)  % 

t3=t(p(1));
plot(t3,y(p(1)), '*y');

T=t3-t2;
tau=t2-t1;

s=tf('s');
H=k/(T*s+1)*exp(-tau*s);


%% Teszteles
ybecsult=lsim(H,u, t);
figure (3)
plot(t,y, 'r', t,ybecsult, 'g');
legend('Mert kimenet', 'Becsult kimenet')

