function [x0] = chords2(a, b, eps)
i = 0;
timer = 0;
x0 = a - f(a) / (f(b) - f(a)) * (b-a);
    while (abs(f(x0)) >= eps)
        i = i + 1;
        tic
        x0 = a - f(a) / (f(b) - f(a))*(b-a);
        if f(a) * f(x0) < 0
            b = x0;
        else
            a = x0;
        end
        timer = timer + toc;
    end
fprintf('x = %2.9f\niterations: %d\n', x0, i);
fprintf('time per iteration: %2.9f', timer/i);
end