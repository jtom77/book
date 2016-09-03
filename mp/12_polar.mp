verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;


vardef drawangle( expr A, B, C, r, s, f,l )=
save p;
path p;
p := (B+f*unitvector( A-B )){unitvector(A-B) rotated r}..
(B+l*unitvector( C-B )){unitvector(C-B) rotated s};
drawarrow p;
enddef;

u:=3.0cm;
v := 0.3*u;

beginfig(1);

draw fullcircle scaled u;

path c;
path d;

c := halfcircle xscaled u yscaled -0.3u;
d := halfcircle rotated -90 yscaled u xscaled 0.5u;

draw c;
draw d;
draw c yscaled -1 dashed evenly;
draw d xscaled -1 dashed evenly;

pair v[];
v1 := (u,0)*0.8;
v2 := (-0.55u,-0.55u)*0.8;


drawarrow (14,0)--v1;
drawarrow (0,0)--v2;
drawarrow (0,0)--(0,0.8u);

pair P, Q;

P := (0.25*cosd(50)*u,0.5*sind(50)*u);
Q := c intersectionpoint d;

draw (0,0)--P;
draw (0,0)--Q;

drawangle( (-u,-u), (0,0), Q, 130, 50, 13, 16 );
drawangle( Q, (0,0), P, 110, 70, 16, 16 );

label( btex $\varphi$ etex, (0,-6) );
label( btex $\psi$ etex, (7,4) );

label.lft( btex $x$ etex, v2-(1,1) );
label.bot( btex $y$ etex, v1-(1,2));
label.lft( btex $z$ etex, (-2,0.8u-1) );

mark( P );

pair lab[];

lab1 := ( 0.5*u*cosd(50), 0.5*u*sind(50) );
lab2 := lab1 shifted (0.1u,0.05u);
%draw lab1--lab2;


label.rt( btex $S_r$ etex, lab1+(0,2) );
label.lft( btex $r$ etex, 2/3[(0,0),P] + (0,1));




endfig;
end