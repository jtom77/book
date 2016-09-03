verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

u:=0.7cm;
v := 0.3*u;

beginfig(1);

pickup pencircle scaled 0.3pt;

ahlength := 2mm;
ahangle := 30;

path c;

c := (0.3u,u){dir -10}...(6u,4u){dir 75};
draw c; 

pair A,B,M,N;

A := point 0.1 of c;
B := point 0.9 of c;
M := point 0.4 of c;
N := (A--B) intersectionpoint (M--(M+(0,5u)));

draw A--(xpart A,0) dashed withdots scaled 0.5;
draw B--(xpart B,0) dashed withdots scaled 0.5;
draw N--(xpart N,0) dashed withdots scaled 0.5;
draw (xpart A,0)--(xpart A,-mm);
draw (xpart B,0)--(xpart B,-mm);
draw (xpart N,0)--(xpart N,-mm);

draw A--B;
mark( A );
mark( B );
mark( M );
mark( N );

drawarrow (0,0)--(7u,0);

label.top( btex $P_1$ etex, A+(0,1) );
label.top( btex $P_2$ etex, B-(4,-1) );
label.top( btex $P$ etex, N+(0,1) );

label.bot( btex $x_1$ etex, (xpart A,-mm) );
label.bot( btex $x_2$ etex, (xpart B,-mm) );
label.bot( btex $x$ etex, (xpart N,-mm) );




endfig;
end