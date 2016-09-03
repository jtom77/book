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

draw (0.2u,u){dir 10}..(u,0.2u)..(2u,2.5u);






endfig;
end