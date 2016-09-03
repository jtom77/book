verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

vardef draw_square( expr m )=
fill (-m,-m)--(m,-m)--(m,m)--(-m,m)--cycle withcolor 0.8 white;
draw (-m,-m)--(m,-m)--(m,m)--(-m,m)--cycle;
enddef;

u := cm;

beginfig(1);

pickup pencircle scaled 0.3pt;

fill fullcircle scaled 2u withcolor 0.9 white;
draw fullcircle scaled 2u; 

draw_square( 0.6u );

fill fullcircle scaled u withcolor 0.9 white;
draw fullcircle scaled u; 

draw_square( 0.3u );

dot( (0,0) );

endfig;
end

