
N=40;
theta=(0:N)'*pi/N;
x=cos(theta);
plot(x,cos(cos(x)))
[tx,ty]=meshgrid(x,x);
v=cos(1*tx).*cos(1*ty);
vx=-sin(1*tx).*cos(1*ty);
vy=-cos(1*tx).*sin(1*ty);
% vp=vp./sqrt(1-cos(tx).^2);
pp=diff_cheb2(v,'x');
err=vx-pp;
max(max(abs(err)))

pp=diff_cheb2(v,'y');
max(max(abs(vy-pp)))
return;
N=40;
theta1=(0:N)'*pi/N;
theta2=(0:N)'*pi/N;
[tx,ty]=meshgrid(theta1,theta2);
v=cos(1*tx).*cos(1*ty);
vx=cos(1*ty);
vy=cos(1*tx);
% vp=vp./sqrt(1-cos(tx).^2);
pp=diff_cheb2(v,'x');
max(max(abs(vx-pp)))

pp=diff_cheb2(v,'y');
max(max(abs(vy-pp)))

return;



%%
N=8;
theta=(0:N)'*pi/N;


v=cos(1*theta)+cos(3*theta)/2;
% v=1+sqrt(theta);
%plot(theta,v,'b')
hold on
u=chebfft(v);

% pp=zeros(size(theta));
% for i=1:length(U)/2
% pp=pp+U(i)*cos((i-1)*theta)/N;  
% end
pp=chebifft(u);
plot(theta,pp,'r')
hold off


