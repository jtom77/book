verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

pickup pencircle scaled 0.2pt;

u:=1.2cm;
v := 0.6*u;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fill (0,0)--(3v,0)--(3v,4v)--(0,4v)--cycle withcolor 0.9 white;

for i=0 upto 3:
draw (i*v,0)--(i*v,4*v);
endfor;

for i=0 upto 4:
draw (0,i*v)--(3*v,i*v);
endfor;


for i=0 upto 2:
fill (i*v,v)--((i+1)*v,v)--((i+1)*v,2*v)--(i*v,2*v)--cycle withcolor white;
draw (i*v,v)--((i+1)*v,v)--((i+1)*v,2*v)--(i*v,2*v)--cycle;
drawarrow (i*v,v)--((i+1)*v,v) withpen pencircle scaled 0.6pt;
drawarrow (i*v,v)--(i*v,2*v) withpen pencircle scaled 0.6pt;
mark( (i*v,v) );
endfor;

label.lft( btex $p$ etex, (-2,v) );

pair lab[];
lab1 := (0.7v,v);
lab2 := lab1 shifted (-1.1v,-0.5v);
draw lab1--lab2;

label.lft( btex $\Delta x_1 \cdot e_1$ etex, lab2-(1,0) );

lab1 := (0,1.7v);
lab2 := lab1 shifted (-0.4v,0.3v);

draw lab1--lab2;

label.lft( btex $\Delta x_2 \cdot e_2$ etex, lab2-(1,0));
label( btex $\sigma_p$ etex, (0.5v,1.5v) );
label( btex $Q'\subset V$ etex, (1.5v,-0.3u) );

picture pic;
pic := currentpicture;
currentpicture := nullpicture; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vardef proj( expr x, y, z )=
(y-0.6*x,z-0.3*x) enddef;

vardef f( expr x, y )=
-0.2*((0.5+x)**2)-0.2*(y**2)+sind(10*y*x)
enddef;



beginfig(1);

pickup pencircle scaled 0.2pt;

pair a[][];
M := 20;
xmin := -2; 
xmax := 2;
dx := (xmax-xmin)/M;
pair b;
numeric p[];
for i=0 upto M:
for j=0 upto M:
p1 := xmin+i*dx;
p2 := xmin+j*dx;
p3 := f(p1,p2);
a[i][j] := proj(u*p1,u*p2,u*p3 );
endfor;
endfor;



path c;
for i=0 step 4 until M-6:
for j=4 step 4 until M-6:
c := a[i][j]..a[i+1][j]..a[i+2][j]..a[i+3][j]..a[i+4][j]
--a[i+4][j]..a[i+4][j+1]..a[i+4][j+2]..a[i+4][j+3]..a[i+4][j+4]
--a[i+4][j+4]..a[i+3][j+4]..a[i+2][j+4]..a[i+1][j+4]..a[i][j+4]
--a[i][j+4]..a[i][j+3]..a[i][j+2]..a[i][j+1]..a[i][j]--cycle;
fill c withcolor 0.9 white;
draw c;
endfor;
endfor;


pair A, B, C, D;
pair t[];
pair int;
numeric r[];

path d,e;

numeric l[][];
l[4][1] := 0.85;
l[4][2] := 0.75;
l[8][1] := 0.8;
l[8][2] := 0.7;
l[12][1] := 0.8;
l[12][2] := 0.6;



for k=4 step 4 until 12:
d := a[12][0] for j=0 upto M: ..a[12][j] endfor;
e := a[0][k] for i=0 upto M: ..a[i][k] endfor;
A := d intersectionpoint e;
int := d intersectiontimes e;
r1 := xpart int;
r2 := ypart int;
t1 := l[k][1]*u*unitvector( direction r1 of d );
t2 := -l[k][2]*u*unitvector( direction r2 of e );
B := A+t1;
C := B+t2;
D := A+t2;
fill A--B--C--D--cycle withcolor white;
draw A--B--C--D--cycle;
drawarrow A--B withpen pencircle scaled 0.6pt;
drawarrow A--D withpen pencircle scaled 0.6pt;
mark( A );
if( k=4 ):
lab1 := 0.7[A,B];
lab2 := lab1 shifted (-0.8u,0.2u);
draw lab1--lab2;
label.lft( btex $\Delta x_1 \cdot \partial_1 \alpha(p)$ etex, lab2-(1,0) );
lab1 := 0.7[A,D];
lab2 := lab2 shifted (0,0.6u);
draw lab1--lab2;
label.lft( btex $\Delta x_2 \cdot \partial_2 \alpha(p)$ etex, lab2-(1,0) );
label.lft( btex $\alpha(p)$ etex, A-(2,0) );
fi; 
endfor;

draw pic shifted (-6u,-1.5u);

label( btex $Q\subset U$ etex, (-0.5u,-1.5u) );

endfig;
end