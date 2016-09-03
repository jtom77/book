verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

vardef f(expr x)= x/(1+abs(x)) enddef;

u:=0.7cm;
v := 0.3*u;

beginfig(1);


drawarrow (-5u,0)--(5u,0);

path c;
 
c := (-2u,0)--(-u,u)--(u,u)--(2u,0);

draw c scaled 0.5;
draw c;
draw c scaled 1.5;
draw c scaled 2;

pair lab;
lab := (1.5u,0.5u);

label.rt( btex $f_1$ etex, lab scaled 0.5+(1,1));
label.rt( btex $f_2$ etex, lab +(1,1) );
label.rt( btex $f_3$ etex, lab scaled 1.5 +(1,1) );
label.rt( btex $f_4$ etex, lab scaled 2 +(1,1) );

label.bot( btex $0$ etex, (0,-2) );

endfig;
end