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

u:=0.6cm;

beginfig(1);

pickup pencircle scaled 0.6pt;

xstart := -3.3;
xstop := 3.3;
ystart := -2.4;
ystop := 2.6;

pair a[];
pair b[];
path c;
path d;

M := 100;
xmin := xstart;
xmax := xstop;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := u*( sinh(xmin+i*dx), xmin+i*dx   );
endfor 

c := a0 for i=1 upto M: --a[i] endfor;
draw c withpen pencircle scaled 0.6pt;

drawarrow (xstart*u,0)--(xstop*u,0);
drawarrow (0,ystart*u)--(0,ystop*u);

clip currentpicture to 
( (xstart*u,ystart*u)--(xstop*u,ystart*u)
--(xstop*u,ystop*u)--(xstart*u,ystop*u)--cycle );

draw (u,-mm)--(u,0);
draw (-mm,u)--(0,u);

labeloffset := 1pt;

draw (-2mm,u) withpen pensquare scaled 2mm withcolor white;
label.lft( btex $1$ etex, (-mm-1,u) );
label.bot( btex $1$ etex, (u,-mm-1) );
label.ulft( btex $\mathrm{arsinh}$ etex, ( sinh(1.6)*u,1.6u ));



endfig;
end