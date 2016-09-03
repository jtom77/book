verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

u:=1.3cm;

beginfig(1);

path c;

path c;
c := (0.2u,0)..(0.5u,0.5u)..(0,0.4u)..(-0.4u,0.5u)..(-0.5u,0)..
(-0.2u,-0.1u)..(0,-0.6u)..(0.3u,-0.3u)..cycle;


fill c withcolor 0.9 white;
draw c;

pair k, p, z;
pair t;
k := point 5.8 of c;
t := direction 5.8 of c;
t := t rotated -90;
draw k withpen pencircle scaled 4;
p := (0,0) shifted k+3*t;
z := (0,-0.2u);
draw z withpen pencircle scaled 4;
draw p withpen pencircle scaled 4;
draw p--k;
draw p--z dashed evenly;

label.lft( btex $p$ etex, p );
label.rt( btex $k$ etex, k shifted (0,3) );
label.top( btex $z$ etex, z );
label( btex $K$ etex, (-.4u,0.3u) );

endfig;
end