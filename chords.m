function [c] = chords(a,b,eps)
    timer = 0;
    i=0;
    syms x;
    d2(x)=diff(f(x),2);
    if(d2(a)*f(a)<=0)
        c=b;
        while(abs(f(c))>=eps)
            i=i+1;
            %fprintf("a:%d  b=%d  f(a)=%2.9f  f(x)=%2.9f ", a,b,f(a),f(c));
            tic
            c=a-((f(a)*(c-a))/(f(c)-f(a)));
            timer = timer + toc;
            %fprintf("iter:%d  x=%2.9f\n", i, c);
        end
    else
        c=a;
        while(abs(f(c))>=eps)
            i=i+1;
            %fprintf("a:%d  b=%d  f(b)=%2.9f  f(x)=%2.9f ", a,b,f(b),f(c));
            tic
            c=c-((f(c)*(b-c))/(f(b)-f(c)));
            timer = timer + toc;
            %fprintf("iter:%d  x=%2.9f\n", i, c);
        end
    end
    
    fprintf('x = %2.9f\n', c);
    fprintf("iterations: %d\n", i);
    fprintf("time per iteration : %2.9f\n", timer/i);
end