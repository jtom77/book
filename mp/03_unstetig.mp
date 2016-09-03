verbatimtex
%&latex
  \documentclass{article}
  \usepackage{amsmath}
  \usepackage{amssymb}
  \begin{document}
  \footnotesize
  etex

  input mydefs;

vardef f( expr x ) = 2.3**x-x**1.5-0.7 enddef;

u:=3cm;

beginfig(1);

  M := 100;
  xmax := 1.7; xmin := 0.1;
  dx := (xmax-xmin)/M;
  pair a[];

  for i=0 upto M:
    a[i] := (xmin+i*dx, f(xmin+i*dx))*u;
  endfor;

  l := 0.7;
  m := 1.0;
  n := 1.3;

  path c;
  mid := f(m);
  w := 0.2;

  drawarrow (-mm,0)--(1.3u,0);
  drawarrow (0,-mm)--(0,1.35u);

  draw (u,0)--(u,-mm);
  draw (-mm,u)--(0,u);

  label.bot( btex $1$ etex, (u,-mm) );
  label.lft( btex $1$ etex, (-mm,u) );

  draw (u,0)--(u,u)--(0,u);
  pickup pencircle scaled 0.6pt;

  draw (0,0)--(u,u) dashed evenly scaled 0.8;
  draw (0,u)--(u,0) dashed withdots scaled 0.8;

  draw (0.2u,1.3u)--(0.4u,1.3u) dashed evenly scaled 0.5;
  draw (0.2u,1.3u-10)--(0.4u,1.3u-10) dashed withdots scaled 0.5;
  label.rt( btex $G_f \cap \mathbb{Q}$ etex, (0.5u,1.3u) );
  label.rt( btex $G_f \cap \mathbb{R} \setminus \mathbb{Q}$ etex, 
      (0.5u,1.3u-10) );

  mark( (0.3u,0.3u) );
  mark( (0.3u,0.7u) );

  label.lrt( btex $\big( x, f(x) \big)$ etex, (0.3u,0.3u) );
  label.urt( btex $\big( y, f(y) \big)$ etex, (0.3u,0.7u) );


endfig;
end