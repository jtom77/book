verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

vardef f(expr x)= x/(1+abs(x)) enddef;

u:=0.7cm;
v := 0.3*u;

beginfig(1);


path c;

c := (0,0){dir 70}..(-u,2u);
draw c;






%for i=-5 step 2 until 5:
%drawarrow (-2.7u,0.02u*i){dir 0}..(3u-0.4u*abs(i),0.35*u*i);
%endfor;




endfig;
end