verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

u := 2cm;
ahlength := 2mm;
ahangle := 0.75*45;

beginfig(1);

path c;

c := (u,0){dir 80}..(0.5u,0.5u)..
(0,0.7u){dir 170}..(-0.2u,0){dir -110}..(0.2u,-0.5u){dir 70}..cycle;

c := c shifted (0,-0.1u);
fill c withcolor 0.9 white;
draw c;

fill fullcircle scaled 0.7u shifted (0.4u,0) withcolor 0.8 white;
draw fullcircle scaled 0.7u shifted (0.4u,0);

mark( (0.4u,0) );

label.lft( btex $a$ etex, (0.4u-2,0) );
label( btex $U_\varepsilon (a)$ etex, (0.4u,-0.2u) );
label( btex $U$ etex, (0,-0.5u) );




endfig;
end

