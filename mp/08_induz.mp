verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

u := cm;

beginfig(1);

fill unitsquare xscaled 3u yscaled 1.5u withcolor 0.9 white;
draw unitsquare xscaled 3u yscaled 1.5u;

path c;


c := (0.2u,0.2u){dir 10}...(1.5u,1.2u)...(2.8u,u){dir 40};

draw c withpen pencircle scaled 1pt;

pair A, B;

A := point 0.5 of c;
B := point 1.5 of c;
draw A--B;
mark( A );
mark( B );

%label.lft( btex $a$ etex, A+(0,1) );
%label.rt( btex  $b$ etex, B+(0,2) );
label.bot( btex $d$ etex, 1/2[A,B] shifted (0,-1) );
label( btex $\mathbb{R}^2$ etex, (0.2u+2,1.3u) ); 


endfig;
end

