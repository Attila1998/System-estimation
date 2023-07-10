function s2=InterPol(f,x,gr,s0,h)
%% intervallum kereses
i=0;
MaxIter = 1000;

while i<MaxIter
   i=i+1;
   if f(x-(i-1)*s0*gr)<f(x-(i)*s0*gr)
    break;
   end
    
end
if i<3
    a=(i-1)*s0
else
    a=(i-2)*s0
end
b = i*s0;
sH = a;
sL = b;

%% Interpoláció
M = [sL^3 sL^2 sL 1;
     sH^3 sH^2 sH 1;
     3*sL^2 2*sL s 0;
     3*sH^2 2*sH 1 0];
 
 E = [ f(x-sL*gr);
       f(x-sH*gr);
       (f(x-(sL+h)*gr)-f(x-sL*gr))/h;
       (f(x-(sH+h)*gr)-f(x-sH*gr))/h];
   
A = inv(M)*E;

a3 = A(1);
a2 = A(2);
a1 = A(3);

s = abs(roots([3*a3 2*a2 a1]));

if f(x0-s(1)*gr) < f(x0-s(2)*gr)
    Sopt = s(1);
else
    Sopt = s(2);
end
end
