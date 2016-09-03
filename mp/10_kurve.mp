verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

vardef f( expr t )=
( (t**2)-1, (t**3)-t )
enddef;

u := 0.9cm;

beginfig(1);

pickup pencircle scaled 0.2pt;


drawarrow (-2u,0)--(3u,0);
drawarrow (0,-3u)--(0,3u);

pair a[];

M := 100;
xmin := -2; xmax :=2;
dx := (xmax-xmin)/M;

for i=0 upto M:
a[i] := f( xmin+i*dx )*u;
endfor;

draw a0 for i=1 upto M: --a[i] endfor withpen pencircle scaled 0.4pt;

clip currentpicture to ( 
(-2u,-3u)--(3u,-3u)--(3u,3u)--(-2u,3u)--cycle
);

draw ( (0,0) ) withpen pencircle scaled 5pt withcolor white;
draw ( (0,0) ) withpen pencircle scaled 2pt;

label.rt( btex $\gamma$ etex, a[10] );

endfig;
end