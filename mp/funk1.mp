verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

u := 1cm;

beginfig(1);


drawarrow (0,0)--(3u,0);
drawarrow (0,0)--(0,3u);

draw (0.2u,u)..(u,u)..(2.5u,u);




endfig;
end