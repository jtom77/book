verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

u:=2cm;


beginfig(1);

drawarrow (-u,0)--(u,0);
drawarrow (0,-mm)--(0,u);
draw (-u,u)--(0,0)--(u,u);

label.bot( btex $x$ etex, (u-2,-2) );
label.lft( btex $|x|$ etex, (-2,u-2) );
label.bot( btex $0$ etex, (0,-mm) );




endfig;
end