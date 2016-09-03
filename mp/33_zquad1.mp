verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
etex

input mydefs;

input mp-tool;
input mp-spec;
cmykcolors := true;

def basecolor := (0,129.0/255,199.0/255) enddef; 


u:=1.6cm;
v := 0.3*u;

pickup pencircle scaled 0.2pt;

vardef proj( expr x, y, z )=
(0.9*y-0.7*x,z-0.2*x-0.15*y) enddef;

vardef f( expr x, y )= x*y enddef;
vardef g( expr x, y )= (x**2)-(y**2) enddef;

vardef dg( expr x, y ) = sqrt( (2*x-y**2)**2+(x**2-2*y)**2 ) enddef;
vardef df( expr x, y ) = sqrt( x*x+y*y ) enddef;

vardef Re(expr x, y ) = x**2-y**2 enddef;
vardef Im(expr x, y ) = 2*x*y enddef;


vardef drawprojarrx( expr x ) =
dx := 36;
h := x*u-4*mm;
w := mm;
for i=0 upto 9:
fill proj(x*u,0,0)--proj(h,w*cosd(i*dx),w*sind(i*dx))--
proj(h,w*cosd((i+1)*dx),w*sind((i+1)*dx))--cycle;
endfor;
enddef;


vardef drawprojarry( expr x ) =
dx := 36;
h := x*u-4*mm;
w := mm;
for i=0 upto 9:
fill proj(0,x*u,0)--proj(w*cosd(i*dx),h,w*sind(i*dx))--
proj(w*cosd((i+1)*dx),h,w*sind((i+1)*dx))--cycle;
endfor;
enddef;

vardef drawprojarrz( expr x ) =
dx := 36;
h := x*u-4*mm;
l := ystop*u-4*mm;
w := mm;
for i=0 upto 9:
fill proj(0,0,x*u)--proj(w*cosd(i*dx),w*sind(i*dx),h)--
proj(w*cosd((i+1)*dx),w*sind((i+1)*dx),h)--cycle;
endfor;
enddef;




beginfig(1);

pair a[][];
color mycolor[][];


xstart := -1.5;
xstop := 1.5;
ystart := -1.5;
ystop := 1.5;

Mi := 60;
Mj := 60;
xmini := -1.5;
xmaxi := 1.5;
xminj := -1.5;
xmaxj := 1.2;
dxi := (xmaxi-xmini)/Mi;
dxj := (xmaxj-xminj)/Mj;

for i=0 upto Mi:
for j=0 upto Mj:
a[i][j] := proj( (xmini+i*dxi)*u, (xminj+j*dxj)*u, 
u*f(xmini+i*dxi, xminj+j*dxj ) );
r := 0.6+0.2*df(xmini+i*dxi,xminj+j*dxj);
mycolor[i][j] := r*basecolor;
endfor;
endfor;

path c;
for i=0 upto floor(Mi/2):
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

drawprojarrz( 3 );
draw (0,0)--proj(0,0,3u);
draw proj(xstart,0,0)--(0,0);
draw proj(0,ystart,0)--(0,0);

for i=floor(Mi/2)+1 upto Mi-1:
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





drawprojarrx( 3 );
draw (0,0)--proj(3u,0,0);
drawprojarry( 3 );
draw (0,0)--proj(0,3u,0);



picture pic;
pic := currentpicture;
currentpicture := nullpicture;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xstart := -1.5;
xstop := 1.5;
ystart := -1.5;
ystop := 1.5;


Mi := 60;
Mj := 60;
xmini := -1.5;
xmaxi := 1.5;
xminj := -1.5;
xmaxj := 1.2;
dxi := (xmaxi-xmini)/Mi;
dxj := (xmaxj-xminj)/Mj;

for i=0 upto Mi:
for j=0 upto Mj:
a[i][j] := proj( (xmini+i*dxi)*u, (xminj+j*dxj)*u, 
u*g(xmini+i*dxi, xminj+j*dxj ) );
r := 0.4+0.2*dg(xmini+i*dxi,xminj+j*dxj);
mycolor[i][j] := r*basecolor;
endfor;
endfor;

path c;
for i=0 upto floor(Mi/2):
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


draw (0,0)--proj(0,3u,0);
draw (0,0)--proj(0,0,3u);
drawprojarry( 3 );
drawprojarrz( 3 );



for i=floor(Mi/2)+1 upto Mi-1:
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

drawprojarrx( 3 );
draw (0,0)--proj(3u,0,0);






draw pic shifted (5u,0);




endfig;
end