verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

def pi = 3.14159 enddef;

vardef cos( expr x ) = cosd( x*180/pi ) enddef; 
vardef sin( expr x ) = sind( x*180/pi ) enddef;

u:=0.8cm;
v := 0.3*u;

beginfig(1);


drawarrow (0,0)--(3u,0);
drawarrow (0,0)--(0,5u);

draw (u,0)--(1.5u,4u)--(2u,0)--(2.9u,0);

draw (0,4u)--(-mm,4u);
draw (u,0)--(u,-mm);


draw (1.5u,4u)--(0,4u) dashed withdots scaled 0.5;
draw (1.5u,4u)--(1.5u,0) dashed withdots scaled 0.5;

label.bot( btex $a$ etex, (u,-mm) );
label.lft( btex $K$ etex, (-mm,4u) );
label( btex $\rbrace$ etex scaled 1.4 rotated -90, (1.75u,-1.5mm) );
label.bot( btex $\frac{1}{K}$ etex, (1.75u,-2.5mm) );


endfig;
end