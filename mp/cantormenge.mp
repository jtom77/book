verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

u := 8cm;
v := 0.04u;

def cantormenge( expr i, p ) =
  begingroup;
    save r, s;
    if( i >= 0 ):
      r := xpart 1/3[(xpart p,0),(ypart p,0)];
      s := xpart 2/3[(xpart p,0),(ypart p,0)];
      draw (s,i*v)--(ypart p,i*v);
      cantormenge( i-1, (xpart p,r) );
      cantormenge( i-1, (s,ypart p) );
      draw (xpart p,i*v)--(r,i*v);
    fi;
    endgroup;
  enddef;
  

beginfig(1);


  pickup pensquare yscaled 2pt xscaled 0.01pt;
  
  cantormenge( 4, (u,0) );
draw (0,5v)--(u,5v);
  
endfig;
end
