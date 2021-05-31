function [integral] = three_eights(a, b, eps)
    n = 3;
    m = 1;
    h = (b-a)/(3*n);
    integral_prev = 0;
    
    while 1
        S = f(a) + f(b);
        for k = 1:(m)
            x = a + h*k;
            if (mod(k, 3) == 0)
                S = S + 2*f(x);
            else
                S = S + 3*f(x);
            end
            
        end
        integral = 3/8*S*h;  
       
        if (abs(integral - integral_prev) < eps)
            break;
        end
        
        n = n*3;
        m = 3*n - 1;
        h = h / 3;
        integral_prev = integral;
    end
    fprintf("integral = %2.10f, h = %d, n = %d\n", integral, h, n);
    fprintf('n = %d\n', n);
    fprintf('h = %2.10f\n', h);
    %subplot(3, 2, 1);
    title(['THREE_EIGHTS, Integral: ', num2str(integral),' n: ',num2str(n),' h: ',num2str(h)]);
    xx=a;
    hold on
    for i=1:(n)
        %hold on
        %xx=linspace(X,X+h,100);
        %yy=(xx-X).*((f(X+h)-f(X))./h)+f(X);
        %area(xx,yy);
        %X=X+h;
        x = [(xx) (xx + h) (xx + 2*h) (xx + 3*h)];
        y = [f(xx) f(xx + h) f(xx + 2*h) f(xx + 3*h)];
        p = polyfit(x, y, 3);
        %disp(p);
        x1 = linspace(xx, xx + 3*h, 100);
        y1 = polyval(p, x1);
        hold on
        %plot(x,y,'o')
        %plot(x1,y1,'g')
        area(x1, y1);
        plot(x1, y1);
        %disp(x1);
        %disp(y1);
        xx = xx + 3*h;
    end
    fplot(@f,[a b],'r');
end


