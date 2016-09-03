verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;


vardef drawangle( expr B,M,A,s  ) = 
pair aunit,bunit;
aunit := unitvector( A-M );
bunit := unitvector( B-M );
draw (M+s*aunit){aunit rotated -90}..(M+s*bunit){bunit rotated -90};
enddef;

vardef apt( expr B, M, A, s ) = 
M+0.4*s*unitvector( A-M )+0.4*s*unitvector( B-M ) 
enddef;

u:=1.7cm;
v := 1.3*u;

beginfig(1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


path c,d;

c := (0,0){dir 60}...(2u,u){dir -10};


draw subpath( 0.1,0.8 ) of c;

pair t;
t := unitvector( direction (0.4) of c );

pair p;
p := point 0.5 of c;

d := (0,1.5u)...p...(u,0);

pair q, s;
q := point 1 of d;
s := unitvector( direction 1 of d );

drawarrow p--p+u*t;
drawarrow q--q+0.8*u*s;

drawangle( p+s, p, p+t, 4mm );



label.lft( btex $\gamma$ etex, point 0.1 of c );
label.top( btex $T_\gamma$ etex, p+u*t );
label.bot( btex $\alpha$ etex, (point 0.1 of d)-(0,1) );
label.rt( btex $T_\alpha$ etex, p+0.8*u*s+(2,0) );

draw (0,0) withpen pencircle scaled 0.1pt withcolor white;

draw subpath(0.1,2) of d;

label( btex $\varphi$ etex, p+(6,-2) );



mark( p );

endfig;
end