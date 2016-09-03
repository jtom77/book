verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

vardef f( expr x ) = 2.3**x-x**1.5-0.7 enddef;

u:=0.6cm;

beginfig(1);


drawarrow (0,0)--(6u,0);
drawarrow (0,0)--(0,4.3u);

a := 0.5u;
b := 2.5u;
c := 3.5u;
d := 5u;

draw (a,0.1u){dir 10}..(u,0.2u)..{dir 20}(b,u) withpen pencircle scaled 1pt;
draw (c,2.2u){dir -10}..(4.2u,1.8u)..{dir -20}(d,1.5u) 
withpen pencircle scaled 1pt;

draw (a,0)--(a,-mm);
draw (b,0)--(b,-mm);
draw (c,0)--(c,-mm);
draw (d,0)--(d,-mm);

draw (a,0)--(a,0.1u) dashed evenly;
draw (b,0)--(b,u) dashed evenly;
draw (c,0)--(c,2.2u) dashed evenly;
draw (d,0)--(d,1.5u) dashed evenly;

label.top( btex $a$ etex, (a,-4.5mm) );
label.top( btex $b$ etex, (b,-4.5mm) );
label.top( btex $c$ etex, (c,-4.5mm) );
label.top( btex $d$ etex, (d,-4.5mm) );

label.rt( btex $D(f)=[a,b]\cup [c,d]$ etex, (12,3.8u-5) );

endfig;
end
