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

u:=5.5cm;
v := 0.3*u;

beginfig(1);



path c;
path d;


pair v[];
v1 := (u,0)*0.4;
v2 := (-0.5u,-0.5u)*0.4;

c := halfcircle xscaled u yscaled -0.3u;
d := halfcircle rotated -90 yscaled u xscaled 0.5u;

drawarrow (14,0)--v1;
drawarrow (0,0)--v2;
drawarrow (0,0)--(0,0.4u);

pair P, Q;

P := (0.25*cosd(50)*u,0.5*sind(50)*u);
Q := c intersectionpoint d;

draw (0,0)--P;

drawangle( (-u,-u), (0,0), Q, 120, 50, 13, 16 );
drawangle( Q, (0,0), P, 110, 70, 16, 16 );

label( btex $\varphi$ etex, (0,-6) );
label( btex $\psi$ etex, (7,4) );

label.lft( btex $x_1$ etex, v2-(1,0) );
label.bot( btex $x_2$ etex, v1-(1,2));
label.lft( btex $x_3$ etex, (-2,0.4u-1) );
label.rt( btex $(x,y,z)$ etex, P+(1,0) );

path p[];
p1 := P--(P-(0,3u) );
p2 := (0,0)--Q;
pair k;
k := p1 intersectionpoint p2;
draw (0,0)--k;
draw P--k dashed evenly scaled 0.5;

mark( P );

endfig;
end