function [ y ] = f( x )
%y=x.^2-cos(5.*x);
%y=sin(x);
%y=sqrt(abs(x));
y=exp(x)-exp(-x)-2;
%y=(1/sqrt(11))*abs(x.^3-sqrt(2)*x);
%y=x^3/3;
end