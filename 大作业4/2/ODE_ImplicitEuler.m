function [T,X,dX] = ODE_ImplicitEuler( Hfun,t,h,x0 )
% [T,X,dX] = ODE_ImplicitEuler( Hfun,t,h,x0 ) ��ʽŷ������ⳣ΢�ַ���
% HfunΪ����һ��΢�ַ��̵����ĺ����������ʽΪ dX = Hfun( t,X )
% tΪʱ��ڵ㣬��Ϊ������ʱ�䷶ΧΪ T = 0:h:t
%             ��2���� ��ʱ�䷶ΧΪ T = t(1):h:t(2)
%             ���� ��ʱ�䷶ΧΪ T = t
% hΪʱ�䲽������t��ǰ��������£��������h����ֵ
% ֱ�Ӹ���ʱ��ڵ�tʱ��h����[]������ֵռλ
% x0Ϊ״̬����ʼֵ
% �㷨��
%      ʹ��fzero���������ʽ΢�ַ���  X(k) = X(k-1) + h*dX(k)
% By ZFS@wust  2021
% ��ȡ����Matlab/Simulinkԭ�����Ϻͳ������ע΢�Ź��ںţ�Matlab Fans


if nargin < 4
    error('��ʼֵ�������');
end  

% ȷ��ʱ��ڵ�
n = length(t);
if n == 1
    T = 0:h:t;
elseif n == 2
    T = t(1):h:t(2);
else
    T = t;
end
T = T(:);    % ʱ���Ϊ������

% ����
N = length(T);
x0 = x0(:);  x0 = x0';     % ��ֵ��Ϊ������  
m = length(x0);            % ״̬��ά��
X = zeros(N,m);            % ��ʼ��״̬��
dX = zeros(N,m);           % ״̬����
X(1,:) = x0;
for k = 2:N
    h = T(k) - T(k-1);
    for jj = 1:m
       Ind =  zeros(1,m);         % ״̬ѡ������
       Ind(jj) = 1;        % ѡ�������λ��  
       fh = @(x) h*Ind*Hfun(T(k),[X(k-1,1:jj-1)';x; X(k-1,jj+1:m)']) + X(k-1,jj)' - x;    
       X(k,jj) = fzero( fh,X(k-1,jj) ) ;   
    end                  
end
dX(N,:) = Hfun( T(N),X(N,:) );

if nargout == 0
    plot(T,X)
end

     


