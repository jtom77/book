verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex



u:=cm;
v := 0.3*u;
numeric min;
numeric max;

beginfig(1);

labeloffset := 1.5pt;

pair a[];
path c;
path d;
path e;

M := 100;
xmin := 1/sqrt(2);
xmax := 4;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := (xmin+i*dx, 1/( (xmin+i*dx)**2 ) )*u;
endfor;

c := a0 for i=1 upto M: --a[i] endfor;
d := (3u,5u)--(4u,0)--(u,0)--(u,5u);

e := buildcycle( d,c );

fill e withcolor 0.9 white;

drawarrow (0,0)--(4u,0);
drawarrow (0,0)--(0,2u);

draw c;
draw (u,-mm)--(u,u);

labeloffset := 1.5pt;
label.bot( btex $1$ etex, (u,-mm) );
label.top( btex $Z$ etex, (1.3u,mm) );

endfig;
end