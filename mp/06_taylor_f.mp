verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

vardef exp( expr x ) = mexp(256)**x enddef;

u:= 0.8cm;
v := 2*u;
numeric min;
numeric max;

beginfig(1);

pickup pencircle scaled 0.3pt;

labeloffset := 1.5pt;

pair a[];

M := 100;
xmin :=0.01;
xmax :=3;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := ( u*(xmin+i*dx), v*exp( -1/(xmin+i*dx) ) );
endfor 

draw a0 for i=1 upto M: --a[i] endfor withpen pencircle scaled 1pt;
draw (-3u,0)--(0.01u,0) withpen pencircle scaled 1pt;

drawarrow (-3u,0)--(3u,0);
drawarrow (0,-0.5v)--(0,1.2v);

draw (-mm,v)--(0,v);
label.lft( btex $1$ etex, (-mm,v) );


endfig;
end