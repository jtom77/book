verbatimtex
%&latex
  \documentclass{article}
  \usepackage{amssymb}
  \begin{document}
  \footnotesize
  etex

  input mydefs;

u := 2.6cm;

beginfig(1);

  labeloffset:=2pt;
  
  numeric M;
  M := 100;

  pair a[];

  a[0] := (2u,0);

  for i=1 upto M: 
    a[i] := a[i-1];
    a[i] := a[i] rotatedabout( (0,0), 10 );
    a[i] := a[i] xscaled 0.92 yscaled 0.85;
  endfor

  scale := 27;
  fill fullcircle scaled scale shifted a[M] withcolor 0.9 white;  
  draw fullcircle scaled scale shifted a[M];  
  fill fullcircle scaled scale shifted a[10] withcolor 0.9 white;  
  draw fullcircle scaled scale shifted a[10];  

  for i=4 upto M:
    draw a[i] withpen pencircle scaled 3;
  endfor 

  draw a[M] withpen pencircle scaled 3;
  draw a[M] withpen pencircle scaled 2 withcolor white;
  draw a[10] withpen pencircle scaled 3;
  draw a[10] withpen pencircle scaled 2 withcolor white;

  label.lrt( btex $b$ etex, a[10] );
  label.ulft( btex $a$ etex, a[M] );




endfig;
end