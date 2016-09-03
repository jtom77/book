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

c := (0,0.1u){dir 80}...(0.6u,0.3u){dir -45};
c := c shifted (5,0);
draw subpath(0.1,1) of c withpen pencircle scaled 0.6pt;

numeric h;

h := directiontime (u,0) of c;

pair A, B, C;
 
A := point (h-0.4) of c;
B := point h of c;
C := point (h+0.25) of c;

draw (B-(0.3u,0))--(B+(0.2u,0)) dashed evenly;
draw (A-0.1u*unitvector( B-A ) )--(B+0.1u*unitvector( B-A ) );
draw (C-0.06u*unitvector( B-C ) )--(B+0.1u*unitvector( B-C ) );

draw A--(xpart A, 0) dashed withdots scaled 0.5;
draw B--(xpart B, 0) dashed withdots scaled 0.5;
draw C--(xpart C, 0) dashed withdots scaled 0.5;
draw (xpart A,0)--(xpart A,-mm);
draw (xpart B,0)--(xpart B,-mm);
draw (xpart C,0)--(xpart C,-mm);

mark( A );
mark( B );
mark( C );

drawarrow (0,0)--(0.7u,0);

%label.bot( btex $x_0-delta_1$ etex, (xpart A, -mm ) );
label.bot( btex $x_0$ etex, (xpart B, -mm ) );
%label.bot( btex $x_0+delta_2$ etex, (xpart B, -mm ) );



endfig;
end