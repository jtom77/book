verbatimtex
%&latex
  \documentclass{article}
  \usepackage{amssymb}
  \begin{document}
  \footnotesize
  etex


  input mydefs;
  u := 1.2cm;

beginfig(1);

  pair a[];
  M := 50;

  a[0] := (2u,0);

  drawarrow (0,0)--(3u,0);
  drawarrow (0,0)--(0,2.2u);

  for i=1 upto M: 
    a[i] := a[i-1];
    a[i] := a[i] rotatedabout( (0,0), 15 );
    a[i] := a[i] xscaled 0.93 yscaled 0.88;
  endfor

  for i=0 upto M:
    a[i] := a[i] shifted (1.3u,u);
  endfor

  scale := u;
  z = a[M];
  r := .5*scale;


  fill fullcircle scaled (sqrt(2)*scale) shifted z withcolor 0.8 white; 
  draw fullcircle scaled (sqrt(2)*scale) shifted z thin; 
  fill fullsquare scaled scale shifted z withcolor .9white;
  draw fullsquare scaled scale shifted z thin;

  
  for i=1 upto M:
    draw a[i] withpen pencircle scaled 3;
  endfor

  drawoptions(dashed evenly thin);
  draw a[M] shifted (scale/2,0)--(xpart a[M],-mm) shifted (scale/2,0);
  draw a[M] shifted (-scale/2,0)--(xpart a[M],-mm) shifted (-scale/2,0); 
  draw a[M] shifted (0,scale/2)--(-mm,ypart a[M]) shifted (0,scale/2);
  draw a[M] shifted (0,-scale/2)--(-mm,ypart a[M]) shifted (0,-scale/2); 
  % draw a[M]--(xpart a[M],0) dashed evenly;
  % draw a[M]--(0,ypart a[M]) dashed evenly;
  drawoptions();
  

  pen p[];
  p1:=pensquare yscaled 2 xscaled .1 shifted (0,-1);
  p2:=p1 rotated -90;

  draw (x-r,0)--(x+r,0) withpen p1;
  draw (0,y-r)--(0,y+r) withpen p2;
  
  label.bot( btex $U_{\epsilon'}(x)$ etex, (xpart a[M], -mm ) );
  label.lft( btex $U_{\epsilon'}(y)$ etex, (-mm,ypart a[M]) );
  z1=(sqrt(2)*scale/2,0) rotated -5 shifted z;
  z2=(20+sqrt(2)*scale/2,0) rotated -10 shifted z;
  draw z1--z2 verythin;
  label.rt(btex $U_\epsilon(a)$ etex, z2);
  
  labx( btex $\mathrm{Re}$ etex, 3u );
  laby( btex $\mathrm{Im}$ etex, 2.2u );
  label.lft(btex $a$ etex, z-(4,0));

endfig;
end