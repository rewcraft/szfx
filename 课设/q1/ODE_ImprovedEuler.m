function [T,X,dX] = ODE_ImprovedEuler( Hfun,t,h,x0 )
% [T,X,dX] = ODE_ImprovedEuler( Hfun,t,h,x0 ) �Ľ�ŷ������ⳣ΢�ַ���
% HfunΪ����һ��΢�ַ��̵����ĺ����������ʽΪ dX = Hfun( t,X )
% tΪʱ��ڵ㣬��Ϊ������ʱ�䷶ΧΪ T = 0:h:t
%             ��2���� ��ʱ�䷶ΧΪ T = t(1):h:t(2)
%             ���� ��ʱ�䷶ΧΪ T = t
% hΪʱ�䲽������t��ǰ��������£��������h����ֵ
% ֱ�Ӹ���ʱ��ڵ�tʱ��h����[]������ֵռλ
% x0Ϊ״̬����ʼֵ
% �㷨��
%      Xp = X(k-1) + h*dX(k-1)
%      dXp = Hfun( T(k),Xp )
%      X(k) = X(k-1) + (h/2)*[dX(k-1)+dXp]
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
    dX(k-1,:) = Hfun( T(k-1),X(k-1,:) );   
    h = T(k) - T(k-1);
    Xp = X(k-1,:) + h*dX(k-1,:);
    dXp = Hfun( T(k),Xp );
    X(k,:) = X(k-1,:) + (h/2)*(dX(k-1,:)+dXp');
end
dX(N,:) = Hfun( T(N),X(N,:) );

if nargout == 0
    plot(T,X)
end

     


