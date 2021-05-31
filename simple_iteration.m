function [x1]=simple_iteration(x1, eps)
    timer = 0;
    i=0;
    tic
    x0=x1;
    x1=fi(x0);
    timer = timer + toc;
    i=i+1; 
    while (abs(x0-x1)>=eps)
        tic
        x0=x1;
        x1=fi(x0);
        timer = timer + toc;
        i=i+1; 
    end
    fprintf('x = %2.9f\n', x1);
    fprintf("iterations: %d\n", i);
    fprintf("time per iteration : %2.9f\n", timer/i);
    
end