function u=chebfft2(x)
%the coefficient of chebyshev interpolation ak
%u=N*M*ak
N = size(x,1)-1;
M=size(x,2)-1;
V = [x; flipud(x(2:N,:))];                                                                                                                                                                   
V = [V fliplr(V(:,2:M))];

% V=[x, zeros(M+1,N-1); zeros(M-1,N+1),rot90(x(2:N,2:M),2)];
u = real(fft2(V));
u=u(1:(N+1),1:(M+1));
end
