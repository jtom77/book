verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex


vardef exp( expr x ) = mexp(256)**x enddef;
 
u:=0.5cm;

beginfig(1);

drawarrow (-2u,0)--(2u,0) dashed evenly;
drawarrow (0,-2u)--(0,2u) withpen pencircle scaled 1pt;

label.lft( btex $\mathrm{Im}$ etex, (-2,2u-2) );
label.bot( btex $\mathrm{Re}$ etex,  (2u-2,-2) );

picture firstpic;
firstpic := currentpicture;
currentpicture := nullpicture;

drawarrow (-2u,0)--(2u,0) dashed evenly;
drawarrow (0,-2u)--(0,2u) dashed evenly;

draw fullcircle scaled 2u withpen pencircle scaled 1pt;

label.lft( btex $\mathrm{Im}$ etex, (-2,2u-2) );
label.bot( btex $\mathrm{Re}$ etex,  (2u-2,-2) );
label.rt( btex $S^1$ etex, (u,0) rotatedabout( (0,0), 45 ) shifted (1,0) );
draw firstpic shifted (-5u,0);

drawarrow (-3.5u,1.5u)--(-1.5u,1.5u);

label.top( btex $\exp$ etex, (-2.5u,1.5u) );
 
endfig;
end

