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

vardef f( expr x, y )=
(y**2)+(x**2)
enddef;

vardef Re(expr x, y ) = x**2-y**2 enddef;
vardef Im(expr x, y ) = 2*x*y enddef;


vardef R( expr x ) = 
if x<=60:
x/60 
else:
if x<=180:
1
else:
if x<=240:
1-(x-180)/60
else:
0
fi
fi
fi
enddef; 

vardef G( expr x ) = 
if x<=60: 1 
else:
if x<=120:
1-(x-60)/60
else:
if x<=240:
0
else:
if x<=300:
(x-240)/60
else: 1
fi
fi
fi
fi
enddef; 


vardef B( expr x ) = 
if x<=120: 0
else:
if x<=180:
(x-120)/60
else:
if x<=300:
1
else:
1-(x-300)/60
fi
fi
fi
enddef; 




u:= 80.0/7*mm;
v := 0.3*u;

beginfig(1);

pair a[][];


xstart := -1.5;
xstop := 1.5;
ystart := -1.5;
ystop := 1.5;

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
xmini := -1.5;
xmaxi := 1.5;
xminj := -1.5;
xmaxj := 1.2;
dxi := (xmaxi-xmini)/Mi;
dxj := (xmaxj-xminj)/Mj;


color mycolor[][];

for i=0 upto Mi:
for j=0 upto Mj:
a[i][j] := proj( (xmini+i*dxi)*u, (xminj+j*dxj)*u, 
u*f(xmini+i*dxi, xminj+j*dxj ) );
r := angle( Re(xmini+i*dxi,xminj+j*dxj), Im(xmini+i*dxi,xminj+j*dxj)  );
mycolor[i][j] := (R(r),G(r),B(r));
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


draw (-3.5u,0) withcolor white;
draw (3.5u,0) withcolor white;

%draw proj(xstop*u,ystart*u,0)--
%(proj(xstop*u,ystart*u,0) shifted (8cm,0)) 
%withcolor red withpen pencircle scaled 6pt;




endfig;
end