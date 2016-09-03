verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

u:=2cm;
v := 0.3*u;

beginfig(1);

pickup pencircle scaled 0.1pt;

path c;

c := (0.2u,-1u){dir 20}...(3u,2.5u){dir 80};
draw subpath(0.3,1) of c withpen pencircle scaled 1pt;

drawarrow (1.2u,0)--(3.5u,0) withpen pencircle scaled 0.4pt;
%drawarrow (u,0)--(u,2u);

pair lab[];
pair A;
pair B;
numeric t;
pair df;
pair xi;

A := (2.9u,0);

for i=0 upto 3:
t := xpart( c intersectiontimes ( (A-(0,10u))--(A+(0,10u) ) ) );
B := point t of c;
df := direction t of c;
draw A--B;
lab[i] := A; 
if( i<2 ):
drawarrow A--0.6[A,B];
fi;
A := ( (B-10*df)--(B+10*df) ) intersectionpoint ( (0,0)--(10u,0) ); 
draw A--B;
if( i<1 ):
drawarrow B--0.5[A,B];
label.rt( btex $T_0$ etex, 0.4[A,B] );
fi;
mark( B );
endfor;

labeloffset := 2pt;

label.bot( btex $x_0$ etex, lab0 );
label.bot( btex $x_1$ etex, lab1 );
label.bot( btex $x_2$ etex, lab2 );


xi := c intersectionpoint ( (-10u,0)--(10u,0) );

mark( xi );

label.top( btex $\xi$ etex, xi+(0,1) );

endfig;
end