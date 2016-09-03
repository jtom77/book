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

labeloffset := 1pt;
pickup pencircle scaled 0.3pt;

path c;
c := fullcircle scaled u;

pair A, B;

A := point 7.5 of c;
B := point 2.3 of c;

draw c;
draw A--B;

draw subpath (7.5,8.0) of c withpen pencircle scaled 1pt;
draw subpath (0,2.3) of c withpen pencircle scaled 1pt;

dot( A );
dot( B );

label.bot( btex $a$ etex, A+(3,-1) );
label.top( btex $b$ etex, B+(0,1) );

label.llft( btex $\gamma(t)$ etex, 1/2[A,B] );
label.urt( btex $\gamma(t)/ \| \gamma(t) \|$ etex, point 1 of c );

endfig;
end

