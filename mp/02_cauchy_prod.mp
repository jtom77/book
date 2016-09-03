verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;
u := 0.7cm;

beginfig(1);

%fill (0,0)--(5.5u,0)--(5.5u,-5.5u)--(0,-5.5u)--cycle withcolor 0.9 white;


for i=0 upto 4:
for j=0 upto 4:
if (i+j <= 4):
draw (i,-j)*u withpen pencircle scaled 3;
fi
endfor;
endfor

for i=1 upto 4:
n := i;
k := 0;
forever: exitunless (n>0);
drawarrow (n,k)*u shifted (-4,-4)--(n-1,k-1)*u shifted (4,4);
n := n-1;
k := k-1;
endfor
endfor

%pair A, B, C, D, E;
%for i=1 upto 4:
%A := (0,-i*u) shifted (0,-4);
%B := (0,-i*u) shifted (0,-0.5u);
%C := ((i+1)*u,0) shifted (-4,0);
%D := (i*u,0) shifted (0.5u,0);
%E := 1/2[B,D];
%draw A--B dashed evenly;
%drawarrow B--E dashed evenly;
%draw E--D dashed evenly;
%draw D--C dashed evenly;
%endfor;

drawarrow (0,0) shifted (4,0)--(u,0) shifted (-4,0);

drawarrow (3.5u,6)--(4.5u,6);
drawarrow (-6,-3.5u)--(-6,-4.5u);



label.top( btex $n$ etex, (4u,6) );
label.lft( btex $k$ etex, (-6,-4u) );
label( btex $\mathbb{N} \times \mathbb{N}$ etex, (2.8u,-2.8u) );

endfig;
end