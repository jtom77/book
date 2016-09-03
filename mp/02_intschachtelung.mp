verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

u := 0.35cm;
v := u/1.8;

beginfig(1);

draw (0,0)--(10u,0);
draw (0,-2v)--(10u,-2v);
draw (0,-4v)--(10u,-4v);
draw (0,-6v)--(10u,-6v);
draw (0,-10v)--(10u,-10v);

draw (u,-7v)--(u,-9v) dashed withdots scaled 0.5;
draw (9u,-7v)--(9u,-9v) dashed withdots scaled 0.5;


pickup pencircle scaled 2;
draw (u,0)--(9u,0);
draw (u,-2v)--(6u,-2v);
draw (2u,-4v)--(5u,-4v);
draw (3u,-6v)--(4u,-6v);

draw (3.3u,-10v);


labeloffset := 2pt;
label.top( btex $I_0$ etex, (3.3u,0) );
label.top( btex $I_1$ etex, (3.3u,-2v) );
label.top( btex $I_2$ etex, (3.3u,-4v) );
label.top( btex $I_3$ etex, (3.3u,-6v) );
label.top( btex $\lim\limits_{n\to\infty} I_n$ etex, (3.3u,-10v) );






endfig;
end