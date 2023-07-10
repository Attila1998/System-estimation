clear all;
close all;
clc;

Ts=0.1;
z=tf('z',0.1);

Hz=(1.5*z^-1)/(1+0.25*z^-1+0.5*z^-2);
t=0:0.1:100;
u=[];
u(1)=10;
for i=2:size(t,2)
    
    u(i)=10;
end;

plot(t,u);
nk=1;
na=2;
nb=1;

y=lsim(Hz,u,t);
figure
plot(t,y);
zaj=randn();
yzaj=y;
dates=iddata(yzaj,u',Ts);
orders=[na,nb,nk];

M=arx(dates,orders)
figure


