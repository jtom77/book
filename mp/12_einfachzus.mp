verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

u:=3.5cm;

ahlength := 1mm;

def pi = 3.14159 enddef;


v := 0.3*u;

beginfig(1);

pickup pencircle scaled 0.2pt;


fill fullcircle scaled 3u withcolor 0.9 white;
draw fullcircle scaled 3u;

fill fullcircle scaled 0.5u withcolor white;
draw fullcircle scaled 0.5u;

pickup pencircle scaled 0.8pt

path c;

c := (u,0){dir 70}..(0,u){dir 130}..(-u,0)..(0,-u){dir -60}..cycle;

draw c;







endfig;
end