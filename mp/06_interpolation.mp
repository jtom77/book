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

c := c scaled u;

A := c intersectionpoint ( (0.4u,0)--(0.4u,10u) );
B := c intersectionpoint ( (0.8u,0)--(0.8u,10u) );
C := c intersectionpoint ( (1.2u,0)--(1.2u,10u) );

draw c;

drawarrow (0,0)--(2u,0);
drawarrow (0,0)--(0,1.5u);




endfig;
end