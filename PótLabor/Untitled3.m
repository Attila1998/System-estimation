%28 tétel
clear all;
close all;
clc;

%% 3-as feladat

  t=0:0.1:1;
    ts=-1:0.1:1;
    
    x= -10*sin(2*pi*0.2*t)+5*cos(2*pi*0.3*t);
    y= (4)./(1+t);
   
    fi_xx=xcorr(x);
    subplot(221)
    plot(ts,fi_xx)
    
    fi_yy=xcorr(y);
    subplot(222)
    plot(ts, fi_yy)
    
    fi_xy=xcorr(x,y);
    subplot(223)
    plot(ts,fi_xy)
    hold on;
  
    fi_yx=xcorr(y,x);
    subplot(223)
    plot(ts,fi_yx)