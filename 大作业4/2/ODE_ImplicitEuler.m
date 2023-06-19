function [T,X,dX] = ODE_ImplicitEuler( Hfun,t,h,x0 )
% [T,X,dX] = ODE_ImplicitEuler( Hfun,t,h,x0 ) 隐式欧拉法求解常微分方程
% Hfun为描述一阶微分方程导数的函数句柄，格式为 dX = Hfun( t,X )
% t为时间节点，可为标量，时间范围为 T = 0:h:t
%             长2向量 ，时间范围为 T = t(1):h:t(2)
%             向量 ，时间范围为 T = t
% h为时间步长，在t的前两种情况下，必须给出h具体值
% 直接给出时间节点t时，h可用[]或任意值占位
% x0为状态量初始值
% 算法：
%      使用fzero函数求解隐式微分方程  X(k) = X(k-1) + h*dX(k)
% By ZFS@wust  2021
% 获取更多Matlab/Simulink原创资料和程序，清关注微信公众号：Matlab Fans


if nargin < 4
    error('初始值必须给出');
end  

% 确定时间节点
n = length(t);
if n == 1
    T = 0:h:t;
elseif n == 2
    T = t(1):h:t(2);
else
    T = t;
end
T = T(:);    % 时间变为列向量

% 计算
N = length(T);
x0 = x0(:);  x0 = x0';     % 初值变为行向量  
m = length(x0);            % 状态量维数
X = zeros(N,m);            % 初始化状态量
dX = zeros(N,m);           % 状态导数
X(1,:) = x0;
for k = 2:N
    h = T(k) - T(k-1);
    for jj = 1:m
       Ind =  zeros(1,m);         % 状态选择向量
       Ind(jj) = 1;        % 选择的向量位置  
       fh = @(x) h*Ind*Hfun(T(k),[X(k-1,1:jj-1)';x; X(k-1,jj+1:m)']) + X(k-1,jj)' - x;    
       X(k,jj) = fzero( fh,X(k-1,jj) ) ;   
    end                  
end
dX(N,:) = Hfun( T(N),X(N,:) );

if nargout == 0
    plot(T,X)
end

     


