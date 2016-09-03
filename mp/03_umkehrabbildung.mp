verbatimtex
%&latex
  \documentclass{article}
  \begin{document}
  \footnotesize
%\fontfamily{cmss}
  etex

  input mydefs;

vardef f( expr x ) := x**0.6 enddef;

u := 0.9cm;

beginfig(1);

  path c;
  pair a[];
  pair b[];

  M := 100;
  dx := 4.0/M;
  for i=0 upto M:
    a[i] := (i*dx, f(i*dx ) )*u;
    b[i] := (ypart a[i], xpart a[i]);
  endfor
  
  draw (0,0)--(3.5u,3.5u);

  drawarrow (0,0)--(4u,0);
  drawarrow (0,0)--(0,4u);

  pickup pencircle scaled 0.6pt;

  draw a0 for i=1 upto M: --a[i] endfor thick;
  draw b0 for i=1 upto M: --b[i] endfor dashed evenly scaled 0.7 thick;

  labx(btex $X$ etex, 4u);
  laby(btex $Y$ etex, 4u);
  label.rt( btex $f$ etex, a[M] + (1,0) );
  label.rt( btex $f^{-1}$ etex, b[M] + (1,0) );
  label.rt( btex $y=x$ etex, (3.5u+3,3.5u+1) );

endfig;
end