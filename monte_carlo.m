function [Ans]=monte_carlo(a,b,n)
x=a+(b-a)*rand(n,1);  
H=max(f(a:0.1:b));
y=H*rand(n,1);
A=(b-a)*H;
ns=0;
sum=0;
hold on;
grid on;
ezplot(@f);
for i=1:n
    sum=sum+f(x(i));
    if(y(i)<=f(x(i)))
        ns=ns+1;
        %plot(x(i), y(i), 'ro');
    else
        %plot(x(i), y(i), 'bo');
    end
end
Ans=A*(ns/n);
mid=((b-a)/n)*sum;
fprintf("integral: %.10f, mid: %.10f", Ans, mid)
end