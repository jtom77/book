verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex


u := 0.5cm;

beginfig(1);

%fill (0,0)--(5.5u,0)--(5.5u,-5.5u)--(0,-5.5u)--cycle withcolor 0.9 white;


for i=0 upto 4:
for j=0 upto 4:
draw (i,-j)*u withpen pencircle scaled 3;
endfor;
endfor

for i=1 upto 4:
n := 0;
forever: exitunless (n<i);
drawarrow (n,-i)*u shifted (4,0)--(n+1,-i)*u shifted (-4,0);
drawarrow (i,-i+n)*u shifted (0,4)--(i,-i+n+1)*u shifted (0,-4);
n := n+1;
endfor
endfor



drawarrow (3.5u,6)--(4.5u,6);
drawarrow (-6,-3.5u)--(-6,-4.5u);

label.top( btex $n$ etex, (4u,6) );
label.lft( btex $k$ etex, (-6,-4u) );


endfig;
end