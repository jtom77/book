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

vardef l( expr t,x,y,z,v )=
(t-y)*(t-z)*(t-v)/((x-y)*(x-z)*(x-v))
enddef;

vardef f( expr t, A, B, C, D )= 
(ypart A)*l( t, xpart A, xpart B, xpart C, xpart D)+
(ypart B)*l( t, xpart B, xpart A, xpart C, xpart D)+
(ypart C)*l( t, xpart C, xpart A, xpart B, xpart D)+
(ypart D)*l( t, xpart D, xpart A, xpart B, xpart C)
enddef;


u:=2cm;
v := 0.3*u;

beginfig(1);


path c;
path d;

c := (0,0.3){dir 60}...(1,1){dir -45}...(2,2){dir 80};

c := c shifted (-0.5,-0.5);

pair A, B, C, D;

A := point 1.0 of c;
B := point 1.8 of c;

c := c scaled u;

fill A*u--B*u--(subpath (1.8,1) of c)--cycle withcolor 0.8 white;

draw A*u--B*u;

fill (xpart A,0)*u--(xpart B,0)*u--B*u--subpath (1.8,1.0) of c--cycle 
withcolor 0.9 white;

draw c withpen pencircle scaled 0.6pt;

draw A*u--(xpart A,0)*u dashed withdots scaled 0.5;
draw B*u--(xpart B,0)*u dashed withdots scaled 0.5;

mark( (xpart A, ypart A)*u );
mark( B*u );


clip currentpicture to (
(0,0)--(2u,0)--(2u,1.5u)--(0,1.5u)--cycle );

drawarrow (0,0)--(2u,0);
drawarrow (0,0)--(0,1.5u);

label.bot( btex $a$ etex, (xpart A,0)*u -(0,1));
label.bot( btex $b$ etex, (xpart B,0)*u -(0,1));
label.lft( btex $f$ etex, point 1.9 of c );




endfig;
end