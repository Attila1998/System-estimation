clear all;
close all;
clc;

t=0:0.01:100;
szoras=0.9;
atlag=5;

x=randn(size(t)); % normal eloszlasu jel , szoras: 1, atlagertek 0
y=szoras*x+atlag;

plot(t,y);
figure;
 normal=normpdf(y,atlag,szoras);
 subplot(2,1,1);
 plot(y,normal, '.');
 title('Valószínûség sûrûség-függvény')
 normalcdf=normcdf(y,atlag,szoras);
 subplot(2,1,2);
 plot(y,normalcdf, '.');
 title('Eloszlasfuggveny')
 
 t2=0:0.1:200;
 sajkor=xcorr(y,y);
 figure
 plot(sajkor);
 