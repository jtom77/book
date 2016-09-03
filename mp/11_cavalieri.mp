verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

vardef f(expr x)= x/(1+abs(x)) enddef;

u:=2.6cm;
v := 0.3*u;

beginfig(1);

path c;

c := fullcircle scaled 2u;

pair a[];
for i=0 upto 7: 
a[i] := point i of c;
endfor;

a[0] := (0.3,0);
a[4] := (-0.3u,0);
a[7] := a[7] shifted (-0.5u,0);

c := a0 for i=1 upto 7: ..a[i] endfor..cycle;

c := c yscaled -0.4 xscaled 0.8;
c := c shifted (0.7u,0.7u);


fill c withcolor 0.9 white;
draw c;


drawarrow (0,0)--(1.5u,0);
drawarrow (0,0)--(0,1.4u);


pair s[];

s1 := c intersectionpoint ( (0,0.5u)--(10u,0.5u) );
s2 := subpath (7,0) of c intersectionpoint ( (0,0.5u)--(10u,0.5u) );


draw (-mm,ypart s1)--(0.4u, ypart s1) dashed evenly scaled 0.5;
draw s1--(xpart s1,-mm) dashed evenly scaled 0.5;
draw s2--(xpart s2,-mm) dashed evenly scaled 0.5;

draw (xpart s1,0)--(xpart s2,0) withpen pencircle scaled 1.4pt;
draw s1--s2 withpen pencircle scaled 0.6pt;

label.lft( btex $t$ etex, (-mm,ypart s1) );
label.bot( btex $K(t)$ etex, 1/2[ (xpart s1,0), (xpart s2,-2) ] );
label( btex $K$ etex, (0.4u,u) );

pair lab[];

lab1 := 2/3[s1,s2];
lab2 := lab1 shifted (0.4u,0.3u);
draw lab1--lab2 withpen pencircle scaled 0.2pt; 

label.rt( btex $K(t) \times \{ t \}$ etex, lab2 + (1,0) );


endfig;
end