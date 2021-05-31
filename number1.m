function [ ] = number1()

t=-2:0.1:1;
%z=t.^2;
%z=sin(t);
%z=2.*t-t.^2; %задаем функцию
%z=2.*t+1; %задаем функцию
% ex7 крутим вокруг оси OY http://www.mathprofi.ru/obyem_tela_vrashenija.html
z=(4-t.^2);
z_pointer = @(t)(4-t.^2).^2;
z_vol = integral(z_pointer,-2,1)*pi
alpha=-pi:0.1:pi+0.1;

x=((cos(alpha))').*z;
y=((sin(alpha))').*z;
t=kron(ones(length(alpha),1),t);

mesh(x,y,t);
hold on
%%%%%%%%%%
t2=0:0.1:1;
%z2=t2+4;
%z2=0.7+t2.*0;

%ex7_ OY
z2=3*t2;
z2_pointer = @(t2)(3*t2).^2;
z2_vol = integral(z2_pointer,0,1)*pi
alpha=-pi:0.1:pi+0.1;

x2=((cos(alpha))').*z2;
y2=((sin(alpha))').*z2;
t2=kron(ones(length(alpha),1),t2);

total_vol = z_vol-z2_vol

mesh(x2,y2,t2);



% t3=1:0.1:4;
% alpha=-pi:0.1:pi+0.1;
% 
% x3=((sin(alpha))').*t3;
% y3=((cos(alpha))').*t3;
% t3=kron(zeros(length(alpha),1),t3);
% mesh(x3,y3,t3);
% 
% 
% 
% t3=3:0.1:5;
% alpha=-pi:0.1:pi+0.1;
% 
% x3=((sin(alpha))').*t3;
% y3=((cos(alpha))').*t3;
% t3=1+kron(zeros(length(alpha),1),t3);
% mesh(x3,y3,t3);
end