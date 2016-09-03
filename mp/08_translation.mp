verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

u := 0.8cm;

beginfig(1);

pickup pencircle scaled 0.3pt;


pair A, B , v;

A := (0,0);
B := (2u,u);
v := (-1.5u,u);

draw A--B;
drawarrow A--(A+0.95*v);
drawarrow B--(B+0.95*v);
draw (A+v)--(B+v);

mark( A );
mark( B );
mark( A+v );
mark( B+v ); 

label.bot( btex $d$ etex, 1/2[A,B] );
label.bot( btex $d$ etex, 1/2[A+v,B+v] );
label.bot( btex $v$ etex, 0.6[A,A+v]-(0,1) );
label.bot( btex $v$ etex, 0.6[B,B+v]-(0,1) );

label.bot( btex $x$ etex, A-(0,2) );
label.bot( btex $y$ etex, B-(0,2) );


endfig;
end

