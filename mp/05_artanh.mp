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
vardef tanh( expr x ) = sinh(x)/cosh(x) enddef;

u:=0.7cm;

beginfig(1);

pickup pencircle scaled 0.6pt;

xstart := -2;
xstop := 2;
ystart := -2.6;
ystop := 2.6;

pair a[];
pair b[];
path c;
path d;

M := 100;
xmin := ystart;
xmax := ystop;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := u*( tanh(xmin+i*dx), xmin+i*dx );
endfor 

c := a0 for i=1 upto M: --a[i] endfor;
draw c cutbefore ( (-10u,ystart*u)--(10u,ystart*u) ) 
cutafter ( (-10u,ystop*u)--(10u,ystop*u) ) 
withpen pencircle scaled 0.6pt;


drawarrow (xstart*u,0)--(xstop*u,0);
drawarrow (0,ystart*u)--(0,ystop*u);

draw (u,ystart*u)--(u,-4mm) dashed evenly;
draw (u,0)--(u,ystop*u) dashed evenly;
draw (-u,ystart*u)--(-u,ystop*u) dashed evenly;

draw (u,-mm)--(u,0);
draw (-mm,u)--(0,u);

labeloffset := 1pt;

draw (-2mm,u) withpen pensquare scaled 2mm withcolor white;
label.lft( btex $1$ etex, (-mm,u) );
label.bot( btex $1$ etex, (u,-mm) );
label.rt( btex $\mathrm{artanh}$ etex, (u,2u) );



endfig;
end