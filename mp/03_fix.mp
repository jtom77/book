verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs; 

u:=0.6cm;

beginfig(1);

a := 0.5u;
b := 2.9u;

drawarrow (-0.2u,0)--(3.5u,0);
drawarrow (0,-0.2u)--(0,3.5u);

draw (a,-mm)--(a,0);
draw (b,-mm)--(b,0);
draw (-mm,a)--(0,a);
draw (-mm,b)--(0,b);

draw (-0.2u,-0.2u)--(3.2u,3.2u);

draw (a,0.9u){dir 80}..(1.5u,2.4u)..(2u,2u)..{dir -20}(b,1.5u) withpen 
pencircle scaled 0.6pt;

draw (-mm,2u)--(2u,2u) dashed evenly;
draw (2u,-mm)--(2u,2u) dashed evenly;
draw (a,0)--(a,a) dashed evenly;
draw (0,a)--(a,a) dashed evenly;
draw (b,0)--(b,a) dashed evenly;
draw (0,b)--(a,b) dashed evenly;
draw (a,a)--(b,a)--(b,b)--(a,b)--cycle; 
draw (2u,2u) withpen pencircle scaled 4;
draw (2u,2u) withpen pencircle scaled 2 withcolor white;


label.bot( btex $a$ etex, (a,-mm) );
label.bot( btex $b$ etex, (b,-mm) );
label.lft( btex $a$ etex, (-mm,a) );
label.lft( btex $b$ etex, (-mm,b) );
label.rt( btex $f$ etex,  (b,1.5u) );
label.top( btex $x=y$ etex, (3.2u,3.2u) );
label.bot( btex $\xi$ etex, (2u,-mm) );
label.lft( btex $f(\xi)$ etex, (-mm,2u) );


endfig;
end