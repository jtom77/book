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

c := (0,0.1){dir 60}...(1.3,1){dir -45}...(2,2){dir 80};

c := c shifted (-0.6,-0.6);

c := c scaled u;

pair a[];
pair b[];

pair A, B, C;
numeric t[];

A := c intersectionpoint ( (0.35u,0)--(0.35u,10u) );
B := c intersectionpoint ( (0.8u,0)--(0.8u,10u) );
C := c intersectionpoint ( (1.25u,0)--(1.25u,10u) );
t1 := xpart( c intersectiontimes ( (0.35u,0)--(0.35u,10u) ) );
t2 := xpart( c intersectiontimes ( (0.8u,0)--(0.8u,10u) ) );
t3 := xpart( c intersectiontimes ( (1.25u,0)--(1.25u,10u) ) );

fill (xpart A,0)--(xpart C,0)--C--subpath (t3,t1) of c--cycle 
withcolor 0.9 white;

M := 50;
xmin := 0;
xmax := 2.3;
dx := (xmax-xmin)/M;

for i=0 upto M: 
a[i] := (xmin+i*dx, f( xmin+i*dx, A/u, B/u, C/u ) )*u;
endfor;

d := a0 for i=1 upto M: --a[i] endfor;

numeric s[];
s1 := xpart( d intersectiontimes c );
s2 := xpart( d intersectiontimes (subpath (t1+0.1,t3) of c) );
s3 := xpart( d intersectiontimes (subpath (t2+0.1,t3+0.2) of c ) );

fill (subpath (s1,s2) of d)--(subpath (t2,t1) of c)--cycle withcolor 
0.7 white;
fill (subpath (s2,s3) of d)--(subpath (t3,t2) of c)--cycle withcolor 
0.7 white;
 
draw c withpen pencircle scaled 0.6pt;
draw d withpen pencircle scaled 0.2pt;

draw A--(xpart A,0) dashed withdots scaled 0.5;
draw B--(xpart B,0) dashed withdots scaled 0.5;
draw C--(xpart C,0) dashed withdots scaled 0.5;

mark( (xpart A, ypart A) );
mark( B );
mark( C );

clip currentpicture to (
(0,0)--(1.8u,0)--(1.8u,1.3u)--(0,1.3u)--cycle );

drawarrow (0,0)--(1.8u,0);
drawarrow (0,0)--(0,1.3u);

label.bot( btex $a$ etex, (xpart A,0) -(0,1));
label.bot( btex $\frac{a+b}{2}$ etex, (xpart B,0) -(0,1));
label.bot( btex $b$ etex, (xpart C,0) -(0,1));
label.lft( btex $f$ etex, point 1.9 of c );
label.rt(  btex $p$ etex, C shifted (0.2u,0.4u) );

label.top( btex Kepler'sche Fassregel etex, (0.9u,-9mm) );


endfig;
end