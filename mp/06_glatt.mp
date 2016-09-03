verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex


u:=0.5cm;
v := 0.3*u;

beginfig(1);

pickup pencircle scaled 0.3pt;

path c;
pair a[];

drawarrow (-2u,0)--(2u,0);
drawarrow (0,-2u)--(0,2u);

draw (-2u,2u)--(0,0)--(2u,2u) dashed evenly scaled 0.5;


M := 100;
xmin := -2;
xmax :=  0;
dx := 2.0/M;

for i=0 upto M:
a[i] := (xmin+i*dx, -0.5*( (xmin+i*dx)**2 ) )*u;
endfor;

c := a[0] for i=0 upto M: --a[i] endfor;
draw c;
draw c xscaled -1 yscaled -1;
 
label.rt( btex $f$ etex, (-1.8u+2,1.8u) );
label.rt( btex $F$ etex, a3 );




endfig;
end