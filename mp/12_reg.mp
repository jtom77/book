verbatimtex
%&latex
  \documentclass{article}
  \usepackage{amssymb}
  \begin{document}
  \footnotesize
  etex

  input mydefs;


u:=1.6cm;
v := 0.3*u;

beginfig(1);

  path c[];


  c1 := (0,0){dir -20}..(u,-0.8u){dir -90};
  c2 := (u,-0.8u){dir 30}..(2u,-0.6u){dir 20};
  c3 := (2u,-0.6u){dir 150}..(1.6u,0.3u){dir 90};
  c4 := (1.6u,0.3u){dir 180}..(0.8u,0.6u){dir 140};
  c5 := (0.8u,0.6u)..(0,0){dir -160};

  pair a;

  a := point 0.5 of c1;
  path d;
  d := fullcircle scaled 0.8u shifted a;

  fill d withcolor 0.8 white;
  fill buildcycle( d, c1 ) withcolor white;
  draw d;

  for i=1 upto 5: draw c[i]; endfor;
  mark( a ); 

  label.lft( btex $a$ etex, a-(1,2) );
  label.rt( btex $g<0$ etex, (point 0.3 of c1)+(-1,3.5) );
  label.top( btex $U$ etex, (point 6 of d)+(0,2) );
  label.top( btex $G$ etex, (point 0.6 of c2)+(0,2) );


endfig;
end