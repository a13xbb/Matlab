function [integral, n, h] = montecarlo(a,b,n)
    fprintf("\nThe Mounte-Carlo's method works");
    x = a + (b-a)*rand(n,1);
    h1 = min(f(a:0.1:b));
    h2 = max(f(a:0.1:b));
    if h1 > 0
        y = 0 + h2*rand(n,1);
    else 
        y = h1 + (h2-h1)*rand(n,1);
    end
    if h1 < 0
        h1 = abs(h1);
    else
        h1 = 0;
    end
    if h2 < 0
        h2 = 0;
    else
        h2 = abs(h2);
    end
    h = h1 + h2;
    int = (b - a) * h;
    ns = 0;
    sum = 0;
    hold on
    for i = 1:n
        sum = sum + f(x(i));
        if ((y(i) <= f(x(i)) && y(i)>=0) || (y(i) > f(x(i)) && y(i)<0))
            if(y(i)>=0)
                ns = ns + 1;
            else
                ns=ns-1;
            end
                
            
            %plot(x(i),y(i), 'ro')
        else
            %plot(x(i),y(i), 'bo')
        end
    end
    integral =  int * (ns/n);
    mid = ((b - a)/n) * sum;
    grid on
    fplot(@f,[a b],'b');
    fprintf("int: %.10f, mid: %.10f", integral, mid);
end