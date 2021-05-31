function [c] = der2(func, x0)
d = diff(func,2 );
c = vpa(subs(d,x0));
end