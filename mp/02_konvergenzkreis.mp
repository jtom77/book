verbatimtex
%&latex
  \documentclass{article}
  \usepackage{amssymb}
  \begin{document}
  \fontsize{8}{8}\selectfont
etex

input mydefs;
  
u := 1.4cm;

beginfig(1);

pair a;
a := (0.8,0.6)*u;

  fill (-0.5u,-0.5u)
    --(2u,-0.5u)
    --(2u,2u)
    --(-0.5u,2u)
    --cycle withcolor 0.9 white;

  fill fullcircle scaled 1.8u shifted a withcolor white;
  draw fullcircle scaled 1.8u shifted a;

  mark a;

  drawarrow (-0.5u,0)--(2u,0);
  drawarrow (0,-0.5u)--(0,2u);

  label.bot( btex $a$ etex, a- (0,3));
  label.top( btex konvergent etex, a shifted (0,8) );
  label.top( btex divergent etex, (.8u,1.7u) );
  label.llft( btex $\mathbb{C}$ etex, (2u,2u) );



endfig;
end