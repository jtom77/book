verbatimtex
%&latex
\documentclass{article}
\usepackage[T1]{fontenc}
\renewcommand\rmdefault{fth}
\usepackage{mymath}
\begin{document}
etex

u := 1cm;

beginfig(1);

draw (0,0)--(3u,u)--(2u,3u)--cycle;

label.lft( btex \textit{A} etex, (0,0) );
label.rt( btex \textit{B} etex, (3u,u) );
label.top( btex \textit{C} etex, (2u,3u) );





label( btex Chagall Rembrandt Modigliani van Eyck Dürer etex, (0,0) );
label( btex \textit{xyz} etex, (0,10) ); 


endfig;
end


