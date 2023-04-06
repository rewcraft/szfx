function [L_matrix,U_matrix,y_matrix,x_matrix] = LU(A_matrix, B_matirx) 
% LU系数矩阵分解
% inputs:
%        A_matrix:输入的系数矩阵，尺寸为[n,n]
%        B_matrix:输入的乘积矩阵，尺寸为[n,1]
% outputs:
%        L_matrix:下三角阵，尺寸为[n,n]
%        U_matrix:上三角阵，尺寸为[n,n]
%        y_matrix:中间矩阵，尺寸为[n,1]
%        x_matrix:结果矩阵，尺寸为[n,1]
%% 第一步：初始化
% 获取n值
[row_a, col_a] = size(A_matrix);
% 初始化上三角阵的第一行
for j = 1:col_a
    U_matrix(1,j) = A_matrix(1,j);
end
% 初始化下三角阵的第一列
L_matrix(1,1) = 1;
for i = 2:row_a
    L_matrix(i,1) = A_matrix(i,1)/U_matrix(1,1); % 对应式（1.3）
end
%% 第二步：求U,L
for r=2:row_a
    for j=r:col_a
        sum=0;
        for k=1:r-1
            sum=sum+L_matrix(r,k)*U_matrix(k,j);
        end
        U_matrix(r,j)=A_matrix(r,j)-sum;
        sum_1=0;
        for p=1:r-1
            sum_1=sum_1+L_matrix(j,p)*U_matrix(p,r);
        end
        L_matrix(j,r)=(A_matrix(j,r)-sum_1)/U_matrix(r,r);
    end
end
%% 第三步：求y
y_matrix(1,1)=B_matirx(1,1);
for r=2 :col_a
    sum_2=0;
    for j=1:r-1
        sum_2=sum_2+L_matrix(r,j)*y_matrix(j,1);
    end
    y_matrix(r,1)=B_matirx(r,1)-sum_2;
end
%% 第四步：求x
x_matrix(row_a,1)=y_matrix(row_a,1)/U_matrix(row_a,col_a);
for r=row_a-1: -1: 1
    sum_3=0;
    for j=r+1:row_a
        sum_3=sum_3+U_matrix(r,j)*x_matrix(j,1);
    end
    x_matrix(r,1)=(y_matrix(r,1)-sum_3)/U_matrix(r,r);
end
end