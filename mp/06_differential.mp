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

u:=5cm;
v := 0.3*u;

vardef arr( expr A, B )=
drawarrow ( 1/2[A,B]-5*unitvector( B-A ) )--A;
drawarrow ( 1/2[A,B]+5*unitvector( B-A ) )--B;
enddef;

beginfig(1);

pickup pencircle scaled 0.3pt;

ahlength := 2mm;
ahangle := 30;

path c;

c := (0,0.1u){dir 10}...(0.7u,0.6u){dir 50};
c := c shifted (-0.06u,-0.1u);
draw subpath(0.1,1) of c withpen pencircle scaled 0.6pt;

pair A[];
pair B, C;

A1 := point 0.3 of c;
A2 := point 0.6 of c;
B := point 0.4 of c;

C := direction 0.4 of c;

%draw ( A1-5*(B-A1) )--( B+5*(B-A1) ); 

draw ( B-5*C )--(B+5*C);


pair H;

H := B+0.4u*unitvector( C );

arr( H, (xpart H, ypart B ) );
draw B--( B+(0.4u,0) ) dashed withdots scaled 0.5;
%draw B--(xpart B,0) dashed withdots scaled 0.5pt;
%draw H--(xpart H,0) dashed withdots scaled 0.5pt;

mark( B );

clip currentpicture to 
( (0,0)--(0.7u,0)--(0.7u,0.5u)--(0,0.5u)--cycle ); 

drawarrow (0,0)--(0.7u,0);
drawarrow (0,0)--(0,0.5u);

draw (xpart B,0)--(xpart B,-mm);
draw (xpart H,0)--(xpart H,-mm);

label.bot( btex $x_0$ etex, (xpart B,-mm) );
label.bot( btex $x_0+h$ etex, (xpart H,-mm) );
label( btex $\mathrm{d}f(x_0)h$ etex, 1/2[ H, (xpart H, ypart B) ] );

endfig;
end