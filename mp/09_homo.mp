verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

vardef norm( expr x )=
sqrt( ((xpart x)**2)+((ypart x)**2) )
enddef;

vardef f( expr x )= ( (xpart x)/(1+norm(x)), (ypart x)/(1+norm(x)) )
enddef;
 
u:=3cm;
v := 0.3*u;

beginfig(1);

pair a[];

path c;

%c := fullcircle shifted (3,0);
c := (2.5,-1)--(3.5,0)--(2.5,1)--(1.5,0)--cycle;
fill c scaled u withcolor 0.9 white;
draw c scaled u; 

M := 100;
dx := 5.0/100;

for i=0 upto M:
a[i] := point (i*dx) of c;
a[i] := f( a[i] );
endfor;

path e;
e := (a[0]*u) for i=1 upto M: --(a[i]*u) endfor--cycle;
fill e withcolor 0.9 white;
draw e;

path d;

d := (0,-u)..(-0.6u,0){up}..(0,u);
d := d rotatedabout( (0,0), -45 );
draw d dashed evenly scaled 0.5;  

draw (-3u,-1u)--(0,2u) dashed evenly scaled 0.5;
draw fullcircle scaled 2u;



endfig;
end