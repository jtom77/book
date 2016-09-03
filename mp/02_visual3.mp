verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

u := cm;

beginfig(1);

pair shift;

pair a[];

a[0] := (u,u);

shift := (1.5u,1.5u);

for i=1 upto 40:
a[i] := a[i-1];
a[i] := a[i-1] rotatedabout( (0,0), 30 );
a[i] := a[i] xscaled 0.95 yscaled 0.9;
endfor



for i=0 upto 40:
a[i] := a[i] shifted shift;
endfor

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

shift := (0,0);

fill (0,0) shifted shift--(3u,0) shifted shift--(3u,3u) shifted shift
--(0,3u) shifted shift--cycle withcolor 0.9 white;

drawarrow (0,0) shifted shift--(3u,0) shifted shift;
drawarrow (0,0) shifted shift--(0,3u) shifted shift;


for i=0 upto 40:
a[i] := a[i] shifted shift;
endfor;

for i=1 upto 40:
draw a[i]--a[i-1];
endfor

for i=0 upto 40:
markempty( a[i] );
endfor

label.bot( btex $a_0$ etex, a[0]-(0,1) );
label.bot( btex $\mathrm{Re}$ etex, (3u-mm,-mm) shifted shift );
label.lft( btex $\mathrm{Im}$ etex, (-mm,3u-mm) shifted shift );

endfig;
end
