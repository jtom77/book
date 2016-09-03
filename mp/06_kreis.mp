verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

vardef exp( expr x ) = mexp(256)**x enddef;
vardef drawangle( expr A,M,B, r )=
draw (M+r*unitvector(A-M)){unitvector(A-M) rotated 90}..
(M+r*unitvector(B-M)){unitvector(B-M) rotated 90};
enddef;


u:= 2cm;

numeric min;
numeric max;

beginfig(1);

pickup pencircle scaled 0.3pt;

labeloffset := 1.5pt;

path c;

c := halfcircle scaled 2u;

pair A;

A := point 2.7 of c;

fill (xpart A,0)--A--(subpath (2.7,4) of c)--cycle withcolor 0.8 white;
fill (0,0)--(xpart A,0)--A--cycle withcolor 0.9 white;

drawangle( (0,u), (0,0), (-u,0), 7*mm );


draw (0,0)--A;
draw (xpart A,-mm)--A;

drawarrow (-1.1u,0)--(1.4u,0);
drawarrow (0,0)--(0,1.2u);


draw (-u,0)--(-u,-mm);
draw (u,0)--(u,-mm);
draw (0,0)--(0,-mm);

label.bot( btex $x$ etex, (xpart A,-mm) );
label.bot( btex $-1$ etex, (-u,-mm) );
label.bot( btex $1$ etex, (u,-mm) );
label.bot( btex $0$ etex, (0,-mm) );
label( btex $\varphi$ etex, (-10,4) );
label.rt( btex $\sqrt{1-x}$ etex, (point 1 of c) shifted (1,0) );
label( btex $\psi$ etex, (-3,13) );


draw c;


draw (0,-0.7u) withpen pencircle scaled 0.1 withcolor white;


endfig;
end