verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

vardef exp( expr x ) = mexp(256)**x enddef; 

u:=0.5cm;

beginfig(1);

pair a[];

M := 100;
xmin :=-4;
xmax := mlog(11)/256;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := u*( xmin+i*dx, exp( xmin+i*dx ) );
endfor 

draw a0 for i=1 upto M: --a[i] endfor withpen pencircle scaled 0.6pt;

drawarrow (-4u,0)--(3u,0);
drawarrow (0,0)--(0,11u);

draw (-mm,u)--(0,u);
draw (-mm,u*exp(1))--(0,u*exp(1));
draw (u,0)--(u,-mm);
draw (0,u*exp(1))--(u,u*exp(1))--(u,0) dashed withdots scaled 0.5;
label.lft( btex $1$ etex, (-mm,u) );
label.lft( btex $e$ etex, (-mm,u*exp(1)) );
label.bot( btex $1$ etex, (u,-mm) );

label.lft( btex $\exp$ etex, (1.6*u,exp(1.6)*u) );


endfig;
end