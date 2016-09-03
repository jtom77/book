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

vardef l( expr t,x,y,z )=
(t-y)*(t-z)/((x-y)*(x-z))
enddef;

vardef f( expr t, A, B, C )= 
(ypart A)*l( t, xpart A, xpart B, xpart C)+
(ypart B)*l( t, xpart B, xpart A, xpart C)+
(ypart C)*l( t, xpart C, xpart A, xpart B)
enddef;


u:=2cm;
v := 0.3*u;

beginfig(1);


path c;
path d;

c := (0,0.3){dir 60}...(1,1){dir -45}...(2,2){dir 80};

c := c shifted (-0.5,-0.5);



pair a[];
pair b[];

pair A, B, C;


A := point 0.8 of c;
B := point 1.3 of c;
C := point 1.8 of c;

c := c scaled u;

fill (xpart A,0)*u--(xpart C,0)*u--C*u--subpath (1.8,0.8) of c--cycle 
withcolor 0.9 white;

M := 50;
xmin := 0;
xmax := 2.3;
dx := (xmax-xmin)/M;

for i=0 upto M: 
a[i] := (xmin+i*dx, f( xmin+i*dx, A, B, C ) )*u;
endfor;

d := a0 for i=1 upto M: --a[i] endfor;

numeric s[];
s1 := xpart( d intersectiontimes c );
s2 := xpart( d intersectiontimes (subpath (1,1.5) of c) );
s3 := xpart( d intersectiontimes (subpath (1.7,2.0) of c ) );

fill (subpath (s1,s2) of d)--(subpath (1.3,0.8) of c)--cycle withcolor 
0.7 white;
fill (subpath (s2,s3) of d)--(subpath (1.8,1.3) of c)--cycle withcolor 
0.7 white;
 
draw c withpen pencircle scaled 0.6pt;
draw d withpen pencircle scaled 0.2pt;

draw A*u--(xpart A,0)*u dashed withdots scaled 0.5;
draw B*u--(xpart B,0)*u dashed withdots scaled 0.5;
draw C*u--(xpart C,0)*u dashed withdots scaled 0.5;

mark( (xpart A, ypart A)*u );
mark( B*u );
mark( C*u );

clip currentpicture to (
(0,0)--(1.8u,0)--(1.8u,1.5u)--(0,1.5u)--cycle );

drawarrow (0,0)--(1.8u,0);
drawarrow (0,0)--(0,1.5u);

label.bot( btex $a$ etex, (xpart A,0)*u -(0,1));
label.bot( btex $\frac{a+b}{2}$ etex, (xpart B,0)*u -(0,1));
label.bot( btex $b$ etex, (xpart C,0)*u -(0,1));
label.lft( btex $f$ etex, point 1.9 of c );
label.rt(  btex $p$ etex, C*u shifted (0.2u,0.4u) );

label.top( btex Kepler'sche Fassregel etex, (0.9u,-9mm) );


endfig;
end