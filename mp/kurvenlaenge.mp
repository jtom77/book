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

u:=2cm;
v := 1.3*u;

beginfig(1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


path c,d;

c := (-1.3u,0)..(0,u)..(u,0)..(0,0);

draw c withpen pencircle scaled 0.6pt;

pair p[];

M := 6;
for i=0 upto M:
p[i] := point i*3.0/M of c;
endfor;

for i=0 upto M-1:
draw p[i]--p[i+1] withpen pencircle scaled 0.2pt;
endfor;

for i=0 upto M:
mark( p[i] );
endfor;

label.top( btex $t_{\nu-1}$ etex, p2+(0,1) );
label.rt( btex $t_\nu$ etex, p3+(2,2) );

endfig;
end