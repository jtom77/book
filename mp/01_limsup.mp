verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

u:=1cm;

vardef draw_M( expr a, b )=
fill (xpart a,ypart a-1.1mm)--(xpart b,ypart b-1.1mm)
--(xpart b,ypart b+1.1mm)--(xpart a, ypart a+1.1mm)--cycle 
withcolor 0.8 white;
draw (xpart a, ypart a-2mm)--(xpart a, ypart a+2mm);
draw (xpart b, ypart b-2mm)--(xpart b, ypart b+2mm);
enddef;

beginfig(1);

pair a,b, inf, sup;

a:=(-3u,0);
b:=(3u,0);
pair shift;
shift:=(5u,0);
inf:=(-u,0);
sup:=(2u,0);


draw a--b;
draw a shifted shift--b shifted shift;

draw_M( inf, sup );
draw_M(-sup shifted shift, -inf shifted shift);

draw (0,-2mm)--(0,2mm);
draw (0,-2mm) shifted shift--(0,2mm) shifted shift;

labeloffset:=2.6mm;
label.bot( btex $\inf M$ etex, inf );
label.bot( btex $\sup M$ etex, sup );
label( btex $M$ etex, 1/2[inf,sup] );
label.bot( btex $0$ etex, (0,0) );

label.bot( btex $\inf (-M)$ etex, -sup shifted shift );
label.bot( btex $\sup (-M)$ etex, -inf shifted shift );
label( btex $-M$ etex, 1/2[-inf shifted shift, -sup shifted shift] );
label.bot( btex $0$ etex, (0,0) shifted shift );

endfig;
end