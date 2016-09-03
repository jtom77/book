verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex


u:= 0.5cm;
v := 0.6*u;

beginfig(1);


numeric t[];
numeric h[];
t0 := 0;
t1 := 3;
t2 := 4.7;
t3 := 5.5;
t4 := 6.7;
t5 := 8;

h0 := 3;
h1 := -1;
h2 := -3;
h3 := 2;
h4 := -1;
h5 := -1;
h6 := 0;

drawarrow (0,0)--(9u,0);
drawarrow (0,-2.5v)--(0,4v);
label.bot( btex $x$ etex, (9u-2,-mm) );
label.lft( btex $f(x)$ etex, (-mm,4*v-2) );

fill (2u,0)--(2u,h0*v)--(0,h0*v)--(0,0)--cycle withcolor 0.9 white;
draw (2u,0)--(2u,h0*v)--(0,h0*v)--(0,0)--cycle;

label( btex $F(x_0)$ etex, (u, 0.5*h0*v ) );

draw (2u,0)--(2u,-mm);

label.bot( btex $x_0$ etex, (2u,-mm) );  

for i=0 upto 4:
draw (t[i]*u,h[i]*v)--(t[i+1]*u,h[i]*v);
endfor

draw (t1*u,h0*v)--(t1*u,h1*v) dashed withdots scaled 0.5;
draw (t2*u,h1*v)--(t2*u,h2*v) dashed withdots scaled 0.5;
draw (t3*u,h2*v)--(t3*u,h3*v) dashed withdots scaled 0.5;
draw (t4*u,h3*v)--(t4*u,h4*v) dashed withdots scaled 0.5;
draw (t5*u,h4*v)--(t5*u,0) dashed withdots scaled 0.5;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

numeric s;
s := -4.3u;

drawarrow (0,s)--(9u,s);
drawarrow (0,-v+s)--(0,4v+s);

label.bot( btex $x$ etex, (9u-2,-mm+s) );
label.lft( btex $F(x)$ etex, (-mm,4*v-2+s) );
label.bot( btex $x_0$ etex, (2u,-mm+s) );  

pair start;
start := (0,s);

for i=0 upto 4:
draw start--(start+(u*(t[i+1]-t[i]),h[i]*v) );
start := start+(u*(t[i+1]-t[i]),h[i]*v);
endfor;

pair vec;
vec := (2u,2v);

draw (2u,s)--( (0,s)+vec ) dashed evenly scaled 0.8;
draw (-mm,ypart( (0,s)+vec) )--( (0,s)+vec ) dashed evenly scaled 0.8;  
draw (2u,s)--(2u,s-mm);

label.lft( btex $F(x_0)$ etex, (-mm, ypart( (0,s)+vec) )); 


endfig;
end