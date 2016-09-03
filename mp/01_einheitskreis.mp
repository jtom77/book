verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

u := 0.9cm;
ahlength := 2mm;
ahangle := 0.75*45;

beginfig(1);

drawarrow (-1.3u,0)--(1.5u,0);
drawarrow (0,-1.3u)--(0,1.5u);

draw fullcircle scaled 2u;

label.llft( btex $-1$ etex, (-u,0) );
label.lrt( btex $1$ etex, (u,0) );
label.llft( btex $-i$ etex, (0,-u) );
label.ulft( btex $i$ etex,  (0,u) );
%label.bot( btex $\mathrm{Re}$ etex, (1.9u-mm,-mm) );
%label.lft( btex $\mathrm{Im}$ etex, (-mm,1.9u-mm) );

endfig;
end

