verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

def pi = 3.14159 enddef;

vardef exp( expr x ) = mexp(256)**x enddef;
vardef cosh( expr x ) = 0.5*(exp(x)+exp(-x)) enddef; 
vardef sinh( expr x ) = 0.5*(exp(x)-exp(-x)) enddef;

u:=0.55cm;

beginfig(1);

pickup pencircle scaled 0.6pt;

xstart := -2.3;
xstop := 2.3;
ystart := -3.7;
ystop := 3.7;

pair a[];
pair b[];
path c;
path d;

M := 100;
xmin := xstart;
xmax := xstop;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := u*( xmin+i*dx, cosh(xmin+i*dx)  );
b[i] := u*( xmin+i*dx, sinh( xmin+i*dx ) );
endfor 

c := a0 for i=1 upto M: --a[i] endfor;
d := b0 for i=1 upto M: --b[i] endfor;
draw c withpen pencircle scaled 0.6pt;
draw d withpen pencircle scaled 0.6pt;

drawarrow (xstart*u,0)--(xstop*u,0);
drawarrow (0,ystart*u)--(0,ystop*u);

clip currentpicture to 
( (xstart*u,ystart*u)--(xstop*u,ystart*u)
--(xstop*u,ystop*u)--(xstart*u,ystop*u)--cycle );

draw (u,-mm)--(u,0);
draw (-mm,u)--(0,u);

labeloffset := 1pt;

draw (-2mm,u) withpen pensquare scaled 2mm withcolor white;
label.lft( btex $1$ etex, (-mm,u) );
label.bot( btex $1$ etex, (u,-mm) );
label.rt( btex $\sinh$ etex, (-1.8u+4,sinh(-1.7)*u) );
label.rt( btex $\cosh$ etex, (-1.8u+4,cosh(-1.7)*u) );


endfig;
end