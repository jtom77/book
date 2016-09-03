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

numeric ppx;
numeric ppy;

vardef proj( expr x, y, z )=
(y-0.5*x,z-0.5*x) enddef;

vardef f( expr x, y )=
3-0.3*x*x-0.5*y*y
enddef;

vardef partialx( expr x,y )=
ppx := -0.6*x-0.5*y**2;
enddef;

vardef partialy( expr x,y )=
ppy := -0.3*x*x-y;
enddef;
 
vardef diff( expr x,y )=
x*ppx+y*ppy
enddef;

u:=1.4cm;
v := 0.3*u;

beginfig(1);

pair a[][];

Mi := 8;
Mj := 8;
xmini := -2;
xmaxi := 2;
xminj := -2;
xmaxj := 2;
dxi := (xmaxi-xmini)/Mi;
dxj := (xmaxj-xminj)/Mj;


for i=0 upto Mi:
for j=0 upto Mj:
a[i][j] := proj( (xmini+i*dxi)*u, (xminj+j*dxj)*u, 
u*f(xmini+i*dxi, xminj+j*dxj ) );
endfor;
endfor;


path c;
for i=0 step 2 until 4-2:
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

for i=4 step 2 until Mi-2:
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

numeric height;
pair t[];

t1 := proj(0,0,3u);
t2 := proj(u,0,3u);
t3 := proj(u,u,3u);
t4 := proj(0,u,3u);

fill t1--t2--t3--t4--cycle withcolor 0.8 white;
draw t1--t2--t3--t4--cycle;

height := (f(1,1)+2.4)*u;
t1 := proj(u,u,-2.4u+height);
t2 := proj(u,2u,-3.7u+height);
t3 := proj(2u,2u,-4.8u+height);
t4 := proj(2u,u,-3.4u+height);

fill t1--t2--t3--t4--cycle withcolor 0.8 white;
draw t1--t2--t3--t4--cycle;


endfig;
end

