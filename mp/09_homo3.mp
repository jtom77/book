verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex


input mydefs;

u:=2cm;
v := 0.3*u;




beginfig(1);


draw (0,0)--(2u,0);
draw (0,-mm)--(0,mm);
draw (2u-0.5*mm,mm)..(2u,0)..(2u-0.5*mm,-mm);


draw fullcircle scaled 0.6u shifted (3.3u,0);
draw (3.6u-mm,0)--(3.6u+mm,0);


label( btex \Large$\mapsto$ etex, (2.5u,0) );
label.top( btex $[0,2\pi[$ etex, (u,0) );
label( btex $S^1$ etex, (3.2u,0.18u) );

label.bot( btex nicht kompakt etex, (u,-0.3u-mm) );
label.bot( btex kompakt etex, (3.3u,-0.3u-mm) );


endfig;
end