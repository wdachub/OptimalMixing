addpath('../');
figure(1);
N=10;
theta=(0:N)'*pi/N;
xp=cos(theta);%chebyshev nodes xp
%funrho=@(x)2*x.^2-x+x.^4;
xtest=-1:0.01:1;
funrho=@(x)cos(x);
yp=funrho(xp);%chebshev nodes yp
yreal=funrho(xtest);
plot(xp,yp,'r*')%plot the point used for interpolation
hold on
plot(xtest,yreal,'b')%plot the real function
hold on
u=chebfft(yp);

unormalize=u/N;
unormalize(1)=unormalize(1)/2;%the coefficient of constant should be halved
chebpoly=zeros(length(xtest),N+1);
for k=0:N
    %evaluate the chebyshev polynomial at the xtest point
    %k is the degree
    temp=chebyshev_Tvalue(k,xtest,1);
    chebpoly(:,k+1)=temp';
end
Y=chebpoly*unormalize;
plot(xtest,Y,'r')%polt the chebyshev polynomial series. 
%hold off
figure(2)
plot(xtest,yreal-Y','r')%plot the error of interpolation
title('error')

