verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

vardef f( expr x )= 0.8/(x**1.2) enddef;

u:=1.5cm;
v := 0.3*u;
numeric min;
numeric max;

beginfig(1);

labeloffset := 1.5pt;

pair a[];
path c;
path d;
path e;

M := 100;
xmin := 0.3;
xmax := 4;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := (xmin+i*dx, f(xmin+i*dx)  )*u;
endfor;

for i=0.5 step 0.5 until 3.5:
fill (i*u,0)--(i*u,f(i)*u)--(i*u+0.5*u,f(i)*u)
--(i*u+0.5u,0)--cycle withcolor 0.9 white;
fill (i*u,0)--(i*u,f(i+0.5)*u)--(i*u+0.5*u,f(i+0.5)*u)
--(i*u+0.5u,0)--cycle withcolor 0.7 white;
draw (i*u,0)--(i*u,f(i)*u) dashed withdots scaled 0.5;
draw (i*u+0.5u,0)--(i*u+0.5u,f(i)*u) dashed withdots scaled 0.5;
draw (i*u,f(i)*u)--(i*u+0.5u,f(i)*u);
draw (i*u,f(i+0.5)*u)--(i*u+0.5u,f(i+0.5)*u);
endfor;

c := a0 for i=1 upto M: --a[i] endfor;


draw c;


clip currentpicture to( (0,0)--(4u,0)--(4u,2.5u)--(0,2.5u)--cycle );

drawarrow (0,0)--(4u,0);
drawarrow (0,0)--(0,2.5u);

for i=0.5 step 0.5 until 3.5:
draw (i*u,0)--(i*u,-mm);
endfor;


labeloffset := 1.5pt;
label.bot( btex $1$ etex, (0.5u,-mm) );
label.bot( btex $2$ etex, (u,-mm) );
label.bot( btex $3$ etex, (1.5u,-mm) );
label.bot( btex $4$ etex, (2u,-mm) );
label.bot( btex $5$ etex, (2.5u,-mm) );
label.bot( btex $6$ etex, (3u,-mm) );
label.bot( btex $7$ etex, (3.5u,-mm) );

label.rt( btex $f$ etex, (0.4u+2,2.4u) );

draw (1.5u,2u)--(1.8u,2u) withpen pensquare scaled 2mm withcolor 
0.9 white;
draw (1.5u,1.5u)--(1.8u,1.5u) withpen pensquare scaled 2mm withcolor 
0.7 white;

label.rt( btex $\sum_{k=1}^\infty f(k)$ etex, (2u+3,2u) );
label.rt( btex $\sum_{k=1}^\infty f(k+1)$ etex, (2u+3,1.5u) );



endfig;
end