function [integral] = central_sq(a,b,eps)
    n=2;
    h = (b-a) / n;
    prev = 0;
    while(1)
        s=0;
        for k = 1:n
            x = a+k*h-h/2;
            s=s+f(x);
            X(k)=x;
        end
        integral=s*h;
        if(abs(integral - prev)<eps)
            break;
        end
            n=n*2;
            h=h/2;
            prev=integral;
    end
    hold on;
    bar(X-h/2,f(X),'histc'); %-h/2 для наглядности что прямоугольники центральные
    fplot(@f,[a b],'r');
    hold off;
    fprintf("integral = %2.10f, n = %d, h = %.16f", integral, n, h);
end