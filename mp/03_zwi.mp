verbatimtex
%&latex
  \documentclass{article}\begin{document}
  \footnotesize
etex

input mydefs;

vardef f( expr x ) = 2.3**x-x**1.5-0.7 enddef;

u:=1.4cm;
v := 0.82u;

beginfig(1);

  drawarrow (-0.2u,0)--(3.5u,0);
  drawarrow (0,-0.8v)--(0,2v);
  labx(btex $x$ etex, 3.5u);
  laby(btex $y$ etex, 2v);

 

  z0=(0.2u,-0.5v);
  z1=(2u,0.5v);
  z2=(3u,1.5v);

  path c;
  c := z0{dir 10}..z1..z2{dir 5};
  draw c thick;
  draw (-mm,y1)--(3u,y1) dashed evenly;
  draw (x1,-mm)--(x1,y2) dashed evenly;
  mark z1;  

  draw (x0,mm)--z0--(-mm,y0) verythin;
  draw (x2,-mm)--z2--(-mm,y2) verythin;
  draw z0 withpen pencircle scaled 3;
  draw z2 withpen pencircle scaled 3;
  
  label.top( btex $a$ etex, (x0,mm) );
  label.bot( btex $b$ etex, (x2,-mm) );
  label.lft( btex $f(a)$ etex, (-mm,y0) );
  label.lft( btex $f(b)$ etex, (-mm,y2) );
  label.lft( btex $\eta$ etex, (-mm,y1) );
  label.bot( btex $\xi$ etex, (x1,-mm) );
  label.lrt( btex $f$ etex, point 0.3 of c);

endfig;
end