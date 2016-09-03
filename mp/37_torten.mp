verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

u := 1cm;

beginfig(1);

fill unitsquare xscaled 8u yscaled 4u withcolor (0.5,0.5,1.0);
draw unitsquare xscaled 8u yscaled 4u;

label( btex ((Bild fehlt noch)) etex, (4u,2u) );




endfig;
end