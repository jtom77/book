verbatimtex
%&latex
  \documentclass{article}
  \begin{document}
  \footnotesize
  etex

  input mydefs

  vardef f( expr x ) = 2.3**x-x**1.5-0.7 enddef;

u:=1.3cm;

beginfig(1);

  drawarrow (-0.2u,0)--(3.5u,0);
  drawarrow (0,-0.8u)--(0,1.4u);
  labx(btex $x$ etex, 3.5u);
  laby(btex $y$ etex, 1.4u);

  

  path c;
  c := (0.2u,-0.5u){dir 10}..(1.5u,0)..(3u,u){dir 5};
  draw c thick;

  mark( (1.5u,0) );

  z0 = point 0 of c;
  z1 = point length(c) of c;
  draw z0 withpen pencircle scaled 3;
  draw z1 withpen pencircle scaled 3;
  
  draw (x0,mm)--z0--(-mm,y0) verythin;
  draw (x1,-mm)--z1--(-mm,y1) verythin;
  
  labeloffset:=3pt;
  label.top( btex $a$ etex, (0.2u,mm) );
  label.bot( btex $b$ etex, (3u,-mm) );
  label.lft( btex $f(a)$ etex, (-mm,-0.5u) );
  label.lft( btex $f(b)$ etex, (-mm,u) );
  label.bot( btex $\xi$ etex, (1.5u,0) );
  label.ulft( btex $f$ etex, point 1.4 of c);

  

endfig;
end