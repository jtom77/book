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
(x**2)+(y**4)
enddef;


u:=1.4cm;
v := 0.3*u;

beginfig(1);

pair a[][];

Mi := 40;
Mj := 40;
xmini := -1.5;
xmaxi := 1.5;
xminj := -1.1;
xmaxj := 1.1;
dxi := (xmaxi-xmini)/Mi;
dxj := (xmaxj-xminj)/Mj;


for i=0 upto Mi:
for j=0 upto Mj:
a[i][j] := proj( (xmini+i*dxi)*u, (xminj+j*dxj)*u, 
u*f(xmini+i*dxi, xminj+j*dxj ) );
endfor;
endfor;


path c;
for i=0 step 2 until 20-2:
for j=0 step 2 until Mj-2:
c := a[i][j]..a[i][j+1]..a[i][j+2]--a[i+1][j+2]
..a[i+2][j+2]--a[i+2][j+1]..a[i+2][j]--a[i+1][j]--cycle;
fill c withcolor 0.9 white;
draw c withpen pencircle scaled 0.2pt;
endfor;
endfor;

drawarrow (0,0)--proj(3u,0,0);
drawarrow (0,0)--proj(0,3u,0);
drawarrow (0,0)--proj(0,0,4u);

for i=20 step 2 until Mi-2:
for j=0 step 2 until Mj-2:
c := a[i][j]..a[i][j+1]..a[i][j+2]--a[i+1][j+2]
..a[i+2][j+2]--a[i+2][j+1]..a[i+2][j]--a[i+1][j]--cycle;
fill c withcolor 0.9 white;
draw c withpen pencircle scaled 0.2pt;
endfor;
endfor;

label.bot( btex $y$ etex, proj(0,3u,0)-(1,1) );
label.lft( btex $x$ etex, proj(3u,0,0)+(-1,1) );
label.rt( btex $z$ etex, proj(0,0,4u)+(1,-1) );


endfig;
end