verbatimtex
%&latex
\documentclass{article}
\usepackage{amsmath}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex
vardef exp( expr x ) = mexp(256)**x enddef;
 
input mydefs;

u:=1.5cm;

beginfig(1);

labloffset := 2pt;

drawarrow (-0.5u,0)--(2u,0);
drawarrow (0,-0.25u)--(0,2u);

pair p;
p := (1.5u,1.2u);

draw (0,ypart p)--p--(xpart p,0) dashed withdots scaled 0.5;

draw p withpen pencircle scaled 4pt;
draw p withpen pencircle scaled 2pt withcolor white;
drawarrow (0,0)--(p-2*unitvector(p) );



label.urt( btex $\exp(x+\mathrm{i} y)$ etex, p shifted (1,-1) );
label( btex $\rbrace$ etex yscaled 6 xscaled 2, (xpart p+5, 0.5*ypart p) );
label( btex $\rbrace$ etex rotated 90 xscaled 7.8 yscaled 2, 
(0.5*xpart p, ypart p+5) );
label.rt( btex $\exp  (x) \sin (y) $ etex, (xpart p+8, 0.5*ypart p) );
label.top( btex $\exp (x) \cos (y) $ etex, (0.5*xpart p, ypart p+8) );
draw (4mm,0){up}..{p rotated 90}( (0,0)+4mm*unitvector( p-(0,0) ) );
label.lrt( btex\small $y \mod 2\pi$ etex, (10,-3) );

draw (10,-6)--(7,2);  


label.bot( btex $\mathrm{Re}$ etex, (2u-2,-2) );
label.lft( btex $\mathrm{Im}$ etex, (-2,2u-2) );

 
endfig;
end


