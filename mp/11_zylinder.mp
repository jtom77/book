verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs

u:=1.0cm;
v := 0.3*u;

beginfig(1);


  path c;
  path d;

  c := (-2u,0){dir -90}
    ...(0,-0.5u){dir -20}
    ...(2u,0){dir 90}
    ...(0.3u,u){dir -215}...cycle;

  c := c yscaled 0.5 xscaled 0.9;
  d := c shifted (0,1u);

  draw point 0 of c--point 0 of d;
  draw point 2 of c--point 2 of d;


  fill c withcolor 0.9 white;
  draw subpath (0,2) of c;
  draw subpath (2,4) of c dashed evenly;

%fill d withcolor 0.9 white;
  draw d;

  pair A,B;
 
  A := (point 0 of c) shifted (-6,0);
  B := (point 0 of d) shifted (-6,0);

  ahlength := 2mm;
  drawarrow 0.35[A,B]--A thin;
  drawarrow 0.65[A,B]--B thin; 

  label( btex $1$ etex, 1/2[A,B] );
  label( btex $A$ etex, (0,4) );

endfig;
end