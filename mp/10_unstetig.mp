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
vardef proj( expr x, y, z )=( 0.8*y+0.4*x, z-0.4*x+0.2*y ) enddef;
vardef f( expr x,y )= 2*x*y/( x**2+y**2 ) enddef; 

u:=0.7cm;
v := 0.3*u;

beginfig(1);

pickup pencircle scaled 0.2pt;

pair a[][];
pair b[][];
numeric r[];
r1 := 0.5;
r2 := 1.5;
r3 := 3;

M := 30;


drawarrow (0,0)--proj(4.5u,0,0);
drawarrow (0,0)--proj(0,4.5u,0) ;


xmin := -pi;
xmax := -2*pi;
dx := (xmax-xmin)/M;


for i=1 upto 3:
for j=0 upto M:
x := r[i]*cos( xmin+j*dx );
y := r[i]*sin( xmin+j*dx );
a[i][j] := proj( x*u,y*u, u*f(x,y) );
b[i][j] := (0,u*f(x,y) );
endfor;
endfor;

for j=0 step 2 until M-2:
fill b[3][j]--b[3][j+2]--a[3][j+2]--a[3][j+1]--a[3][j]--cycle 
withcolor white;
draw b[3][j]--b[3][j+2]--a[3][j+2]--a[3][j+1]--a[3][j]--cycle; 
draw a[2][j]--a[2][j+1]--a[2][j+2];
endfor;

xmin := -pi;
xmax := 0;
dx := (xmax-xmin)/M;

for i=1 upto 3:
for j=0 upto M:
x := r[i]*cos( xmin+j*dx );
y := r[i]*sin( xmin+j*dx );
a[i][j] := proj( x*u,y*u, u*f(x,y) );
b[i][j] := (0,u*f(x,y) );
endfor;
endfor;

for j=0 step 2 until M-2:
fill b[3][j]--b[3][j+2]--a[3][j+2]--a[3][j+1]--a[3][j]--cycle 
withcolor white;
draw b[3][j]--b[3][j+2]--a[3][j+2]--a[3][j+1]--a[3][j]--cycle; 
draw a[2][j]--a[2][j+1]--a[2][j+2];
endfor;

drawarrow proj(0,0,-u)--proj(0,0,3u);
draw (0,0)--proj(0,4u,0) dashed evenly;

label.bot( btex $x$ etex, proj(4.5u,0,0)+(-1,0) );
label.bot( btex $y$ etex, proj(0,4.5u,0)+(-1,-1) );
label.lft( btex $z$ etex, proj(0,0,3u)+(0,-1) );



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


endfig;
end