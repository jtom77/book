verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex


vardef f( expr x ) = 2.3**x-x**1.5-0.7 enddef;

u:=0.7cm;

beginfig(1);

drawarrow (0,0)--(3u,0);
drawarrow (0,0)--(0,2u);

path c;

a := 1.5;
b := 1.7;

c := (0.1u,0.2u){dir 50}...(u,u){dir 0}...(2u,0.5u)...(3u,2u){dir 80};
draw subpath (0,a) of c;
draw subpath (b,3) of c;

pair p;
p := point 1.6 of c; 
draw p withpen pencircle scaled 2pt;

draw (xpart p,0)--(xpart p,-mm);
draw (-mm,ypart p)--(0,ypart p);

draw (xpart p,0)--p--(0,ypart p) dashed withdots;


label.rt( btex $f$ etex, point 2.9 of c );
label.bot( btex $a$ etex, (xpart p,-mm) );
label.lft( btex $l$ etex, (-mm,ypart p) );

endfig;
end