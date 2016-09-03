verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
etex

input mydefs;

pickup pencircle scaled 0.2pt;

vardef proj( expr x, y, z )=
(y-0.5*x,z-0.5*x) enddef;

vardef f( expr x, y )=
(y**2)
enddef;

u:=1.4cm;
v := 0.3*u;

beginfig(1);

pair a[][];

Mi := 20;
Mj := 20;
xmini := -1.5;
xmaxi := 1.5;
xminj := -1.5;
xmaxj := 1.2;
dxi := (xmaxi-xmini)/Mi;
dxj := (xmaxj-xminj)/Mj;

for i=0 upto Mi:
for j=0 upto Mj:
a[i][j] := proj( (xmini+i*dxi)*u, (xminj+j*dxj)*u, 
u*f(xmini+i*dxi, xminj+j*dxj ) );
endfor;
endfor;

path c;
for i=0 upto Mi-1:
for j=0 upto Mj-1:
c := a[i][j]--a[i][j+1]--a[i+1][j+1]--a[i+1][j]--cycle;
fill c withcolor white;
draw c withpen pencircle scaled 0.2pt;
endfor;
endfor;

drawarrow (0,0)--proj(4u,0,0);
drawarrow (0,0)--proj(0,4u,0);
drawarrow (0,0)--proj(0,0,3u);

endfig;
end