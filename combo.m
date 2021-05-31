function [xn] = combo(a,b,eps)
    i=0;
    timer=0;
    syms x;
    d2(x)=diff(f(x),2);
    d1(x)=diff(f(x));
    if(d2(a)*f(a)>0)
        x0=a;
        i=i+1;
        tic
        xc = x0-((f(x0)*(b-x0))/(f(b)-f(x0)));
        xn = x0-f(x0)/d1(x0);
        timer = timer+toc;
    else
        x0=b;
        i=i+1;
        tic
        xc = x0-((f(x0)*(a-x0))/(f(a)-f(x0)));
        xn = x0-f(x0)/d1(x0);
        timer = timer+toc;
    end
    while(abs(xn-xc)>=eps)
        i=i+1;
        tic
        xn = xn-f(xn)/d1(xn);
        if(x0==a)
            xc = xc-((f(xc)*(b-xc))/(f(b)-f(xc)));
        else
            xc = xc-((f(xc)*(a-xc))/(f(a)-f(xc)));
        end
        timer = timer+toc;
    end
    fprintf('x = %2.9f\n', xn);
    fprintf("iterations: %d\n", i);
    fprintf("time per iteration : %2.9f\n", timer/i);
end