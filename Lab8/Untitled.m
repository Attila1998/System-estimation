clear all;
close all;
clc;

Ts = 0.1;
t = 0:Ts:40; %mindig 0 indul
u = square(t);
z = tf('z',Ts);

Hz = 1/(z^2+0.2*z-0.15);
zaj = 1*randn(size(t));
y = lsim(Hz,u,t);
yz = y + zaj';
figure(1);
plot(t,u,'.g',t,yz,'r',t,y,'y');
grid on;

%% becslés

s1 = 0;
s2 = 0;

X = [];
Y = [];
for i=3:length(t)
    
    fi = [-y(i-1) -y(i-2) u(i-2)]';
    s1 = fi*fi';
    s2 = s2+fi*y(i);
    
    X = [X; fi'];
    Y = [Y; y(i)];

end
s1
s2
teta = inv(s1)*s2
teta2 = inv(X'*X)*(X'*Y)
%zajos
for i=3:length(t)
    
    fi = [-yz(i-1) -yz(i-2) u(i-2)]';
    s1 = fi*fi';
    s2 = s2+fi*yz(i);
    
    X = [X; fi'];
    Y = [Y; yz(i)];

end
s1
s2
teta = inv(s1)*s2
teta2z = inv(X'*X)*(X'*Y)

%% tesztelés

Hzb = teta(3)/(z^2+teta(1)*z+teta(2));
Hzbz = teta2z(3)/(z^2+teta2z(1)*z+teta2z(2));

ut = sin(t);        %uteszt

ym = lsim(Hz,ut,t); %y mert,a valos rendszeren mert ertek teszt bemenete
yb = lsim(Hzb,u,t); 
ybz = lsim(Hzbz,u,t);
ymt = lsim(Hz,ut,t); 
figure(2);
plot(t,ym,'.r',t,yb,'.k',t,ybz,'.m','linewidth',2);
legend('mert kimenet','becsult kimenet','zajos becsult kimenet');
grid on;
figure(3)
subplot(2,1,1);
plot(t,u)
subplot(2,1,2);
plot(u,ut)
