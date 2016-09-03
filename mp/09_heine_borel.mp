verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

vardef drawit( expr x )=
save c;
save a;
path c;
pair a[];
c := fullcircle scaled u shifted x;
for i=0 upto 7:
a[i] := point i of c;
a[i] := a[i] shifted (0.5*(-10+uniformdeviate(20),-10+uniformdeviate(20) ));
endfor;
draw a0 for i=1 upto 7: ...a[i] endfor ...cycle;
enddef;



pickup pencircle scaled 0.2pt;

u:=1.25cm;
v := 0.3*u;

beginfig(1);

path d;
d := (0,0)--(0.6*(6u,0))--(0.6*(6u,4u))--(0.6*(0,4u))--cycle;
fill d withcolor 0.9 white;
draw d;

for i=0 upto 6:
for j=0 upto 4:
drawit( 0.6*(i*u,j*u) );
endfor;
endfor;

clip currentpicture to d;


endfig;
end