verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
etex

input mydefs;

def pi = 3.14159 enddef;

vardef cos( expr x ) = cosd( x*180/pi ) enddef; 
vardef sin( expr x ) = sind( x*180/pi ) enddef;


pickup pencircle scaled 0.2pt;

vardef proj( expr x, y, z )=
(y-0.5*x,z-0.5*x) enddef;

vardef f( expr x, y )=
5*sin(x*y)/(0.2+x**2+y**2)
enddef;

u:=0.5cm;
v := 0.3*u;

beginfig(1);

pair a[][];

Mi := 30;
Mj := 60;
xmini := -4;
xmaxi := 0;
xminj := -4;
xmaxj := 4;
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
c := a[i][j]--a[i][j+1]--a[i][j+2]--a[i+1][j+2]
--a[i+2][j+2]--a[i+2][j+1]--a[i+2][j]--a[i+1][j]--cycle;
fill c withcolor 0.95 white;
draw c withpen pencircle scaled 0.2pt;
endfor;
endfor;

for i=20 step 2 until Mi-2:
for j=0 step 2 until Mj-2:
c := a[i][j]..a[i][j+1]--a[i][j+2]--a[i+1][j+2]
--a[i+2][j+2]--a[i+2][j+1]--a[i+2][j]--a[i+1][j]--cycle;
fill c withcolor 0.95 white;
draw c withpen pencircle scaled 0.2pt;
endfor;
endfor;

drawarrow (0,0)--proj(5.5u,0,0) withpen pencircle scaled 0.6pt;
drawarrow (0,0)--proj(0,5.5u,0) withpen pencircle scaled 0.6pt;
drawarrow (0,0)--proj(0,0,3.7u) withpen pencircle scaled 0.6pt;

Mi := 30;
Mj := 60;
xmini := 0;
xmaxi := 4;
xminj := -4;
xmaxj := 4;
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
c := a[i][j]--a[i][j+1]--a[i][j+2]--a[i+1][j+2]
--a[i+2][j+2]--a[i+2][j+1]--a[i+2][j]--a[i+1][j]--cycle;
fill c withcolor 0.95 white;
draw c withpen pencircle scaled 0.2pt;
endfor;
endfor;

for i=20 step 2 until Mi-2:
for j=0 step 2 until Mj-2:
c := a[i][j]..a[i][j+1]--a[i][j+2]--a[i+1][j+2]
--a[i+2][j+2]--a[i+2][j+1]--a[i+2][j]--a[i+1][j]--cycle;
fill c withcolor 0.95 white;
draw c withpen pencircle scaled 0.2pt;
endfor;
endfor;



label.bot( btex $y$ etex, proj(0,5.5u,0)-(1,1) );
label.lft( btex $x$ etex, proj(5.5u,0,0)+(-1,1) );
label.rt( btex $z$ etex, proj(0,0,3.7u)+(1,-1) );




endfig;
end