verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\usepackage{dsfont}
\begin{document}
\footnotesize
etex

input mydefs


beginfig(1);

paper( (0,0)--(20,2.3) );
u := .15cm;
v := 1.2cm;


pair shift;

shift := (0,0);



pair b[];

for i=1 upto 20:
  b[i] := (i*u,v*exp(-.2*i)*sin(i)+v);
  markempty( b[i] );
endfor

koordinaten( 5,5 );

for i=0 upto 17:
draw (i*u,0)--(i*u,-0.5mm) thin;
endfor

label.top( btex $\mathds{N}$ etex, (20u-mm,mm) shifted shift );
label.lft( btex $\mathds{R}$ etex, (-mm,2.3v-mm) shifted shift );

draw (-mm,v)--(rechts*u,v) verythin;

endfig;
end
