verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

def pi = 3.14159 enddef;

vardef exp( expr x ) = mexp(256)**x enddef;
vardef cosh( expr x ) = 0.5*(exp(x)+exp(-x)) enddef; 
vardef sinh( expr x ) = 0.5*(exp(x)-exp(-x)) enddef;
vardef tanh( expr x ) = sinh(x)/cosh(x) enddef;

u:=0.7cm;

beginfig(1);

pickup pencircle scaled 0.6pt;

xstart := -2.3;
xstop := 2.3;
ystart := -1.4;
ystop := 2;

pair a[];
pair b[];
path c;
path d;

M := 100;
xmin := xstart;
xmax := xstop;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := u*( xmin+i*dx, tanh( xmin+i*dx ) );
endfor 

c := a0 for i=1 upto M: --a[i] endfor;
draw c;


drawarrow (xstart*u,0)--(xstop*u,0);
drawarrow (0,ystart*u)--(0,ystop*u);

draw (xstart*u,u)--(xstop*u,u) dashed evenly;
draw (xstart*u,-u)--(xstop*u,-u) dashed evenly;

clip currentpicture to 
( (xstart*u,ystart*u)--(xstop*u,ystart*u)
--(xstop*u,ystop*u)--(xstart*u,ystop*u)--cycle );

draw (u,-mm)--(u,0);
draw (-mm,u)--(0,u);

labeloffset := 1pt;

draw (-2mm,u) withpen pensquare scaled 2mm withcolor white;
label.lft( btex $1$ etex, (-mm,u) );
label.bot( btex $1$ etex, (u,-mm) );
label.top( btex $\tanh$ etex, (-2u,tanh(-2)*u+2) );



endfig;
end