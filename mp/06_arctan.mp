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
vardef tan( expr x ) = sin(x)/cos(x) enddef;

u:=0.85cm;
v := 0.3*u;

vardef arr( expr A, B ) := 
save f,g;
pair f,g;
f := B-2.2mm*unitvector( B-A );
g := f;
f := f rotatedabout( B, 15 );
g := g rotatedabout( B, -15 );
fill B--g--f--cycle withcolor white;
draw B--g--f--cycle withpen pencircle scaled 0.1pt;
enddef;
 




beginfig(1);

pickup pencircle scaled 0.2pt;

drawarrow (-4u,0)--(4u,0);
drawarrow (0,-2u)--(0,2u);




pair a[];
path c;

M := 100;
xmin := -0.42*pi;
xmax := -xmin;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := (tan(xmin+i*dx), xmin+i*dx)*u;
endfor;

c := a0 for i=1 upto M: --a[i] endfor;
draw c withpen pencircle scaled 1pt;;

numeric t;
pair A,B,df;
pair lab[];
A := (2u,0);

pickup pencircle scaled 0.1pt;

for i=0 upto 0:
t := xpart( c intersectiontimes ( (A-(0,10u))--(A+(0,10u) ) ) );
B := point t of c;
df := direction t of c;
draw A--B;
lab[i] := A; 
if( i<2 ):
drawarrow A--1/2[A,B];
fi;
A := (B--(B-10u*df)) intersectionpoint ( (-10u,0)--(10u,0) );
draw B--A;
drawarrow B--1/2[B,A];
t := xpart( c intersectiontimes ( (A-(0,10u))--(A+(0,10u) ) ) );
B := point t of c;
draw A--B;
drawarrow A--1/2[A,B];
df := direction t of c;
endfor;

drawarrow B--(B+1.7u*df);

label.rt( btex Newton-Verfahren etex, B+1.7u*df );

draw (0,0)--(2.1u,2.1u);

A := (2u,2u);

for i=0 upto 3:
B := c intersectionpoint ( (xpart A,-5u)--(xpart A,5u) );
draw A--B withpen pencircle scaled 0.1pt;
if( i=0 ): 
arr( A, 0.7[A,B] );
fi;
A := (ypart B, ypart B);
draw A--B withpen pencircle scaled 0.1pt;
if( i=0 ): 
arr( B, 0.8[B,A] );
fi;
endfor;

mark( (0,0) );

label.rt( btex Fixpunkt-Iteration etex, (2u,1.7u) );
label.bot( btex $2$ etex, (2u,0) );


endfig;
end