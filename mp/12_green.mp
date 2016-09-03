verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

vardef f(expr x)= x/(1+abs(x)) enddef;

u:=2cm;
v := 0.3*u;

beginfig(1);


path c;

c := (0,0){dir 20}...(0,1u){dir 30}...(-0.2u,1.5u);

fill (-0.3u,0)--c--(-0.3u,1.5u)--cycle withcolor 0.9 white;

draw c withpen pencircle scaled 0.8pt;

pair a;
a := point 0.3 of c;

pair v, n;
v := 0.3u*unitvector(direction 0.3 of c);
n := v rotated -90;

drawarrow a--a+v;
drawarrow a--a+n;

label.rt( btex $\tau$ etex, a+v shifted (2,-2) );
label.bot( btex $\eta$ etex, a+n shifted (-2,-2) );

label.rt( btex $\alpha$ etex, point 0.1 of c shifted (1,0) );

label( btex $G$ etex, (-0.15u,0.25u) );



endfig;
end