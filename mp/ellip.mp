verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex


u:=2cm;

vardef f( expr x ) = sqrt( x*x*(x+1) ) enddef;

beginfig(1)

pair a[];
pair b[];

numeric M, dx;

M := 100; dx := 3.0/M;

for i=0 upto M:
a[i] := (-1+i*dx, f(-1+i*dx))*u;
b[i] := (xpart a[i], -ypart a[i]);
endfor;

path s;

pickup pencircle scaled 2;
draw a[0] for i=1 upto M: --a[i] endfor;
draw b[0] for i=1 upto M: --b[i] endfor;


endfig;
end