function [] = minkv(x,y)
n=size(x);
for i=1:n(1)
    for j=1:n(1)
       if i<=j
        s=0;
        for k=1:n
            s=s+(x(k).^(i+j-2));
        end
        A(i,j)=s;
        A(j,i)=s;
       end
    end

end
 
for i=1:n(1)
    s=0;
    for j=1:n(1)
        s=s+y(j).*(x(j).^(i-1));
    end
    B(i)=s;
end

disp(A);
disp(B);
B=B';
Z=A\B;
Z=Z(end:-1:1);
disp(Z);
xx=linspace(x(1),x(end),100);
yy=polyval(Z,xx);
plot(x,y,'o',xx,yy);

end

