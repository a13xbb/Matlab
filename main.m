a=-5;
b=5;
eps=0.1;



subplot(2,3,1);
fprintf('LEFT RECTANGLES:\n');
fprintf('-------------------------------------\n');
integral = left_sq(a,b,eps); 
title("left:", integral); 
fprintf('\n-------------------------------------\n\n');

subplot(2,3,2);
fprintf('CENTRAL RECTANGLES:\n');
fprintf('-------------------------------------\n');
integral = central_sq(a,b,eps);
title("central:", integral);
fprintf('\n-------------------------------------\n\n');

subplot(2,3,3);
fprintf('RIGHT RECTANGLES:\n');
fprintf('-------------------------------------\n');
integral = right_sq(a,b,eps); 
title("right:", integral);
fprintf('\n-------------------------------------\n\n');

subplot(2,3,4);
fprintf('TRAPEZOID:\n');
fprintf('-------------------------------------\n');
integral = trapezoid(a,b,eps); 
title("trapezoid:", integral);
fprintf('\n-------------------------------------\n\n');

subplot(2,3,5);
fprintf('SIMPSON:\n');
fprintf('-------------------------------------\n');
simpson(a,b,eps); 
% title("simpson:", integral);
fprintf('-------------------------------------\n\n');

subplot(2,3,6);
fprintf('THREE_EIGHTS:\n');
fprintf('-------------------------------------\n');
three_eights(a,b,eps); 
% title("three_eights:", integral);
fprintf('-------------------------------------\n\n');

fprintf('-------------------------------------\n');
integral = quad(@f,a,b); 
fprintf('QUAD:%.6f\n', integral);
syms x;
expr = f(x);
integral = int(expr,[a b]); 
fprintf('INT:%.6f\n', integral);
fprintf('-------------------------------------\n\n');

hold off;



% x=[1 2 3];
% y=sin(x);
% p=polyfit(x,y,2);
% x1 = linspace(1,3,5);
% y1 = polyval(p,x1);
% figure
% plot(x,y,'o')
% hold on
% plot(x1,y1)


