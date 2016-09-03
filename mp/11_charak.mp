verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

vardef f(expr x)= x/(1+abs(x)) enddef;

u:=1.8cm;
v := 0.3*u;

labeloffset := 2pt;

beginfig(1);


  draw (-2u,0)--(2u,0) thin;
  draw (-u,u)--(u,u) verythick;
  draw (-2.3*u,0)--(-u,0) verythick;
  draw (2.3*u,0)--(u,0) verythick;

  draw (u,u)--(u,0) dashed evenly;
  draw (-u,u)--(-u,0) dashed evenly;
  draw (u,0)--(u,-mm);
  draw (-u,0)--(-u,-mm);


  label.top( btex $\chi_{[a_k,b_k]}$ etex, (-0.5u,u) );

  label( btex $a_k$ etex, (-u,-7) );
  label( btex $b_k$ etex, (u,-7) );

  for i=-2.2 step 0.2 until -1.2:
    draw (i*u,0)--(-u,u) thin;
    %mark (i*u,0);
    draw (-i*u,0)--(u,u) thin;
    %mark (-i*u,0);
  endfor;
  


endfig;
end