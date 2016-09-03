verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

pickup pencircle scaled 0.2pt;

u:=1.5cm;
v := 0.3*u;

beginfig(1);

path c;

M := 70;

numeric t[];
for i=0 upto M:
t[i] := 0.1+uniformdeviate(0.6);
endfor;

pair a[];

a0 := (2u,0);

for i=1 upto M:
a[i] := a[i-1];
a[i] := a[i] scaled 0.95;
a[i] := a[i] rotatedabout ((0,0),10);
dot( a[i] );
dot( a[i] shifted (4u,0) );
draw fullcircle scaled (t[i]*u) shifted a[i];
if( i<30 ):
draw fullcircle scaled (t[i]*u) shifted (a[i] shifted (4u,0) );
fi;
endfor; 

draw fullcircle scaled 0.7u shifted (a[M] shifted (4u,0) );





endfig;
end