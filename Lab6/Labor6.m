clear;
clc;
close all;
%%%% Labor 6,7. hét Pál-János Attila
s=tf('s');
T=5;
n=8;        %folyamat fokszáma
H=1/(T*s+1)^n
t = 0:0.1:200;
[yp,t]=step(H,t);
plot(t, yp);
hold on;
TauM=20;     %Modell holt ideje
Tm=10;       %Model idö állandója
km=1;       %Modell erösítése
for i=1:length(t)
   ym(i)=km *(1-exp(-(t(i)-TauM)/Tm));
%    if ym(i)<0
%         ym(i)=0;
%    end
   if t(i)<TauM
       ym(i)=0;
   end
end
plot(t, ym, 'r');
legend('folyamaton mért kimenet','modelen számított kimenet(kezdeti paraméterek)');
hiba_temp =(ym-yp').^2;
figure(2);
plot(t,hiba_temp);
hiba = sum(hiba_temp);
tomb=[0; 0; 0; 0];
lepes_Tau=0.01;
lepes_Tm=0.01;
b = waitbar(0,'Please wait');
%%
%Gradiens Számolás
for j=1:500
    waitbar(j/1000,h);
    grTau=0;
    grT=0;
    yst=km;
    for i=1:length(t)
        grTau=grTau+2*(yp(i)-yst*(1-exp(-((t(i)-TauM)/Tm))))*yst*exp(-((t(i)-TauM)/Tm))/Tm;
        grT=grT+2*(yp(i)-yst*(1-exp(-(t(i)-TauM)/Tm)))*yst*exp(-(t(i)-TauM)/Tm)*(t(i)-TauM)/Tm^2;
    end

    TauM=TauM-lepes_Tau*grTau;
    Tm= Tm-lepes_Tm*grT;

    for i=1:length(t)
       ym(i)=km *(1-exp(-(t(i)-TauM)/Tm));
    %    if ym(i)<0
    %         ym(i)=0;
    %    end
       if t(i)<TauM
           ym(i)=0;
       end
    end
    plot(t, ym, '.m');

    hiba_temp =(ym-yp').^2;
    hiba(j+1) = sum(hiba_temp);

end