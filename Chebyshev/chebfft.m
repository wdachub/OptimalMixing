function u=chebfft(x)
%the coefficient of chebyshev  ak
%u=N*ak
N = length(x)-1; 
x = x(:); 
V = [x; flipud(x(2:N))]; %expand v into V(v0,v1...vn-1,vn,vn-1..v1)
u = real(fft(V));
u=u(1:(N+1));
end
%���ص�U���Ǵ�N��0��ϵ��
