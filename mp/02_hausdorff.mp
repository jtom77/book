verbatimtex
%&latex
  \documentclass{article}
  \usepackage{amssymb}
  \begin{document}
  \footnotesize
  etex


  input mydefs;
  u := 0.7cm;

beginfig(1);

  path c;
  path d;

  c := (u,0)..(u,0.5u)..(0,u)..(-0.2u,1.2u)
    ..(-u,0)..(-0.3u,-0.3u)..(0,-u)..cycle;

  d := (u,0)..(0.5u,0.4u)..(0,0.7u)..(-0.3u,0.5u)
    ..(-u,0)..(-0.5u,-0.7u)..(0,-u)..cycle;

  d := d shifted (3u,0);



  fill c withcolor 0.9 white;
  fill d withcolor 0.9 white;
  draw c;
  draw d;

  markempty (0,0);
  markempty (3u,0);
  

  labeloffset:=1mm;
  label.top( btex $a$ etex, (0,0) );
  label.bot( btex $b$ etex, (3u,0) );

  picture pic;
  pic:=savepic;

  bboxmargin:=2mm;


  
  path bb;
  bb:=bbox pic;

  draw bb;
  draw pic;
  label.urt( btex $X$ etex, llcorner bb ); 

endfig;
end