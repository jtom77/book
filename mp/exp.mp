verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
etex

input mydefs;

pickup pencircle scaled 0.2pt;

vardef proj( expr x, y, z )=
(y-0.7*x,z-0.3*x-0.15*y) enddef;

numeric pi; pi := 3.14159;

vardef exp( expr x ) = ((mexp 256)**x ) enddef;
vardef f( expr x, y )= exp(x) enddef;
vardef sin( expr x ) = sind( x*180/pi ) enddef;
vardef exp( expr x ) = ((mexp 256)**x ) enddef;
vardef cos( expr x ) = cosd( x*180/pi ) enddef;
vardef sin( expr x ) = sind( x*180/pi ) enddef;

vardef Re(expr x, y ) = cos(y) enddef;
vardef Im(expr x, y ) = sin(y) enddef;


u:=0.62cm;
v := 0.3*u;

beginfig(1);

pair a[][];


xstart := -5;
xstop := 2;
ystart := -4;
ystop := 4;

draw proj( xstart*u, ystart*u, 0)--proj( xstop*u, ystart*u,0)--
proj( xstop*u, ystop*u, 0 )--proj(xstart*u, ystop*u, 0)--cycle;
draw proj( xstart*u, 0, 0 )--proj( xstop*u, 0,0 );
draw proj( 0, ystop*u, 0 )--proj( 0, ystart*u, 0 );


dx := 36;
h := xstop*u-4*mm;
l := ystop*u-4*mm;
w := mm;
for i=0 upto 9:
fill proj(xstop*u,0,0)--proj(h,w*cosd(i*dx),w*sind(i*dx))--
proj(h,w*cosd((i+1)*dx),w*sind((i+1)*dx))--cycle;
fill proj(0,ystop*u,0)--proj(w*cosd(i*dx),l,w*sind(i*dx))--proj(w*cosd((i+1)*dx),l,w*sind((i+1)*dx))--cycle;
endfor;




Mi := 100;
Mj := 100;
xmini := xstart;
xmaxi := xstop;
xminj := ystart;
xmaxj := ystop;
dxi := (xmaxi-xmini)/Mi;
dxj := (xmaxj-xminj)/Mj;


color mycolor[][];

for i=0 upto Mi:
for j=0 upto Mj:
a[i][j] := proj( (xmini+i*dxi)*u, (xminj+j*dxj)*u, 
u*f(xmini+i*dxi, xminj+j*dxj ) );
r := angle( Re(xmini+i*dxi,xminj+j*dxj), Im(xmini+i*dxi,xminj+j*dxj)  );
mycolor[i][j] := 0.5*( 1+sind(1.5*r), 1+sind(2.5*r), 1+sind(0.5*r) );
endfor;
endfor;


path c;
for i=0 upto Mi-1:
for j=0 upto Mj-1:
c := a[i][j]--a[i][j+1]--a[i+1][j+1]--a[i+1][j]--cycle;
fill c withcolor mycolor[i][j];
if (i = Mi-1):
draw a[Mi][j]--a[Mi][j+1];
fi;
if (j = Mj-1):
draw a[i][Mj]--a[i+1][Mj];
fi;
if (i = 0):
draw a[0][j]--a[0][j+1];
fi;
if (j = 0):
draw a[i][0]--a[i+1][0];
fi;
endfor;
endfor;




%draw proj(xstop*u,ystart*u,0)--
%(proj(xstop*u,ystart*u,0) shifted (8cm,0)) 
%withcolor red withpen pencircle scaled 6pt;




endfig;
end