verbatimtex
%&latex
  \documentclass{article}
  \usepackage{amssymb}
  \begin{document}
  \footnotesize
  etex

  input mydefs;

numeric pi;
pi := 3.1415926;
vardef exp primary x = ((mexp 256)**x) enddef;
vardef cos primary x = (cosd(x*180/pi)) enddef;
vardef sin primary x = (sind(x*180/pi)) enddef;


u := 4cm;

beginfig(1);

  numeric M;
  M := 30;

  pair a[];

  a[0] := (0,-u);

  for i=1 upto M: 
    a[i] := a[i-1];
    a[i] := a[i] rotatedabout( (0,0), 30 );
    a[i] := a[i] xscaled exp(-0.05*i) yscaled exp(-0.05*i);
  endfor

  scale := .4u;
  path c;
  c := fullcircle scaled scale shifted a[8];
  fill c withcolor 0.9 white;  
  draw c;  

  for i=3 upto M:
    draw a[i] withpen pencircle scaled 3;
  endfor 

  markempty a[8];
  markempty a[M];

  labeloffset:=1mm;
  label.lft( btex $a_N$ etex, a[8] );
  label.top( btex $a$ etex, a[M] );

  z1=point 0 of c;
  z2=z1 shifted (.1*(u,-.3u));
  draw z1--z2 verythin;
  label.rt(btex $U_\epsilon(a_N)$ etex, z2);



endfig;
end