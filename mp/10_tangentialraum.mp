verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;


u:=1.2cm;


beginfig(1);

pickup pencircle scaled 0.2pt;

path d;
path c[];
pair v[];
v1 := (2.5u,-0.2u);
v2 := (1.5u,1.4u);

pair a[];
pair b[];
a1 := (0,0);
a2 := a1 + v1;
a3 := a2 + v2;
a4 := a1 + v2;



b1 := a1+(0,-0.6u);
b2 := a2+(0.3u,-0.5u);
b3 := a3+(0.2u,-0.3u);
b4 := a4+(0.1u,-0.1u);

c1 := b1{dir 20}...b2{dir -20};
c2 := b2{dir 70}...b3{dir 20};
c3 := b3{dir 160}...b4{dir 180};
c4 := b4{dir -150}...b1{dir -90};
c5 := (point 0.9 of c4){dir 50}...(point 0.1 of c3){dir -10};

d := c1--c2--c3--c4--cycle;
d := d shifted (0.1u,0);
c5 := c5 shifted (0.1u,0);
c4 := c4 shifted (0.1u,0);


fill d withcolor 0.9 white;
draw d;
draw c5;
fill a1--a2--a3--a4--cycle withcolor white;
draw a1--a2--a3--a4--cycle;
draw d dashed evenly;
draw c5 dashed evenly;



v1 := 1.3*u*unitvector( direction 0.7 of c5 );
pair p;
p := point 0.6 of c5;

drawarrow p--(p-v1) withpen pencircle scaled 0.6pt;

dot( p );

draw c5 dashed evenly;

label( btex $M$ etex, (point 1.0 of c1) shifted (-0.1u,0.3u) );
label( btex $a+T_a M$ etex rotated angle( a2 ), 0.8[a1,a2] shifted (0,6) );
label.bot( btex $a$ etex, p-(0,1) );
label.rt( btex $\alpha$ etex, (point 0.03 of c5)+(1,0) );

draw (0.65[a1,a4])--(0.85[a1,a4]) withpen pensquare scaled 2pt withcolor white;
draw subpath( 0.09,0.30 ) of c4 withpen pensquare scaled 2pt withcolor white;


label( btex $v=\dot{\alpha}(0)$ etex rotated angle(v1)
, (p-v1) shifted (0,6) );






endfig;
end