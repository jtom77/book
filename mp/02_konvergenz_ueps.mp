verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex


u := 1cm;

beginfig(1);

numeric M;
M := 100;

pair a[];

a[0] := (2u,0);

for i=1 upto M: 
a[i] := a[i-1];
a[i] := a[i] rotatedabout( (0,0), 10 );
a[i] := a[i] xscaled 0.96 yscaled 0.94;
endfor

scale := 40;
fill fullcircle scaled scale shifted a[M] withcolor 0.9 white;  
draw fullcircle scaled scale shifted a[M];  


for i=0 upto M:
draw a[i] withpen pencircle scaled 3;
%draw a[i]--a[i+1];
endfor 

draw a[M] withpen pencircle scaled 3;
draw a[M] withpen pencircle scaled 2 withcolor white;

label( btex $U_{\epsilon}(a)$ etex, a[M] shifted (0,12) );



endfig;
end