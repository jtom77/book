Verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

u:=0.5cm;

ahlength := 1mm;

def pi = 3.14159 enddef;

vardef cos( expr x ) = cosd( x*180/pi ) enddef; 
vardef sin( expr x ) = sind( x*180/pi ) enddef;

vardef f(expr a)=( xpart a, cos(3*ypart a) ) enddef;
vardef h(expr a)=( 2, 1 ) enddef;
vardef g(expr a)=( xpart a, ypart a ) enddef;
vardef k(expr a)=( -ypart a, xpart a ) enddef;

vardef draw_arr (expr x, shift)=
save v;
pair v;
v := f( x );
drawarrow (x-0.2*v)*u shifted shift--(x+0.2*v)*u shifted shift;
enddef;

vardef draw_arrb (expr x, shift)=
save v;
pair v;
v := g( x );
drawarrow (x-0.2*v)*u shifted shift--(x+0.2*v)*u shifted shift;
enddef;

vardef draw_arrc (expr x, shift)=
save v;
pair v;
v := h( x );
drawarrow (x-0.2*v)*u shifted shift--(x+0.2*v)*u shifted shift;
enddef;

vardef draw_arrk (expr x, shift)=
save v;
pair v;
v := k( x );
drawarrow x*u shifted shift--(x+0.4*v)*u shifted shift;
enddef;


v := 0.3*u;

beginfig(1);

pickup pencircle scaled 0.2pt;

path c;

for i=-2 upto 2:
for j=-2 upto 2:
draw_arrc( (i,j), (0,0) );
endfor;
endfor;

pair b;

for i=1 step 1 until 2:
for j=0 upto 15:
b := (i,0);
b := b rotatedabout ( (0,0), j*360.0/16 );
draw_arrb( b, (6u,0) );
endfor;
endfor;

for i=0.8 step 0.5 until 2.3:
for j=0 upto 15:
b := (i,0);
b := b rotatedabout ( (0,0), j*360.0/16 );
draw_arrk( b, (12u,0) );
endfor;
endfor;

for i=-2 step 0.5 until 2:
for j=-2 step 0.5 until 2:
draw_arr( (i,j), (18u,0) );
endfor;
endfor;

mark( (6u,0) );
mark( (12u,0) );

label.bot( btex $F(x)=\mathrm{Const}$ etex, (0,-2.6u-3) );
label.bot( btex $F(x)=x$ etex, (6u,-2.6u-3) );
label.bot( btex $F(x)=(-x_2,x_1)^\mathrm{T}$ etex, (12u,-2.6u-3) );
label.bot( btex $F(x)=(x_1,\cos(x_2))^\mathrm{T}$ etex, (18u,-2.6u-3) );


endfig;
end