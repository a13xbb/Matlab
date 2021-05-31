function [c] = newton(a,b,eps)
    i=0; 
    timer=0;
    syms x;
    der1(x)=diff(f(x));
    der2(x)=diff(f(x),2);
    
    der1=matlabFunction(der1);
    der2=matlabFunction(der2);
    
    if (f(a)*der2(a)>0)
        c=a;
    else 
        c=b;
    end
    while (abs(f(c))>=eps)
        tic
        c=c-f(c)/der1(c);
        i=i+1;
        %fprintf("iter:  %d  ", i);
        %fprintf('x = %2.9f\n', c);
        timer = timer + toc;
    end
    fprintf('x = %2.9f\n', c);
    fprintf("iterations: %d\n", i);
    fprintf("time per iteration : %2.9f\n", timer/i);
end