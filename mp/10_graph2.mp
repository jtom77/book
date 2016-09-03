verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

pickup pencircle scaled 0.2pt;

vardef proj( expr x, y, z )=
(y-0.5*x,z-0.5*x) enddef;

vardef f( expr x, y )=
(x**2)-(y**3)
enddef;

vardef g( expr x, y )=
(x**2)+(y**4)
enddef;

vardef h( expr x, y )=
(x**2)
enddef;


u:=0.6cm;
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
for i=0 step 4 until 20-4:
for j=0 step 4 until Mj-4:
c := a[i][j]..a[i][j+1]..a[i][j+2]..a[i][j+3]..a[i][j+4]
--a[i+1][j+4]..a[i+2][j+4]..a[i+3][j+4]..a[i+4][j+4]
--a[i+4][j+3]..a[i+4][j+2]..a[i+4][j+1]..a[i+4][j]
--a[i+3][j]..a[i+2][j]..a[i+1][j]..a[i][j]--cycle;
fill c withcolor 0.95 white;
draw c withpen pencircle scaled 0.2pt;
endfor;
endfor;

drawarrow (0,0)--proj(3u,0,0);
drawarrow (0,0)--proj(0,3u,0);
drawarrow (0,0)--proj(0,0,4u);

for i=20 step 4 until Mi-4:
for j=0 step 4 until Mj-4:
c := 
a[i][j]..a[i][j+1]..a[i][j+2]..a[i][j+3]..a[i][j+4]
--a[i+1][j+4]..a[i+2][j+4]..a[i+3][j+4]..a[i+4][j+4]
--a[i+4][j+3]..a[i+4][j+2]..a[i+4][j+1]..a[i+4][j]
--a[i+3][j]..a[i+2][j]..a[i+1][j]..a[i][j]--cycle;
fill c withcolor 0.95 white;
draw c withpen pencircle scaled 0.2pt;
endfor;
endfor;

label.bot( btex $y$ etex, proj(0,3u,0)-(2,2) );
label.lft( btex $x$ etex, proj(3u,0,0)+(-1,1) );
label.rt( btex $h(x,y)$ etex, proj(0,0,4u)+(2,-2) );

picture first;
first := currentpicture;
currentpicture := nullpicture;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


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
u*g(xmini+i*dxi, xminj+j*dxj ) );
endfor;
endfor;



path c;
for i=0 step 4 until 20-4:
for j=0 step 4 until Mj-4:
c := a[i][j]..a[i][j+1]..a[i][j+2]..a[i][j+3]..a[i][j+4]
--a[i+1][j+4]..a[i+2][j+4]..a[i+3][j+4]..a[i+4][j+4]
--a[i+4][j+3]..a[i+4][j+2]..a[i+4][j+1]..a[i+4][j]
--a[i+3][j]..a[i+2][j]..a[i+1][j]..a[i][j]--cycle;
fill c withcolor 0.95 white;
draw c withpen pencircle scaled 0.2pt;
endfor;
endfor;

drawarrow (0,0)--proj(3u,0,0);
drawarrow (0,0)--proj(0,3u,0);
drawarrow (0,0)--proj(0,0,4u);

for i=20 step 4 until Mi-4:
for j=0 step 4 until Mj-4:
c := 
a[i][j]..a[i][j+1]..a[i][j+2]..a[i][j+3]..a[i][j+4]
--a[i+1][j+4]..a[i+2][j+4]..a[i+3][j+4]..a[i+4][j+4]
--a[i+4][j+3]..a[i+4][j+2]..a[i+4][j+1]..a[i+4][j]
--a[i+3][j]..a[i+2][j]..a[i+1][j]..a[i][j]--cycle;
fill c withcolor 0.95 white;
draw c withpen pencircle scaled 0.2pt;
endfor;
endfor;

label.bot( btex $y$ etex, proj(0,3u,0)-(2,2) );
label.lft( btex $x$ etex, proj(3u,0,0)+(-1,1) );
label.rt( btex $f(x,y)$ etex, proj(0,0,4u)+(2,-2) );


picture sec;
sec := currentpicture;
currentpicture := nullpicture;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



Mi := 40;
Mj := 40;
xmini := -1.5;
xmaxi := 1.5;
xminj := -1.5;
xmaxj := 1.5;
dxi := (xmaxi-xmini)/Mi;
dxj := (xmaxj-xminj)/Mj;


for i=0 upto Mi:
for j=0 upto Mj:
a[i][j] := proj( (xmini+i*dxi)*u, (xminj+j*dxj)*u, 
u*h(xmini+i*dxi, xminj+j*dxj ) );
endfor;
endfor;


path c;
for i=0 step 4 until 20-4:
for j=0 step 4 until Mj-4:
c := a[i][j]..a[i][j+1]..a[i][j+2]..a[i][j+3]..a[i][j+4]
--a[i+1][j+4]..a[i+2][j+4]..a[i+3][j+4]..a[i+4][j+4]
--a[i+4][j+3]..a[i+4][j+2]..a[i+4][j+1]..a[i+4][j]
--a[i+3][j]..a[i+2][j]..a[i+1][j]..a[i][j]--cycle;
fill c withcolor 0.95 white;
draw c withpen pencircle scaled 0.2pt;
endfor;
endfor;

drawarrow (0,0)--proj(3u,0,0);
drawarrow (0,0)--proj(0,3u,0);
drawarrow (0,0)--proj(0,0,4u);

for i=20 step 4 until Mi-4:
for j=0 step 4 until Mj-4:
c := 
a[i][j]..a[i][j+1]..a[i][j+2]..a[i][j+3]..a[i][j+4]
--a[i+1][j+4]..a[i+2][j+4]..a[i+3][j+4]..a[i+4][j+4]
--a[i+4][j+3]..a[i+4][j+2]..a[i+4][j+1]..a[i+4][j]
--a[i+3][j]..a[i+2][j]..a[i+1][j]..a[i][j]--cycle;
fill c withcolor 0.95 white;
draw c withpen pencircle scaled 0.2pt;
endfor;
endfor;


label.bot( btex $y$ etex, proj(0,3u,0)-(2,2) );
label.lft( btex $x$ etex, proj(3u,0,0)+(-1,1) );
label.rt( btex $g(x,y)$ etex, proj(0,0,4u)+(2,-1) );


draw first shifted (7u,0);
draw sec shifted (-7u,0);



endfig;
end