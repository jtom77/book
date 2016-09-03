verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
etex

input mydefs;

u:=2cm;
v := 0.3u;

pickup pencircle scaled 2pt;

vardef cantor( expr start, stop ) = 
draw start--stop;
save A, B;
pair A; pair B;
A := start shifted (0,-u);
B  := stop shifted (0,-u);
draw A--B;
save P, Q;
pair P;
pair Q;
P := 1/3[A,B];
Q := 2/3[A,B];
if( (xpart P-xpart Q)>0.05 ):
cantor( A, P );
cantor( Q, B );
fi;
enddef;


beginfig(1);

cantor( (0,0), (4u,0) );


endfig;
end