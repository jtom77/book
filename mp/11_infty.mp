verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

vardef f(expr x)= x/(1+abs(x)) enddef;
input mydefs;
u:=1.3cm;
v := 0.3*u;


beginfig(1);

pair a[];
M := 100;
xmin := -4;
xmax := 4;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := (xmin+i*dx, f(xmin+i*dx) )*u;
endfor;

path @;
@ := a0 for i=1 upto M: --a[i] endfor;
draw @ thick;

drawarrow (-4u,0)--(4u,0);
drawarrow (0,-1.3u)--(0,1.5u);

draw (0,u)--(-mm,u);
draw (0,-u)--(-mm,-u);

label.lft( btex $1$ etex, (-mm,u) );
label.lft( btex $1$ etex, (-mm,-u) );

label.bot( btex $\mathbb{R}$ etex, (4u-mm,-mm) );
label.rt( btex $\mathbb{R}$ etex, (mm,1.5u-mm) );

label.lrt(btex $s$ etex, a[10] - (0,2));



endfig;
end