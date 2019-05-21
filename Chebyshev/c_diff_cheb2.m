function b=c_diff_cheb2(v,xy)
%{
calculate the coefficient of  partial derivative amn.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
INPUT:
[a]
the coefficient of 2D chebyshev interpolation coefficient. the result of
fft2.
[xy]
'x' calculate the partial derivative rwt x
'y' calculate the partial derivative rwt y

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
OUTPUT:
[b]
coefficient after doing partial y of the polynomial. The format is
consistent with the format of fft2 in matlab
%}
if xy=='x'
    N=size(v,1)-1;
    b=zeros(size(v));
    b(:,end-1)=2*N*v(:,end);
    for ind=N-1:-1:1
        m=ind-1;
        b(:,ind)=(b(:,ind+2)+2*(m+1)*v(:,ind+1));
    end
    
elseif xy=='y'
    
    %     b=c_diff_cheb2(a','x');
    %     b=b';
    
    M=size(v,2)-1;
    b=zeros(size(v));
    b(end-1,:)=2*M*v(end,:);
    for ind=M-1:-1:1
        m=ind-1;
        b(ind,:)=(b(ind+2,:)+2*(m+1)*v(ind+1,:));
    end
    
end


end

