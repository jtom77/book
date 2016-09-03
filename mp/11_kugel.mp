verbatimtex
%&latex
\documentclass[10pt]{article}
\usepackage{amssymb}
\begin{document}
\fontsize{8}{12}
\selectfont
etex

input mydefs;

vardef f(expr x)= x/(1+abs(x)) enddef;

u:=2.1cm;
v := 0.3*u;

beginfig(1);

numeric s[];
s1 := cosd(40)*u;
s2 := sind(40)*u;

path c, d;

pair cdir, ddir;
numeric rc, rd, rcsave;

c := fullcircle xscaled (2*s1) yscaled (0.4*s1) 
shifted (0,s2);

d := fullcircle scaled 2u;
forever:
  rc := xpart (c intersectiontimes d);
  rd := ypart (c intersectiontimes d);
  cdir := direction rc of c;
  ddir := direction rd of d;
  c := c scaled 0.999;
  %draw c;
  exitif( (abs( cdir-ddir ) < 2) or (rc < 0) );
  rcsave := rc;
endfor;

fill c grau;
draw subpath( rcsave, 4-rcsave ) of c dashed evenly scaled .5;
draw subpath( 4-rcsave,8) of c..subpath( 0, rcsave ) of c;

d := fullcircle xscaled 2u yscaled 0.4u;
fill d withcolor 0.9 white;
draw subpath (0,4) of d dashed evenly scaled .5;
draw subpath (4,8) of d;

draw fullcircle scaled 2u;

drawoptions( thin );
s1 := xpart( point 0 of c );
s2 := ypart( point 0 of c );
draw (0,0)--(0,s2) dashed evenly scaled 0.5;
draw (s1,s2)--(0,0) cutafter c dashed evenly scaled .5; 
pair B;
B := ( (0,0)--(s1,s2) ) intersectionpoint c;
draw  (0,0)--B;
draw (0,s2)--(s1,s2);
draw (0,0)--(0,s2) cutafter c;
draw (0,0)--(0,s2) cutafter c;
drawoptions();

label( btex $K_2(1)$ etex, (-0.5u,0) );
label( btex $K_2(1;t)$ etex, (-0.35u,s2) );

dot( (0,0) );
dot( (0,s2) );

ahlength := 1.5mm;
drawdblarrow (-s1,0)--(-s1,s2) thin;
label.lft( btex $t$ etex, (-s1-1, s2/2 ) );


pair lab[];
lab1 := 3/4[(0,s2),(s1,s2)];
lab2 := lab1 shifted (0.3u,0.2u);
draw lab1--lab2 verythin;

label.rt( btex $\sqrt{1-t^2}$ etex, lab2 );


  
  


endfig;
end