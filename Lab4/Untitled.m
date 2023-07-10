clear all;
close all;
clc;

s = tf('s');
Hs = 8/(10*s+14);

    %%meres
t = 0:0.1:10;
u = randn(size(t));
y = lsim(Hs,u,t);

yz = y+0;

subplot(2,1,1);
plot(t,u,'r');
legend("Bemenet");
grid on;

subplot(2,1,2);
plot(t,yz,'b');
legend('kimenet');
grid on;

    %%becsles
luu = xcorr(u,u);
lut = xcorr(y,u);
hossz = length(luu);

vektor = hossz/2+0.5 ;

Fiuu = zeros(vektor,vektor);

for i = 1:vektor
    Fiuu(t,i) = luu(vektor - i+1:hossz-i+1);
end
