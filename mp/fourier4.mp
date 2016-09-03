\verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex


beginfig(1);

u := 1cm;

path a;
a := (0,0.5u)--(2u,-0.5u);

draw a;
%draw a shifted (u,0) withpen pencircle scaled 1.3;;

%draw a shifted (-u,0) withpen pencircle scaled 1.3;;
draw a shifted (-2u,0);;



drawarrow (-2u,0)--(2u,0);
drawarrow (0,-0.6u)--(0,0.8u);



path b;
b := (-u,-0.5u)--(-u,0.5u);







label.lft( btex $\frac{\pi}{2}$ etex, (0,0.5u) );
label.llft( btex $\pi$ etex, (u,0) )


endfig;
end