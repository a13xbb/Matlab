function [mean, n, h] = montecarlo(low,high,n)
    hold on;
    grid on;
    x = low + (high - low) * rand(n, 1);  
    h1 = max(f(low:0.1:high + 0.1));
    h2 = min(f(low:0.1:high + 0.1));    
    h = h1 - h2;
    y = h2 + (h1 - h2) * rand(n, 1);
    I = (high - low) * h;
    ns = 0;
    sum = 0;
    
    for i = 1:n
        sum = sum + f(x(i));
        if y(i) <= f(x(i)) && y(i) >= 0 || y(i) > f(x(i)) && y(i) < 0
            ns = ns + 1;
            plot(x(i), y(i), 'r.');
        else
            plot(x(i), y(i), 'b.');
        end
    end
    
    I = I * (ns / n);
    mean = ((high - low) / n) * sum;
    
    fplot(@f, [low high], 'green');
end