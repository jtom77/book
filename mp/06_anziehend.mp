verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

u:=0.66cm;
v := 0.3*u;

beginfig(1);

pickup pencircle scaled 0.2pt;

path c;
path d;

c := (0,0.5u){dir 10}...(2.6u,3u){dir 80};

draw c withpen pencircle scaled 0.6pt;

drawarrow (0,0)--(3u,0);
drawarrow (0,0)--(0,3u);

d := (0,0)--(3u,3u);
draw d; 

pair A, B;

A := c intersectionpoint d;
B := (subpath (0.5,1) of c) intersectionpoint d;

mark( A );
mark( B );

label.lft( btex absto{\ss}end etex, B+(-1,1) );  
label.rt( btex anziehend etex, A-(0,2) );

endfig;
end