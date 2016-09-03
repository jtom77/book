verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

def pi = 3.14159 enddef;

vardef cos( expr x ) = cosd( x*180/pi ) enddef; 
vardef sin( expr x ) = sind( x*180/pi ) enddef;
vardef f( expr x ) = sin(1/x) enddef;

vardef drawspitz( expr x, y )=
draw (x,0)--(x-1/4*(x-y),-v)--(x-3/4*(x-y),v)--(y,0) withpen 
pencircle scaled 0.3pt;
enddef;

beginfig(1);

u := 5cm;
v := 0.2*u;

pickup pencircle scaled 0.3pt;

labeloffset := 1.5pt;

pair a[];
M := 300;
xmin := 0.05;
xmax := 1;
dx := (xmax-xmin)/M;

for i=0 upto M:
a[i] := (u*(xmin+i*dx), v*f(xmin+i*dx) );
endfor;

draw a0--a1 dashed evenly;

draw a1 for i=2 upto M: --a[i] endfor;

drawarrow (0,0)--(1.2u,0);
drawarrow (0,-1.1v)--(0,1.3v);

draw (u,0)--(u,-mm);
draw (-mm,v)--(0,v);
draw (-mm,-v)--(0,-v);

label.lft( btex $1$ etex, (-mm,v) );
label.lft( btex $-1$ etex, (-mm,-v) );
label.bot( btex $1$ etex, (u,-mm) );

mark( (0,0) );

endfig;
end