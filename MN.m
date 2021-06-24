function MN(x,y)
n=size(x);
for i=1:n(1)
    for j=1:n(1)
        A(i,j)=x(i).^(j-1);
    end
end
disp(A);
B=y;
Z=A\B;
Z=Z(end:-1:1)
xx=linspace(x(1),x(end),100);
yy=polyval(Z,xx);
plot(x,y,'o',xx,yy);
end

