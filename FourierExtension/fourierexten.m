clc
clear all;

n=1001;
P=30;
deg=1;
L=pi;
% L=2;
A=zeros(n,2*P);
% funrho=@(x)(1/4*(2*x.^2+2*x+3)).*x;
% funrho=@(x)(1/4).*(3+2.*x+2.*x.^2).*(1+4.*x.^2.*(1/100).^2).^(1/2);
funrho=@(x)(1/240).*((-109).*26.^(1/2)+(25+x.^2).^(1/2).*(200+93.*x+8.*x.^2+ ...
  6.*x.^3)+(-1425).*asinh((1/5))+(-1425).*asinh((1/5).*x)).*x;
funrho=@(x)2*x.^2-1;
funrho=@(x)(6+x+4*x.^2+4*x.^3)/8;
% funrho=@(x)(3+2*x+2*x.^2)/4;
theta=linspace(0,pi,n);
xp=cos(theta);

for k=1:P
  A(:,k)=cos((k-1)/L*pi*xp)';
  A(:,P+k)=sin(k/L*pi*xp)';
end

b=funrho(xp)';

coef=A\b
norm(coef)
% format long
format1='%16.16f`16\n';
fid = fopen('coef.txt', 'w');
 fprintf(fid,format1,coef);
 fclose(fid);

 
[u,s,v]=svd(A);
bnew=u'*b;
for k=1:2*P,
    if s(k,k)/s(1,1)>1e-13,
        y(k)=bnew(k)/s(k,k);
    else
        y(k)=0;
    end
end
coefnew=v*y';
% coef=coefnew



ntest=201;
xtest=linspace(-L,L,ntest);
ytest=zeros(1,ntest);
for k=1:P,
    ytest=ytest+coef(k)*cos((k-1)*pi/L*xtest)+coef(P+k)*sin(k*pi/L*xtest);
end
%%
a=coef(2:P);
b=coef(P+1:end-1);
cp=a/2-1i*b/2;
cn=conj(cp);
ytest=zeros(1,ntest);
for k=1:P-1
    ytest=ytest+cp(k).*exp(1i*k*xtest*pi/L)+cn(k).*exp(-1i*k*xtest*pi/L);
end
ytest=ytest+coef(1)*cos(0*xtest);

yreal=funrho(xtest);

figure(1)
plot(xtest,yreal,'--k',xtest,ytest,'b')
print(gcf, '-depsc', ['FEx.eps'])
%%
ntest2=501;
xtest2=linspace(-1,1,ntest2);
ytest2=zeros(1,ntest2);
for k=1:P,
    ytest2=ytest2+coef(k)*cos((k-1)*pi/L*xtest2)+coef(P+k)*sin(k*pi/L*xtest2);
end

yreal2=funrho(xtest2);

figure(2) 
plot(xtest2, yreal2-ytest2,'b')
print(gcf, '-depsc', ['FExerr.eps'])