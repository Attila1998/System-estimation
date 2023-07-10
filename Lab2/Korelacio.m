close all;
clear all;
clc

t = 0:0.001:10
ts = -10:0.001:10

m = menu('Korelácio','I','II','II');

if(m == 1)

    x = 5* sin (2*pi*0.5*t)
    y = 2* exp(-2*t) + 8
    z = 5* sin (2*pi*0.5*t+2)

    figure (1)
    subplot(3,1,1)
    plot(t,x);
    grid on;

    subplot(3,1,2)
    plot(t,y);
    grid on;

    subplot(3,1,3)
    plot(t,z);
    grid on;


    figure (2)

    subplot(4,1,1)
    z1 = xcorr(x,x)
    plot(ts,z1)
    grid on;

    subplot(4,1,2)
    z2 = xcorr(y,y)
    plot(ts,z2)
    grid on;

    subplot(4,1,3)
    z3 = xcorr(x,y)
    plot(ts,z3)
    grid on;

    subplot(4,1,4)
    z3 = xcorr(y,x)
    plot(ts,z3)
    grid on;
    
    figure(3)
    z4 = xcorr(x,x)
    grid on;
    plot(ts,z4)
    hold on;
    z5 = xcorr(x,z)
    grid on;
    plot(ts,z5)
    hold on;
    z6 = xcorr(z,x)
    grid on;
    plot(ts,z6)
end

if (m == 2)
    
   x = rand(size(t))
   u1 = x*2-1;
   u2 = x.*2+1.2;
    
    figure (1)
    subplot(2,1,1)
    plot(t,u1);
    grid on;
    
    subplot(2,1,2)
    plot(t,u2);
    grid on;
    
    figure(2)
    subplot(3,1,1)
    z1 = xcorr(u1,u1)
    plot(ts,z1)
    grid on;
    
    subplot(3,1,2)
    z2 = xcorr(u1,u2)
    plot(ts,z2)
    grid on;

    
    subplot(3,1,3)
    z3 = xcorr(u2,u1)
    plot(ts,z3)
    grid on;

end

if (m == 3)
    
    
    
end