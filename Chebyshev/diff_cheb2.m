function b=diff_cheb2(v,xy,DN,pf)
%{
calculate the value of  partial derivative amn.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
INPUT:
[v]
the value of function
[xy]
'x' calculate the partial derivative rwt x
'y' calculate the partial derivative rwt y
[N]
order of derivative. default value is 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
OUTPUT:
[b]
value of Nth order derivative
%}
if ~exist('N', 'var'),
    DN =1;
end
if ~exist('pf', 'var'),
    pf ='p';
end
if size(v,1)==1||size(v,2)==1
   Ns=sqrt(numel(v));%if v is long vector, reshape it to square matrix
    v=reshape(v,Ns,Ns); 
    
end


if pf=='p'
v=chebfft2(v);
end

for i=1:DN
if xy=='x'
    v=c_diff_cheb2(v,'x');
elseif xy=='y'
    v=c_diff_cheb2(v,'y');
end
end
N=size(v,1)-1;

b=chebifft2(v);

end

