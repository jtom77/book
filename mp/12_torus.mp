verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
etex

input mydefs;

u:=2cm;
v := 0.4u;

vardef proj( expr x, y, z )=
(x,z+0.4*y) enddef;

vardef f( expr x, y )=
proj( u*((3+cosd( y ))*cosd(x)), 
u*( (3+cosd(y) )*sind(x) ), u*( sind(y) ) )
enddef;

beginfig(1);

ahlength :=mm;

pair a[][];

Mi := 40;
Mj := 20;
dxi := 360/Mi;
dxj := 360/Mj;

for i=0 upto Mi:
for j=0 upto Mj:
a[i][j] := f( i*dxi, j*dxj );
endfor; 
endfor;

path g;

for j=18 step -2 until 10:
for i=0 upto Mi/2-1:
a[i][j]..a[i][j+1]..a[i][j+2]
--a[i][j+2]..a[i+1][j+2]..a[i+2][j+2]
--a[i+2][j+2]..a[i+2][j+1]..a[i+2][j]
--a[i+2][j]..a[i+1][j]..a[i][j]--cycle;
fill g withcolor white;
draw g;
endfor;
endfor;

for j=0 step 2 until 10:
for i=0 step 2 until Mi/2-2:
g := a[i][j]..a[i][j+1]..a[i][j+2]
--a[i][j+2]..a[i+1][j+2]..a[i+2][j+2]
--a[i+2][j+2]..a[i+2][j+1]..a[i+2][j]
--a[i+2][j]..a[i+1][j]..a[i][j]--cycle;
fill g withcolor white;
draw g;
endfor;
endfor;

for j=10 step 2 until 18:
for i=Mi/2 step 2 until Mi-1:
g := a[i][j]..a[i][j+1]..a[i][j+2]
--a[i][j+2]..a[i+1][j+2]..a[i+2][j+2]
--a[i+2][j+2]..a[i+2][j+1]..a[i+2][j]
--a[i+2][j]..a[i+1][j]..a[i][j]--cycle;
fill g withcolor white;
draw g;
endfor;
endfor;

for j=10 step -2 until 0:
for i=Mi/2 step 2 until Mi-2:
g := a[i][j]..a[i][j+1]..a[i][j+2]
--a[i][j+2]..a[i+1][j+2]..a[i+2][j+2]
--a[i+2][j+2]..a[i+2][j+1]..a[i+2][j]
--a[i+2][j]..a[i+1][j]..a[i][j]--cycle;
fill g withcolor white;
draw g;
endfor;
endfor;

path d[];

d1 := a[31][1] for i=32 upto 37: --a[i][1] endfor;
d2 := a[37][1] for i=2 upto 4: --a[37][i] endfor;
d3 := a[37][4] for i=36 step -1 until 31: --a[i][4] endfor;
d4 := a[31][4] for i=3 step -1 until 1: --a[31][i] endfor;


fill d1--d2--d3--d4--cycle withcolor 0.8 white;
draw d1--d2--d3--d4--cycle;

pair A, B, C, D;
A := a[31][1];
B := a[37][1];
C := a[37][4];
D := a[31][4];

draw A--(xpart A, -3u);
draw B--(xpart B, -3u);
draw C--(xpart C, -3u);
draw D--(xpart D, -3u);

fill (xpart A, -3u)--(xpart B, -3u)--(xpart C, -3u)--(xpart D, -3u)--cycle 
withcolor 0.8 white;



endfig;

end