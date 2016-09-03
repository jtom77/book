verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

def pi = 3.14159 enddef;

vardef log( expr x ) = 0.2*(x**2) enddef;

u:=0.9cm;
v := 0.3*u;

beginfig(1);

path d;
path c;
path e;

pair a[];
M := 100;
xmin := 1;
xmax := 4;
dx := (xmax-xmin)/M;

for i=0 upto M:
a[i] := (xmin+i*dx, log( xmin+i*dx) )*u;
endfor;
c := a0 for i=1 upto M: --a[i] endfor;

draw c;
drawarrow (0,0)--(4u,0);



numeric s,t;




endfig;
end