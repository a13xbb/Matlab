function [ ] = number2()



%UNTITLED Summary of this function goes here
% Detailed explanation goes here
t = 0:0.001:2^0.25;





z =(1/sqrt(11))*abs(t.^3-sqrt(2)*t);% верх часть тора
alpha=-pi:0.1:pi+0.1;
x =((cos(alpha))').*z;
y =((sin(alpha))').*z;
t = kron(ones(length(alpha),1),t);




mesh(x, y, t);



syms x;
d1(x) = diff(fnum2(x), 1);
val(x) = sqrt(1 + d1(x).^2);
val(x) = val(x) * r(x);
val = matlabFunction(val);
P1 = 2*pi*integral(val, 0, 2.^0.25);
fprintf("%f\n", P1);
% 
% 
% 
% hold on
% axis equal;
% %%%%%%%%%%
% t2=a:0.1:b;
% z2=3-sqrt(1-t.^2);% нижняя часть тора
% 
% 
% 
% 
% alpha =- pi:0.1:pi+0.1;
% x2=((cos(alpha))').*z2;
% y2=((sin(alpha))').*z2;
% t2=kron(ones(length(alpha),1),t2);
% 
% 
% 
% 
% syms x;
% d2(x) = diff(f2(x), 1);
% val2(x) = sqrt(1 + d2(x).^2);
% val2(x) = val2(x) * f2(x);
% val2 = matlabFunction(val2);
% P2 = 2*pi*integral(val2, -1, 1);
% fprintf("%f\n", P2);
% 
% 
% 
% fprintf("Final ans = %f", P1 + P2);
% 
% 
% 
% mesh(x2,y2,t2);
end