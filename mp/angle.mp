verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
etex

input mydefs;

pickup pencircle scaled 0.2pt;

vardef proj( expr x, y, z )=
(y-0.4*x,z-0.3*x-0.2*y) enddef;


vardef arg( expr x, y ) = 
if( x>=0 ):
angle(x,y)
else:
if( y>=0 ):
180-angle(-x,y)
else:
-180+angle(-x,-y)
fi
fi
enddef;


%if( y>=0 ):


vardef f( expr x, y )=
(y*y)+(x*x)
enddef;

u:=1.4cm;
v := 0.3*u;

beginfig(1);

pair a[];


M := 40;
xmin := -180;
xmax :=  180;
dx := (xmax-xmin)/M;


for i=0 upto M:
a[i] := ( xmin+i*dx, 0.01*u*arg( cosd(78),sind(78) ) );
endfor



draw (-6u,0.1*arg(cosd(135),sind(135)))--(6u,0.1*arg(cosd(135),sind(135)) ); 



drawarrow ( -10u,0 )--(10u,0);
drawarrow ( 0, -2u )--(0,2u);

draw (-10u,0.9u)--(10u,0.9u) dashed evenly;
draw (-10u,-0.9u)--(10u,-0.9u) dashed evenly;

draw a[0] for i=1 upto M: --a[i] endfor;

show( decimal( angle(10,-1) ) );


endfig;
end