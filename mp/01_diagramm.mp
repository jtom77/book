verbatimtex
%&latex
\documentclass{article}
\begin{document}
%\footnotesize
etex


vardef draw_arr( expr A, B ) = draw A--B; enddef;

u:=0.65cm;

beginfig(1);



label( btex $G$ etex, (0,0) );
label( btex $G'$ etex, (2u,0) );
label( btex $G/N$ etex, (0,-2u) );

draw_arr( (0,0), (2u,0) );
draw_arr( (0,0), (0,-2u) );
draw_arr( (0,-2u), (2u,0) );





endfig;
end