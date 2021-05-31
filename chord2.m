function [x0] = chord2(a, b, eps)
syms x    
der2(x) = diff(f(x), 2);

iter = 0;
    if (der2(a) * f(a) > 0)
       x0 = b;
       while (abs(f(x0)) > eps) 
          x0 = a - ((f(a)*(x0 - a))/(f(x0)*f(a))); 
          fprintf("x0 = %.9f   iter = %d\n", x0, iter);
          iter = iter + 1;
       end
    elseif (der2(a) * f(a) < 0)
            x0 = a;
            while(abs(f(x0)) > eps)
                x0 = x0 - ((f(x0)*(b - x0))/(f(b) - f(x0))); 
                fprintf("x0 = %.9f   iter = %d\n", x0, iter);
                iter = iter + 1;
            end
    end
    
        
end