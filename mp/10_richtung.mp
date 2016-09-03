verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

def pi = 3.14159 enddef;

vardef cos( expr x ) = cosd( x*180/pi ) enddef; 
vardef sin( expr x ) = sind( x*180/pi ) enddef;
vardef proj( expr x, y, z )=( y-0.6*x, z-0.6*x ) enddef;
vardef f( expr x,y )= 1.5*x*y*y/( x**2+y**2 ) enddef; 

u:=0.5cm;
v := 0.3*u;

beginfig(1);

pair a[][];
numeric r[];
r1 := 1;
r2 := 1.5;
r3 := 3;

M := 30;
xmin := -pi;
xmax :=  0;
dx := (xmax-xmin)/M;

for i=2 upto 3:
for j=0 upto M:
x := r[i]*cos( xmin+j*dx );
y := r[i]*sin( xmin+j*dx );
a[i][j] := proj( x*u,y*u, u*f(x,y) );
endfor;
endfor;

path c;
c := a[3][0] for j=1 upto M: --a[3][j] endfor;
draw c;

for j=0 step 2 until M-2:
fill a[3][j]--a[3][j+1]--a[3][j+2]--(0,0)--cycle withcolor white;
draw a[3][j]--a[3][j+1]--a[3][j+2]--(0,0)--cycle 
withpen pencircle scaled 0.2pt;
draw a[2][j]--a[2][j+1]--a[2][j+2]--(0,0)--cycle 
withpen pencircle scaled 0.2pt;
endfor;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xmin :=  pi;
xmax :=  0;
dx := (xmax-xmin)/M;

for i=1 upto 3:
for j=0 upto M:
x := r[i]*cos( xmin+j*dx );
y := r[i]*sin( xmin+j*dx );
a[i][j] := proj( x*u,y*u, u*f(x,y) );
endfor;
endfor;



for j=0 step 1 until M-2:
if( ypart a[3][j+2] >= ypart a[3][j]-0.13u ):
fill a[3][j]--a[3][j+1]--a[3][j+2]--(0,0)--cycle withcolor 0.8 white;
else:
fill a[3][j]--a[3][j+1]--a[3][j+2]--(0,0)--cycle withcolor white;
fi;
draw a[3][j]--a[3][j+1]--a[3][j+2]--(0,0)--cycle 
withpen pencircle scaled 0.2pt;
draw a[2][j]--a[2][j+1]--a[2][j+2]--(0,0)--cycle 
withpen pencircle scaled 0.2pt;
endfor;



c := a[3][0] for j=1 upto M: --a[3][j] endfor;
draw c;



drawarrow (0,0)--proj(4u,0,0);
drawarrow (0,0)--proj(0,4u,0);
drawarrow (0,0)--proj(0,0,2.5u);


label.lft( btex $x$ etex, proj(4u,0,0)+(0,1) );
label.bot( btex $y$ etex, proj(0,4u,0)+(-1,-1) );
label.lft( btex $z$ etex, proj(0,0,2.5u)+(0,-1) );


endfig;
end