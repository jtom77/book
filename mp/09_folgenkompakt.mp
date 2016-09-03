verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

vardef myrk( expr x )=
draw x withpen pencircle scaled 3.5pt;
draw x withpen pencircle scaled 1.5pt withcolor white;
enddef;

u := 1.5cm;

beginfig(1);

pickup pencircle scaled 0.3pt;

labeloffset := 1.5pt;

pair a[];
pair b[];

path d;
d := (5.8u,-0.2u)--(8.7u,-0.2u)--(8.7u,1.2u)--(5.8u,1.2u)--cycle;
fill d withcolor 0.9 white;
draw d;

for i=1 upto 12:
a[i] := (5*(2u-u/sqrt(i)),0);
b[i] := (5*(2u-u/sqrt((i+0.5))), u );
%draw a[i]--b[i];
endfor;

for i=1 upto 11:
%draw a[i]--b[i]--a[i+1];
myrk( 1/4[a[i],b[i]] );
myrk( 1/2[a[i],b[i]] );
myrk( 3/4[a[i],b[i]] );
myrk( 1/4[a[i+1],b[i]] );
myrk( 1/2[a[i+1],b[i]] );
myrk( 3/4[a[i+1],b[i]] );
myrk( a[i] );
myrk( b[i] );
endfor;

myrk( a[12] );


clip currentpicture to d;


endfig;
end