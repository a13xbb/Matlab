a=-5;
b=5;
n=1000000
montecarlo(a,b,n)
q = integral(@f,a,b)
fprintf("int=%.10f",q);