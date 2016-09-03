verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

u:=5cm;
v := 0.3*u;

beginfig(1);

pickup pencircle scaled 0.3pt;

ahlength := 2mm;
ahangle := 30;

path c;
numeric h;

c := (0,0.1u){dir 85}...(0.6u,0.1u){dir -65};
c := c shifted (5,0.2u);
draw c withpen pencircle scaled 0.6pt;

h := directiontime (u,0) of c;

pair A, B, C;
 
A := point 0 of c;
B := point h of c;
C := point 1.0 of c;

draw A--C;
draw (B-(0.2u,0))--(B+(0.2u,0));

draw A--(xpart A, 0) dashed withdots scaled 0.5;
draw B--(xpart B, 0) dashed withdots scaled 0.5;
draw C--(xpart C, 0) dashed withdots scaled 0.5; 
draw (xpart A,0)--(xpart A,-mm);
draw (xpart B,0)--(xpart B,-mm);
draw (xpart C,0)--(xpart C,-mm);

mark( A );
mark( B );
mark( C );

drawarrow (0,0)--(0.77u,0);

label.bot( btex $a$ etex, (xpart A, -mm ) );
label.bot( btex $\xi$ etex, (xpart B, -mm ) );
label.bot( btex $b$ etex, (xpart C, -mm ) );


endfig;
end