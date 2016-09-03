verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
etex

input mydefs;

pickup pencircle scaled 0.2pt;

vardef proj( expr x, y, z )=
(y-0.4*x,z-0.3*x-0.2*y) enddef;

vardef f( expr x, y )=
(y*y)+(x*x)
enddef;

u:=1.4cm;
v := 0.3*u;

beginfig(1);

pair a[][];

Mi := 40;
Mj := 40;
xmini := 0;
xmaxi := 2;
xminj := -1.5;
xmaxj := 1.2;
dxi := (xmaxi-xmini)/Mi;
dxj := (xmaxj-xminj)/Mj;

path c, d;

stp := 5;

for j=0 step stp until 180:
for i=0 upto Mi:
A := sind(j)*(xmini+i*dxi);
B := cosd(j)*(xmini+i*dxi);
a[i][0] := proj( u*A, u*B, u*f(A,B) );
A := sind(j+stp)*(xmini+i*dxi);
B := cosd(j+stp)*(xmini+i*dxi);
a[i][1] := proj( u*A, u*B, u*f(A,B) );
endfor;
c := a[0][0] for i=1 upto Mi: --a[i][0] endfor;
d := a[Mi][1] for i=Mi-1 step -1 until 0: --a[i][1] endfor;
fill c--d--cycle withcolor (0.01*(2*j mod(400)),0.01*(j mod(200)),0.01*(3*j mod(600)) );
draw c--d--cycle;
endfor;

for j=0 step stp until 180:
for i=0 upto Mi:
A := -sind(j)*(xmini+i*dxi);
B := cosd(j)*(xmini+i*dxi);
a[i][0] := proj( u*A, u*B, u*f(A,B) );
A := -sind(j+stp)*(xmini+i*dxi);
B := cosd(j+stp)*(xmini+i*dxi);
a[i][1] := proj( u*A, u*B, u*f(A,B) );
endfor;
c := a[0][0] for i=1 upto Mi: --a[i][0] endfor;
d := a[Mi][1] for i=Mi-1 step -1 until 0: --a[i][1] endfor;
fill c--d--cycle withcolor (0.01*(2*j mod(400)),0.01*(j mod(200)),0.01*(3*j mod(600)) );
draw c--d--cycle;
endfor;




drawarrow (0,0)--proj(4u,0,0);
drawarrow (0,0)--proj(0,4u,0);
drawarrow (0,0)--proj(0,0,3u);


endfig;
end