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
vardef proj( expr x, y, z )=( 0.8*y-0.8*x, z-0.2*x-0.2*y ) enddef;
vardef f( expr x,y )= 1.5*x*y*y/( x**2+y**2 ) enddef; 

u:=0.3cm;
v := 0.3*u;

beginfig(1);

pair a[][];
pair b[][];

M := 50;
xmin := -pi/4;
xmax := 7*pi/4;
dx := (xmax-xmin)/M;

for i=1 upto 4:
for j=0 upto M:
a[i][j] := proj( i*u*cos( xmin+j*dx ), i*u*sin( xmin+j*dx ), u*(i**1.6) );
b[i][j] := proj( i*u*cos( xmin+j*dx ), i*u*sin( xmin+j*dx ), 0 );
endfor;
endfor;

path c, d, e;
c := a[4][0]...a[3][0]...a[2][0]...a[1][0]...(0,0)
...a[1][25]...a[2][25]...a[3][25]...a[4][25];
d := a[4][25] for i=24 step -1 until 0: --a[4][i] endfor;




for i=1 upto 4:
draw b[i][0] for j=1 upto M: --b[i][j] endfor --cycle;
endfor;


draw proj(-6u,-6u,0)--proj(-6u,6u,0)--proj(6u,6u,0)--proj(6u,-6u,0)--cycle;

e := c--d--cycle;;
fill e withcolor 0.9 white;

draw c;

for i=1 upto 4:
draw a[i][0] for j=1 upto 25: --a[i][j] endfor;
endfor;


path f;

f := a[4][0] for i=1 upto M: --a[4][i] endfor --cycle;

fill f withcolor 0.7 white;
draw f; 

drawarrow b[3][0]--proj(4u,-4u,0);
draw b[3][0]--a[3][0] dashed withdots scaled 0.5;

draw proj(5.2u,-6u,0)--proj(0.2u,-6u,0) withpen pencircle scaled 1pt 
withcolor white;

dot( b[3][0] );
label.top( btex $\mathrm{grad}\,f(a)$ etex, proj(4.2u,-4.2u,0) );

label.rt( btex $a$ etex, b[3][0] shifted (1,0) ); 


endfig;
end