verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

u:=1cm;

vardef draw_M_alt( expr a, b )=
draw a--b withpen pencircle scaled 2;
draw a withpen pencircle scaled 4;
draw a withpen pencircle scaled 2 withcolor white;
draw b withpen pencircle scaled 4;
draw b withpen pencircle scaled 2 withcolor white;
enddef;

beginfig(1);

pair a,b, inf, sup;

labeloffset := 2;

a:=(-3u,0);
b:=(3u,0);
pair shift;
shift:=(6.5u,0);
inf:=(-u,0);
sup:=(2u,0);

draw a--b;
draw a shifted shift--b shifted shift;

draw_M_alt( inf, sup );
draw_M_alt(-sup shifted shift, -inf shifted shift);

%draw (0,-2mm)--(0,2mm);
%draw (0,-2mm) shifted shift--(0,2mm) shifted shift;

draw (0,0) withpen pencircle scaled 4;
draw (0,0) withpen pencircle scaled 2 withcolor white;
draw (0,0) shifted shift withpen pencircle scaled 4;
draw (0,0) shifted shift withpen pencircle scaled 2 withcolor white;

%labeloffset:=2.6mm;
label.bot( btex $\strut\inf M$ etex, inf );
label.bot( btex $\strut\sup M$ etex, sup );
label.top( btex $\strut M$ etex, 1/2[inf,sup] );
label.bot( btex $\strut 0$ etex, (0,0) );

label.bot( btex $\strut\inf (-M)$ etex, -sup shifted shift );
label.top( btex $\strut -\sup M$ etex,   -sup shifted shift );
label.bot( btex $\strut \sup (-M)$ etex, -inf shifted shift );
label.top( btex $\strut -\inf M$ etex,   -inf shifted shift );
label.top( btex $\strut -M$ etex, 1/2[-inf shifted shift, -sup shifted shift] );
label.bot( btex $\strut 0$ etex, (0,0) shifted shift );


endfig;
end
