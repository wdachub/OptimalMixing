function T= chebyshev_Tvalue(N, x,type)
%  输入切比雪夫多项式的阶数和类型，还有对应的x
%  输出T_n(x)
%       N       为切比雪夫多项式的阶数
%       type    为切比雪夫多项式的类型
%       p       为切比雪夫多项式的系数（N+1 阶列向量）
%       T       为切比雪夫多项式的系数（N+1 * N+1 阶矩阵，p = T(:,N+1)）
%       x       为需要输入的函数值x
% 即其中 p(1)*x^N + p(2)*x^(N-1) + ... + p(N)*x + p(N+1)

    % 判断阶数是否正确
    if N < 0
        error('请正确输入切比雪夫多项式的阶数！（N >= 0）');
    elseif N == 0
        T= ones(1,length(x));
        return;
    end
    
    P = zeros(N+1);
    % 根据选择的类型设置不同的基函数
    if type == 1
        P(N+1, 1) = 1;
        P(N, 2) = 1;
    elseif type == 2
        P(N+1, 1) = 1;
        P(N, 2) = 2;
    else
        error('请输入正确的切比雪夫类型！（1 或 2）');
    end
    
    % 迭代生成 N 阶切比雪夫多项式系数
    for k = 3 : N+1
        a = P(:, k-2);
        b = P(:, k-1);
        P(:, k) = 2 * circshift(b,-1) - a;
    end
    p = P(:,N+1);
    T=polyval(p,x);
end