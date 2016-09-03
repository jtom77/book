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

c := (0,0.1){dir 60}...(1.3,1){dir -45}...(2,2){dir 80};
c := c shifted (-0.6,-0.6);
c := c scaled u;

pair a[];
pair b[];

pair A, B, C, D;


A := c intersectionpoint ( (0.35u,0)--(0.35u,10u) );
B := c intersectionpoint ( (1.25u,0)--(1.25u,10u) );

t1 := xpart( c intersectiontimes ( (0.35u,0)--(0.35u,10u) ) );
t2 := xpart( c intersectiontimes ( (1.25u,0)--(1.25u,10u) ) );

fill (xpart A,0)--(xpart B,0)--B--subpath (t2,t1) of c--cycle 
withcolor 0.9 white;

fill A--B--subpath ( t2, t1 ) of c--cycle withcolor 0.7 white;
draw A--B withpen pencircle scaled 0.2pt;

label.top( btex $L_1$ etex, 1/2[A,B] );

draw c withpen pencircle scaled 0.6pt;

draw A--(xpart A,0) dashed withdots scaled 0.5;
draw B--(xpart B,0) dashed withdots scaled 0.5;

mark( A );
mark( B );

clip currentpicture to (
(0,0)--(2u,0)--(2u,1.3u)--(0,1.3u)--cycle );

drawarrow (0,0)--(2u,0);
drawarrow (0,0)--(0,1.3u);

label.bot( btex $a$ etex, (xpart A,0) -(0,1));
label.bot( btex $b$ etex, (xpart B,0) -(0,1));
label.rt( btex $f$ etex, point 1.9 of c );

label.top( btex Sehnen-Trapezregel etex, (0.9u,-9mm) );

endfig;
end