function u=chebifft(x)
%get the coefficient of chebyshev interpolation
N = length(x)-1; 
x = x(:); V = [x; flipud(x(2:N))]; % transform x -> theta
u = real(ifft(V));
u=u(1:(N+1));
end
