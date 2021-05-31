function [integral] = trapezoid(a,b,eps)
    n=2;
    h = (b-a) / n;
    prev = 0;
    while(1)
        s=(f(a)+f(b))/2;
        for k = 1:n-1
            x = a+k*h;
            s=s+f(x);
            X(k)=x;
        end
        integral=s*h;
        if(abs(integral - prev)<eps)
            break;
        end
            n=n*2;
            h=h./2;
            prev=integral;
    end
    hold on;
    X=a;
    for i=1:n
        hold on
        xx=linspace(X,X+h,100);
        yy=(xx-X).*((f(X+h)-f(X))./h)+f(X);
        area(xx,yy);

        Yh=linspace(0,f(X+h),100);
        Xh=linspace(X+h,X+h,100);
        f1=plot(Xh, Yh,'b','DisplayName','трапеции');
        X=X+h;
end
    fplot(@f,[a b],'r');
    hold off;
    fprintf("integral = %2.10f, n = %d, h = %.16f", integral, n, h);
end