verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

vardef myrk( expr x )=
draw x withpen pencircle scaled 3.5pt;
draw x withpen pencircle scaled 2pt withcolor white;
enddef;

u := .4cm;

beginfig(1);

pickup pencircle scaled 0.3pt;

labeloffset := 1.5pt;

pair a[];
pair b[][];

a0 := (5u,0);

for i=1 upto 100:
a[i] := a[i-1] scaled 0.95;
a[i] := a[i] rotatedabout( (0,0), 20 );
endfor;

draw a0 for i=1 upto 100: ..a[i] endfor;

for i=0 upto 100:
myrk( a[i] );
endfor;


pair p;
for i=0 upto 300:
p := (0.5*u*(-10+uniformdeviate(20)), 0.5*u*(-7+uniformdeviate(17) ) );
myrk( p );
endfor; 

path d;
d := (-5.2u,-0.7*5.2u)--(5.2u,-0.7*5.2u)--(5.2u,5.2u)--(-5.2u,5.2u)--cycle;

draw d;

endfig;
end