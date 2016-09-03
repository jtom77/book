\verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex


beginfig(1);

u:=0.5cm;

drawarrow (-4u,0)--(4u,0);
drawarrow (0,-1.2u)--(0,1.4u);

draw (-3.14u,-u)--(0,-u);
draw (3.14u,u)--(0,u);
draw (3.14u,-u)--(4u,-u);
draw (-3.14u,u)--(-4u,u);

draw (3.14u,u)--(3.14u,-u) dashed evenly;
draw (-3.14u,u)--(-3.14u,-u) dashed evenly;

label.lrt( btex $\pi$ etex, (3.14u,0) );
label.llft( btex $-\pi$ etex, (-3.14u,0) );


endfig;
end