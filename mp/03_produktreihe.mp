verbatimtex
%&latex
  \documentclass{article}
  \usepackage{amssymb}
  \begin{document}
  etex

  input mydefs;

beginfig(1)

  u := .75cm;
  r := 5;
  picture pic;
  bboxmargin:=0pt;
  defaultscale := .7;
  
  for i=0 upto r:
    label.top(decimal(i), (i*u,2mm));
    label.lft(decimal(i), (-2mm,-i*u));
  endfor;

  drawarrow (0,0)--(r*u+.5u,0);
  drawarrow (0,0)--(0,-r*u-.5u);

  pic:=savepic;
  
  
  % for i=0 upto r:
  %   draw (i*u,0)--(i*u,-r*u-u) thin Grau;
  %   draw (0,-i*u)--(r*u+u,-i*u) thin Grau;
  % endfor;

  fill unitsquare scaled (r*u+.5u) yscaled -1 Graub;
  
  for i=0 upto r:
    for j=0 upto r:
      draw (i*u,-j*u) withpen pencircle scaled 3pt;
    endfor;
  endfor;

  ahlength:=2mm;
  pair a,b;
  for i=1 upto r+1:
    for j=0 upto i-1:
      a:=(j*u,-i*u);
      b:=a shifted (u,0);
      drawarrow 1/4[a,b]--3/4[a,b] thin;
      a:=(i*u,-j*u);
      b:=a shifted (0,-u);
      drawarrow 3/4[a,b]--1/4[a,b] thin;
    endfor;
  endfor;
  
  clip currentpicture to bbox pic;
  draw pic;

  labeloffset:=2mm;
  label.bot(btex $k$ etex, (0,-r*u-.5u));
  label.rt(btex $n$ etex, (r*u+.5u,0));

  z0 = (r*u+.3u,-2u);
  z1 = z0 shifted (u,-.5u);
  draw z0--z1 verythin;
  label.rt(btex $\mathbb{N}\times \mathbb{N}$ etex, z1);
  
  

  
endfig;
end

  