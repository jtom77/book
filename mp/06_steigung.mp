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

u:=7cm;
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

c := (0,0.1u){dir 0}...(0.6u,0.7u){dir 80};
c := c shifted (-0.06u,0);

draw subpath(0.1,1) of c withpen pencircle scaled 0.6pt;

pair A[];
pair B, C, Q;

A1 := point 0.3 of c;
A2 := point 0.6 of c;
B := point 0.7 of c;

C := direction 0.7 of c;

pair P[];
P1 := point 0.6 of c;
P2 := point 0.7 of c;

pair Q[];
Q1 := point 0.68 of c;
Q2 := point 0.7 of c;

draw ( A1-5*(B-A1) )--( B+5*(B-A1) ) withpen pencircle scaled 0.2pt; 
draw ( A1-5*(B-A1) )--( B+5*(B-A1) ) withpen pencircle scaled 0.2pt; 

draw ( P1-5*(P2-P1) )--( P1+5*(P2-P1) ) withpen pencircle scaled 0.2pt; 
draw ( P1-5*(P2-P1) )--( P1+5*(P2-P1) ) withpen pencircle scaled 0.2pt; 

draw ( Q1-35*(Q2-Q1) )--( Q1+35*(Q2-Q1) ) withpen pencircle scaled 0.2pt; 
draw ( Q1-35*(Q2-Q1) )--( Q1+35*(Q2-Q1) ) withpen pencircle scaled 0.2pt; 


%draw ( B-5*C )--(B+5*C);

clip currentpicture to 
( (0,0.05u)--(0.7u,0.05u)--(0.7u,0.6u)--(0,0.6u)--cycle ); 

pair D,E;

D := B+0.8*C;
E := (xpart D, ypart B);

draw (xpart A1,0)--A1--(0,ypart A1) dashed withdots scaled 0.5 withpen 
pencircle scaled 0.5pt;
draw (xpart B,0)--B--(0,ypart B) dashed withdots scaled 0.5 withpen 
pencircle scaled 0.5pt;

draw (xpart A1,-mm)--(xpart A1,0);
draw (-mm,ypart A1)--(0,ypart A1);
draw (xpart B,-mm)--(xpart B,0);
draw (-mm,ypart B)--(0,ypart B);

mark( A1 ); 
mark( B  );
mark( P1 );
mark( Q1 );

labeloffset := 1.5pt;
label.bot( btex $x$ etex, (xpart A1,-mm) );
label.bot( btex $x_0$ etex, (xpart B,-mm) );
label.bot( btex $\to$ etex, (xpart B+0.5*(xpart A1-xpart B), -3 ) );
label.lft( btex $\uparrow$ etex, (-7,ypart B+0.5*(ypart A1-ypart B)) );
label.lft( btex $f(x)$ etex, (-mm,ypart A1 ) );
label.lft( btex $f(x_0)$ etex, (-mm,ypart B) );

drawarrow (0,0)--(0.7u,0);
drawarrow (0,0)--(0,0.6u);

endfig;
end