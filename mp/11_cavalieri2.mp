verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

vardef f(expr x)= x/(1+abs(x)) enddef;

beginfig(1);

  sc := 0.7;
  
  u := 1cm*sc;
  pair shift;
  shift := (5u,0);
  dx := 2*sc;   
  dy := 2.5*sc;
  M := 30;
  N := 20;
  pair lab;

 
  path c[];path q[]; path @[];
  for i=0 upto M:
    q[i] := ((-i*dx,0)--(i*dx,0)) shifted (0,-dy*i);
    @[i] := q[i] shifted (u*sin(10*i/M),0);
  endfor;

  c1 := (0,0)--(-M*dx,-M*dy)--(M*dx,-M*dy)--cycle;
  c2 := point 0 of @0 for i=1 upto M: --point 0 of @[i] endfor
     for i=M step -1 until 0: --point 1 of @[i] endfor -- cycle;
  
  picture pic[];

  pic1 := image(
    for i=0 upto M: draw q[i] if i=N: verythick fi;
    endfor;
  );

  pic2 := image(
      for i=0 upto M: draw @[i] if i=20: verythick fi;
  endfor;
  );

pic3 := image(
  drawarrow (0,-M*dy-2mm)--(0,4mm);
  label.lft( btex $t$ etex, (-mm,-N*dy) );
  for i=0 upto M:
    if( i mod 5 = 0 ):
      draw (-mm,-i*dy)--(mm,-i*dy) verythin;
    else:
      draw (-.5mm,-i*dy)--(.5mm,-i*dy) verythin;
    fi;
  endfor;
  );

picture lab;
ahlength := 2mm;
pic4 := image(
  drawdblarrow q[N] shifted (0,-15*dy);
  lab := thelabel.bot(btex $\mathrm{vol}_{n-1} K(t)$ etex, point .5 of
    q[N] shifted (0,-15*dy) );
  %unfill bbox lab;
  draw lab;
  );
pic5 := image(
  drawdblarrow @[N] shifted (-.6cm,-15*dy);
  lab := thelabel.bot(btex $\mathrm{vol}_{n-1} L(t)$ etex, point .5 of
    @[N] shifted (-.6cm,-15*dy) );
  %unfill bbox lab;
  draw lab;
  );

clip pic1 to c1;
clip pic2 to c2;
addto pic1 also pic4;
addto pic2 also pic5;


addto pic2 doublepath c2;
addto pic1 doublepath c1;


pic1 := halign( pic1, pic2, 10mm );

draw pic1;
draw pic2;
draw pic3 shifted (xpart 1/2[urcorner pic1,ulcorner pic2],0);



endfig;
end