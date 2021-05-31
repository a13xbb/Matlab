function [] = simpson(a, b, eps)
m = 1;
n = 2*m;
h = (b - a) / 2;
integral_previous = 0;
while 1
    S = 0;
    for k = 1:m
        x = a+(2*k - 1) * h;
        S = S + 2*f(x) + f(x + h);
    end
    integral=(f(a) - f(b) + 2 * S) * h / 3;
    if abs(integral - integral_previous) < eps
        break
    else
        m = n;
        n = n * 2;
        h = h / 2;
        integral_previous=integral;
    end
end
fprintf('integral = %2.10f\n', integral);
fprintf('n = %d\n', n);
fprintf('h = %2.10f\n', h);
%subplot(3, 2, 1);
title(['SIMPSON, Integral: ', num2str(integral),' n: ',num2str(n),' h: ',num2str(h)]);
xx=a + h;
hold on
for i=1:(n/2)
    %hold on
    %xx=linspace(X,X+h,100);
    %yy=(xx-X).*((f(X+h)-f(X))./h)+f(X);
    %area(xx,yy);
    %X=X+h;
    x = [(xx - h) (xx) (xx + h)];
    y = [(f(xx - h)) (f(xx)) (f(xx + h))];
    p = polyfit(x, y, 2);
    %disp(p);
    x1 = linspace(xx - h, xx + h, 100);
    y1 = polyval(p, x1);
    %plot(x,y,'o')
    %plot(x1,y1,'g')
    area(x1, y1);
    %disp(x1);
    %disp(y1);
    xx = xx + 2*h;
end
fplot(@f,[a b],'r');
end