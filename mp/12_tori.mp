verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
etex

input mydefs;

u:=0.8cm;
v := 0.3u;

vardef proj( expr x, y, z )=
(x,z+0.4*y) enddef;

vardef f( expr x, y, h )=
proj( u*((3+cosd( y ))*cosd(x)), 
u*( (3+cosd(y) )*sind(x) ), u*( sind(y) +h ) )
enddef;

pair a[][];

path masche[];

vardef drawcycle( expr istart, istop, jstart, jstop, col )=
masche1 := a[istart][jstart] for i=istart+1 upto istop: 
--a[i][jstart] endfor;
masche2 := a[istop][jstart] for j=jstart+1 upto jstop: 
--a[istop][j] endfor;
masche3 := a[istop][jstop] for i=istop-1 step -1 until istart: 
--a[i][jstop] endfor;
masche4 := a[istart][jstop] for j=jstop-1 step -1 until jstart: 
--a[istart][j] endfor;
fill masche1--masche2--masche3--masche4--cycle withcolor col;
draw masche1--masche2--masche3--masche4;
enddef;

beginfig(1);

pickup pencircle scaled 0.2pt;

Mi := 60;
Mj := 40;
dxi := 360/Mi;
dxj := 360/Mj;

skip := 2;

for i=0 upto Mi:
for j=0 upto Mj:
a[i][j] := f( i*dxi, j*dxj, 0 );
endfor; 
endfor;

pair A,B,C,D;

A := f( 46*dxi, 2*dxj, -3 );
B := f( 56*dxi, 2*dxj, -3 );
C := f( 56*dxi, 10*dxj, -3 );
D := f( 46*dxi, 10*dxj, -3 );

B := B shifted (0,-0.2u);
C := C shifted (0,-0.2u);

fill A--B--C--D--cycle withcolor 0.8 white;
draw A--B--C--D--cycle;

draw A--a[46][2] dashed evenly;
draw B--a[56][2] dashed evenly;
draw C--a[56][10] dashed evenly;
draw D--a[46][10] dashed evenly;

for j=40-skip step -skip until 20:
for i=0 step skip until Mi/2-skip:
drawcycle( i, i+skip, j, j+skip, white );
endfor;
endfor;

for j=0 step skip until 20-skip:
for i=0 step skip until Mi/2-skip:
drawcycle( i, i+skip, j, j+skip, white );
endfor;
endfor;

for j=20 step skip until 40-skip:
for i=Mi/2 step skip until Mi-skip:
drawcycle( i, i+skip, j, j+skip, white );
endfor;
endfor;

for j=20 step -skip until 0:
for i=Mi/2 step skip until Mi-skip:
drawcycle( i, i+skip, j, j+skip, white );
endfor;
endfor;

drawcycle( 46, 56, 2, 10, 0.8 white );


path d;

d := (-u,-0.5u)..(u,-0.5u)--(u,0.5u)--(-u,0.5u)--cycle;

d := d scaled 1.8 shifted (-4u,-3.4u);
fill d withcolor 0.8 white;
draw d;

pickup pencircle scaled 0.5pt;

drawarrow ( (point 1.3 of d)+(4,0) )--0.3[A,D]-(4,0);
drawarrow 0.7[A,D]-(4,0)--( (point 1.7 of d)+(4,0) );
drawarrow ( (point 2.2 of d)-(0,7) )--a[46][2]+(7,7);
drawarrow 1/2[A,C]--1/2[A,C] shifted (0,u);

label.top( btex $\alpha$ etex, 1/6[point 2.2 of d-(0,7),a[46][2]+(7,7)]+(0,1));
label.top( btex $\psi$ etex, 1/2[(point 1.7 of d)+(4,0),0.7[A,D]-(4,0)]);
label.bot( btex $\widetilde{\alpha}$ etex, 
1/2[(point 1.3 of d)+(4,0),0.3[A,D]-(4,1)]);

label.rt( btex $g$ etex, 1/2[A,C] shifted (1,0.9u) ); 

label.urt( btex $D'$ etex, point 0 of d + (0,1) );
label.ulft( btex $U'$ etex, B-(6,0) );




endfig;
end