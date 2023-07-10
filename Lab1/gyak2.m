close all;
clear all;
clc
m = menu('feladat','Uniform','Normal','Hazi');

if m == 1
   
    t = -3:0.01:3;
    x = rand (size (t))
    subplot(4,1,1)
    plot(t,x);
    a= -5;
    b=  7;
    x2=(b-a)*x+a;
    subplot(4,1,2)
    plot(x2,t);
    m1 = mean(x);
    m2 = (min(x)+max(x))/2;
    
    sz1=std(x);
    sz2=sqrt(((max(x)-min(x)^2))/12);
    
    m3 = mean(x2);
    m4 = (min(x2)+max(x2))/2;
    
    sz3=std(x2);
    sz4=sqrt(((max(x2)-min(x2)^2))/12);
    
    hist(x);
    
    px = unifpdf(x,0,1)
    subplot(4,1,3)
    plot(x,px);
    
    pc = unifcdf(x,a,b)
    subplot(4,1,4)
    plot(x,pc);
    
end    

if m == 2
    
    t = -3:0.01:3;
    x = randn (size (t))
    subplot(4,1,1);
    plot (t,x,'.');
    
    nu = 2;
    szigma = 3;
    y = szigma.*x+nu;
    subplot(4,1,2);
    plot(t,y,'.');
    
    m1 = mean(x);
    m2 = (min(x)+max(x))/2;
    
    sz1=std(x);
    sz2=sqrt(((max(x)-min(x)^2))/12);
    
    m3 = mean(y);
    m4 = (min(y)+max(y))/2;
    
    sz3=std(y);
    sz4=sqrt(((max(y)-min(y)^2))/12);
    hist(x);
    
    px = normpdf(y,0,1)
    subplot(4,1,3)
    plot(y,px,'.');
    
    pc = normcdf(y,0,1)
    subplot(4,1,4)
    plot(y,pc,'.');
end

if m == 3
    t=-5:0.01:10;
    x = randn (size (t))
    plot (t,x,'.');
    y1 = x.*1+0;
    y2 = x.*1+2;
    y3 = x.*0.8+2;
    y4 = x.*1.5+2;
    
    z1 = normpdf( y1, 0, 1);
    z2 = normpdf( y2, 2, 1);
    z3 = normpdf( y3, 2, 0.8);
    z4 = normpdf( y4, 2, 1.5);
    
    figure(2)
    plot(y1,z1,'.');
    hold on;
    plot(y2,z2,'.');
    plot(y3,z3,'.');
    plot(y4,z4,'.');
    
    z5 = normcdf( y1, 0, 1);
    z6 = normcdf( y2, 2, 1);
    z7 = normcdf( y3, 2, 0.8);
    z8 = normcdf( y4, 2, 1.5);
    
    figure(3)
    plot(y1,z5,'.');
    hold on;
    plot(y2,z6,'.');
    plot(y3,z7,'.');
    plot(y4,z8,'.');
    
end