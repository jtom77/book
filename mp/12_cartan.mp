verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

pickup pencircle scaled 0.2pt;

vardef proj( expr x, y, z )=
(0.9*x+0.7*y,z-0.2*x+0.4*y) enddef;

u:=cm;

beginfig(1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pair v[];

pair A,B,C,D,E,F,G,H;

A := (0,0);
B := proj( u,0,0 );
C := proj( u,u,0);
D := proj( 0,u,0);

E := proj(0,0,u);
F := proj( u,0,u );
G := proj( u,u,u);
H := proj( 0,u,u);

fill B--C--G--F--cycle withcolor 0.9 white;

draw A--B--C;
draw E--F--G--H--cycle;

draw A--E;
draw B--F;
draw C--G;

draw A--D--C dashed evenly;
draw D--H dashed evenly;

A := proj( u,0,0 );
B := proj( 2u,0,0 );
C := proj( 2u,u,0);
D := proj( u,u,0);

E := proj(u,0,u);
F := proj( 2u,0,u );
G := proj( 2u,u,u);
H := proj( u,u,u);

draw A--B--C;
draw E--F--G--H--cycle;

draw A--E;
draw B--F;
draw C--G;

draw C--D dashed evenly;


drawarrow proj( u, 0.5u, 0.5u )--proj( .3u,0.5u,0.5u )  cutbefore (A--E);
draw proj( u, 0.5u, 0.5u )--proj( .3u,0.5u,0.5u )  cutafter (A--E) dashed 
evenly;


mark( proj( u, 0.5u, 0.5u ) );

drawarrow proj( u, 0.5u, 0.5u )--proj( 1.7u,0.5u,0.5u );


endfig;
end