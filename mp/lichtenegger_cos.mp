verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
etex

input mydefs;

numeric pi; pi := 3.14159;

vardef cos( expr x ) = cosd( x*180/pi ) enddef;
vardef exp( expr x ) = ((mexp 256)**x ) enddef;
vardef cosh( expr x )= 1/2*(exp(x)+exp(-x)) enddef;
vardef f( expr x, y )=  sqrt(0.5*(cos(2*x)+cosh(2*y))) enddef;

pickup pencircle scaled 0.2pt;

vardef proj( expr x, y, z )=
(y-0.5*x,z-0.5*x) enddef;



u:=1.4cm;
v := 0.3*u;

beginfig(1);

pair a[][];

Mi := 30;
Mj := 30;
xmini := -4;
xmaxi := 4;
xminj := -2.2;
xmaxj := 2.2;
dxi := (xmaxi-xmini)/Mi;
dxj := (xmaxj-xminj)/Mj;

numeric r[][];

for i=0 upto Mi:
for j=0 upto Mj:
a[i][j] := proj( (xmini+i*dxi)*u, (xminj+j*dxj)*u, 
u*f(xmini+i*dxi, xminj+j*dxj ) );
endfor;
endfor;

draw (0,0)--proj(3u,0,0);
draw (0,0)--proj(0,3u,0);

path c;
for i=0 upto floor(Mi/2):
for j=0 upto Mj-1:
c := a[i][j]--a[i][j+1]--a[i+1][j+1]--a[i+1][j]--cycle;
fill c withcolor blue;
draw c withpen pencircle scaled 0.2pt;
draw a[i][j];
endfor;
endfor;

draw (0,0)--proj(0,0,4u);
draw a[0][0] for i=1 upto Mi: --a[i][0] endfor;



path c;
for i=floor(Mi/2)+1 upto Mi-1:
for j=0 upto Mj-1:
c := a[i][j]--a[i][j+1]--a[i+1][j+1]--a[i+1][j]--cycle;
fill c withcolor blue;
draw c withpen pencircle scaled 0.2pt;
endfor;
endfor;

draw a[Mi][0] for j=1 upto Mj: --a[Mi][j] endfor;
draw a[0][Mj] for i=1 upto Mi: --a[i][Mj] endfor; 
draw a[0][0] for j=1 upto Mj: --a[0][j] endfor;


dx := 36;
h := 2.7*u;
w := 0.08*u;
for i=0 upto 9:
fill proj(3u,0,0)--proj(h,w*cosd(i*dx),w*sind(i*dx))--proj(h,w*cosd((i+1)*dx),w*sind((i+1)*dx))--cycle;
fill proj(0,3u,0)--proj(w*cosd(i*dx),h,w*sind(i*dx))--proj(w*cosd((i+1)*dx),h,w*sind((i+1)*dx))--cycle;
fill proj(0,0,4u)--proj(w*cosd(i*dx),w*sind(i*dx),h+u)--proj(w*cosd((i+1)*dx),w*sind((i+1)*dx),h+u)--cycle;
endfor;




endfig;
end