%28 tétel
clear all;
close all;
clc;

%% 1-es feladat

Ts=0.1;
z=tf('z',0.1);

Hz=(12*z^-3)/(10-0.5*z^-1+6.4*z^-2);
%kelelt volna osztani 10-el
t=0:0.1:100;
u=[];
u(1)=4;
for i=2:size(t,2)
    u(i)=4;
end;

plot(t,u);
nk=3;
na=2;
nb=1;

y=lsim(Hz,u,t);

figure(1)
plot(t,y);
zaj=randn();
yzaj=y;
dates=iddata(yzaj,u',Ts);
orders=[na,nb,nk];

M=arx(dates,orders)
%figure(2)%felesleges

