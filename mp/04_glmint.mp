verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

vardef f( expr x, n ) = x**n enddef;

u:=0.7cm;

beginfig(1);

pickup pencircle scaled 0.6pt;


fill (0,0)--(u/4,4*u)--(u/2,0)--cycle withcolor 0.9 white;
draw (u/4,4u)--(u/4,-mm) dashed evenly;
draw (u/2,0)--(u/2,-mm);
draw (2u,0)--(2u,-mm);


for i=1 upto 4:
if( not(i=3) ):
draw (0,0)--(u/i,u*i)--(2*u/i,0)--(u,0);
fi
endfor;

drawarrow (0,0)--(2.5u,0);
drawarrow (0,0)--(0,4.5u);

labeloffset := 1.5pt;
label.bot( btex $\frac{1}{n}$ etex, (u/4,-mm) );
label.bot( btex $\frac{2}{n}$ etex, (u/2,-mm) );
label.bot( btex $2$ etex, (2u,-mm) );
label.rt( btex $f_1$ etex, (1.5u,0.5u) shifted (0,2));
label.rt( btex $f_2$ etex, (0.75u,1.5u) shifted (-3,0) );
label.rt( btex $f_n$ etex, (0.5*0.75u,3u) shifted (-2,0) );


endfig;
end