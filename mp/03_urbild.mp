verbatimtex
%&latex
  \documentclass{article}
  \begin{document}
  \footnotesize
%\fontfamily{cmss}
  etex

  input mydefs;

vardef f( expr x ) := x+sin(3*x) enddef;

u := 0.8cm;

beginfig(1);

  pen p[];
  p1 := pensquare yscaled 2 xscaled .1 shifted (0,-1);
  p2 := p1 rotated -90;
  labeloffset:=2mm;
  
  pair a[];
  a[0] := (0,0)*u;
  a[1] := (2,0.5)*u;
  a[2] := (5,3)*u;
  a[3] := (6,4)*u;

  path c;
  c := a[0]{dir 30}..a[1]{dir -30}..a[2]{dir -20}..a[3]{dir 80};

  path tmp;
  pair A;
  pair B;
  tmp := (0,2.7u)--(10u,2.7u);
  A := c intersectionpoint tmp;
  tmp := (0,3.3u)--(10u,3.3u);
  B := c intersectionpoint tmp;

  fill (0,ypart A)--A--(xpart A,0)--(xpart B,0)--B--(0,ypart B)--cycle 
    withcolor 0.9 white;

  draw (0,ypart A)--A--(xpart A,0) dashed evenly thin;
  draw (0,ypart B)--B--(xpart B,0) dashed evenly thin;
  draw (xpart A,0)--(xpart B,0) withpen p1;
  draw (0,ypart A)--(0,ypart B) withpen p2;
  label.bot(btex \strut$f^{-1}(B)$ etex, 1/2[(xpart A,0), (xpart B,0)]);
  label.lft(btex $B$ etex, 1/2[(0,ypart A), (0,ypart B)]); 

  tmp := (0,0.4u)--(10u,0.4u);
  A := c intersectionpoint tmp;
  tmp := (0,0.8u)--(10u,0.8u);
  B := c intersectionpoint tmp;

  fill (0,ypart A)--A--(xpart A,0)--(xpart B,0)--B--(0,ypart B)--cycle 
    withcolor 0.9 white;

  draw (0,ypart A)--A--(xpart A,0) dashed evenly thin;
  draw (0,ypart B)--B--(xpart B,0) dashed evenly thin;

  draw (xpart A,0)--(xpart B,0) withpen p1;
  draw (0,ypart A)--(0,ypart B) withpen p2;
  label.bot(btex \strut$A$ etex, 1/2[(xpart A,0), (xpart B,0)]);
  label.lft(btex $f(A)$ etex, 1/2[(0,ypart A), (0,ypart B)]); 
  
  drawarrow (0,0)--(7u,0);
  drawarrow (0,0)--(0,4u);

  labeloffset := 1pt;
  labx(btex $X$ etex, 7u);
  laby(btex $Y$ etex, 4u);
  label.lrt(btex $f$ etex, point (length c) of c); 
    
  draw c thick;

endfig;
end