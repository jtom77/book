verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

u := 0.8cm;
ahlength := 2mm;
ahangle := 0.75*45;

vardef drawit( expr mid, n ) =
draw fullcircle scaled 2u shifted mid;
pair a[];
for i=0 upto n-1:
a[i] := (u,0) rotatedabout( (0,0), i*360/n );
a[i] := a[i] shifted mid;
draw mid--a[i] dashed evenly scaled 0.5;
endfor
draw a[0] for i=1 upto n-1: --a[i] endfor --cycle;
enddef;

vardef root( expr n, m ) =
(u,0) rotatedabout( (0,0), m*360/n )
enddef;



beginfig(1);

pair shift;
shift := (6u,0);
drawit( -shift, 3 );
drawit( (0,0), 4 );
drawit( shift, 5 );

label.ulft( btex $\zeta_{1,3}$ etex, root(3, 1) shifted -shift);
label.llft( btex $\zeta_{2,3}$ etex, root(3, 2) shifted -shift);
label.rt( btex $1$ etex, (u,0) shifted -shift );

label.top( btex $\zeta_{1,4}$ etex, root(4, 1));
label.lft( btex $\zeta_{2,4}$ etex, root(4, 2));
label.bot( btex $\zeta_{3,4}$ etex, root(4, 3));
label.rt( btex $1$ etex, (u,0) );

label.urt( btex $\zeta_{1,5}$ etex, root(5, 1) shifted shift);
label.ulft( btex $\zeta_{2,5}$ etex, root(5, 2) shifted shift);
label.llft( btex $\zeta_{3,5}$ etex, root(5, 3) shifted shift);
label.lrt( btex $\zeta_{4,5}$ etex, root(5, 4) shifted shift);
label.rt( btex $1$ etex, (u,0) shifted shift );

endfig;
end
