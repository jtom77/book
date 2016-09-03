verbatimtex
%&latex
  \documentclass{article}
  \begin{document}
  \footnotesize
  etex

  input mydefs;

vardef f( expr x ) = 2.3**x-x**1.5-0.7 enddef;

u:=0.6cm;

beginfig(1);

  pair shift;
  shift := (8u,0);

  fill fullcircle scaled 3u withcolor 0.9 white;
  draw fullcircle scaled 3u;

  path c;
  c := (2u,0){up}..(0,0){(-1,-4)}..(-2u,0){up}..(0,0)..cycle;
  c := c rotated -45;
  c := c shifted shift;
  fill c withcolor 0.9 white;
  draw c;

  path f;
  f := (-2u,-2u)--(2u,-2u)--(2u,2u)--(-2u,2u)--cycle;
  draw f;
  draw f shifted shift;

  path arr;
  arr := (1.5u,0){dir 20}..(6.5u,0){dir -20};
  arr := arr shifted (0,2.1u);
  drawarrow arr;
  label.top( btex $f:\,X \to Y$ etex, 1/2[ulcorner arr,urcorner arr]);
  label( btex $X$ etex, (-2u+5,-2u+5) );
  label( btex $Y$ etex, (-2u+5,-2u+5) shifted shift );
  label( btex $U$ etex, (0,0.3u) );
  label( btex $f(U)$ etex, (0.9u,-0.8u) shifted shift );

endfig;
end