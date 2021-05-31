function [c]=dichotomy(a,b,eps)
   i=0;
   timer = 0;
   while(abs(a-b)>=eps)
       i=i+1;
       tic
       c=(a+b)/2;
       %fprintf("a=%d  b=%d  ", a,b);
       %fprintf("iter:%d  x=%2.9f\n", i, c);
       if(f(a)*f(c)<0)
           b=c;
       else
           a=c;
       end
       timer = timer + toc;
   end
   fprintf('x = %2.9f\n', c)
   fprintf("iterations: %d\n", i)
   fprintf("time per iteration : %2.9f\n", timer/i);
end