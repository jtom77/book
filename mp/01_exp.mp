verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

vardef exp primary x = ((mexp 256)**x) enddef;

u:=0.5cm;

beginfig(1);

numeric M, dx, xstart, xstop;
M := 100; 
xstart := -2;
xstop  := 1.8;
dx := (xstop-xstart)/M;

pair a[];
for i=0 upto M: a[i] := (xstart+i*dx, exp(xstart+i*dx))*u; 
endfor

drawarrow (-2u,0)--(3u,0);
drawarrow (0,0)--(0,5u);

path graph;
graph := a[0] for i=1 upto M: --a[i] endfor;

pair s,t;
s := a[20];
t := a[90];

path interior;
interior := s for i=21 upto 90: --a[i] endfor--cycle; 

%fill interior withcolor 0.9 white;

path clip;
clip := (-10u,5u)--(10u,5u);
draw graph cutafter clip withpen pencircle scaled 0.6pt;

draw s--t;

mark( s );
mark( t );

draw (u,0)--(u,-mm);
%draw (0,u)--(-mm,u);
draw (xpart s,-mm)--(xpart s,0);
draw (xpart t,-mm)--(xpart t,0);


label.bot( btex $\mathbb{R}$ etex, (3u-mm,0) );
label.lft( btex $\mathbb{R}$ etex, (0,5u-mm) );
label.bot( btex $1$ etex, (u,-mm) );
label.rt( btex  $u\mapsto e^u$ etex, a[80] );
label.bot( btex $x$ etex, (xpart s,-mm) );
label.bot( btex $y$ etex, (xpart t,-mm) );



endfig;
end