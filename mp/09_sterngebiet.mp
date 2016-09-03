verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

pickup pencircle scaled 0.2pt;

u:=0.4cm;
v := 0.3*u;

beginfig(1);

path c;

c := (-2.5u,-2u)--(2.5u,-2u)--(2.5u,2u)--(-2.5u,2u)--cycle;
fill c withcolor 0.8 white;

path d;
d := (-2.5u,-0.5)--(0,-0.5)--(0,0.5)--(-2.5u,0.5)--cycle;
fill d withcolor white;

draw (0,0)--(2.5u,0);
draw (-2.5u,-0.5)--(0,-0.5) dashed evenly scaled 0.7pt;
draw (-2.5u,0.5)--(0,0.5) dashed evenly scaled 0.7pt;

mark( (0,0) );

label( btex $\mathbb{C}_-$ etex, (-1.8u,-1.5u) );
label.bot( btex $0$ etex, (0,-2) );

endfig;
end