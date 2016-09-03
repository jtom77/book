verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

vardef f(expr x)= x/(1+abs(x)) enddef;

u:=0.3cm;
v := 0.3*u;

beginfig(1);

l := u;
s := 2u;

draw (-3u,-2u)--(3u,-2u)--(3u,2u)--(-3u,2u)--cycle 
withpen pencircle scaled 0.8pt;

drawarrow (0,-2u)--(0,-2u-l);
drawarrow (3u,0)--(3u+l,0);
drawarrow (0,2u)--(0,2u+l);
drawarrow (-3u,0)--(-3u-l,0);

label( btex $Q$ etex, (0,0) );
label.rt( btex $\eta$ etex, (2,-2u-l+2));
label.rt( btex $\eta$ etex, (2,2u+l-2));

draw (-3u,-2u)--(-3u,-2u-s) dashed evenly; 
draw (3u,-2u)--(3u,-2u-s) dashed evenly; 
draw (-3u,-2u)--(-3u-s,-2u) dashed evenly;
draw (-3u,2u)--(-3u-s,2u) dashed evenly; 

draw (-3u-s,-2u-s)--(3u+s,-2u-s);
draw (-3u-s,-2u-s)--(-3u-s,2u+l);

draw (-3u,-2u-s)--(3u,-2u-s) withpen pencircle scaled 0.8pt;
draw (-3u-s,-2u)--(-3u-s,2u) withpen pencircle scaled 0.8pt;
label.lft( btex $a$ etex, (-3u-s-1,-2u) );
label.lft( btex $b$ etex, (-3u-s-1,2u) );
label.bot( btex $Q'$ etex, (0,-2u-s-1) );




endfig;
end