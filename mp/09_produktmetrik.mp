verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;



u:=0.8cm;
v := 0.3*u;



beginfig(1);

pickup pencircle scaled 0.4pt;

path c;
path d;

c := (1,0)..(0.7,0.7)..(0,0.5)..(-1,0.8)..(-1,-0.2)
..(-1,-1)..(-0.3,-1)..(0.8,-0.5)..cycle;

d := (1,-1)--(1,1)--(-1,1)--(-1,-1)--cycle;
d := d xscaled 0.5u yscaled 0.5u;
fill d withcolor 0.9 white;
draw d;

c := c scaled u;
c := c shifted (0,3);

draw c;


draw (-3u,-2u)--(3.5u,-2u)--(3.5u,2u)--(-3u,2u)--cycle;

draw (0,-2u)--(0,0)--(-3u,0) dashed withdots scaled 0.5;
draw (-0.5u,-0.5u)--(-0.5u,-2u) dashed withdots scaled 0.5;
draw (0.5u,-0.5u)--(0.5u,-2u) dashed withdots scaled 0.5;
draw (-0.5u,-0.5u)--(-3u,-0.5u) dashed withdots scaled 0.5;
draw (-0.5u,0.5u)--(-3u,0.5u) dashed withdots scaled 0.5;

label( btex $\rbrace$ etex rotated -90 xscaled 3.2 yscaled 2 , (0,-2u-2mm) );
label( btex $\lbrace$ etex xscaled 2 yscaled 3.2, (-3u-2mm,0) );

label.bot( btex $K_\varepsilon( x )$ etex, (0,-2u-3mm) );
label.lft( btex $K_\varepsilon( y )$ etex, (-3u-3mm,0) );

label.top( btex $(x,y)$ etex, (0,0) );
label.bot( btex $X$ etex, (3.3u,-2u-1) );
label.lft( btex $Y$ etex, (-3u-1,1.8u));

dot( (0,0) );


pair A, B;

A := (1.5u,-u);
B := (2.2u,u);

dot( A ); dot( B );
label.bot( btex $P_1$ etex, A-(0,1) );
label.top( btex $P_2$ etex, B+(0,1) );

draw A--(xpart B, ypart A) dashed withdots scaled 0.5;
draw A--B dashed withdots scaled 0.5;
drawarrow 0.35[B,(xpart B, ypart A)]--B;
drawarrow 0.65[B,(xpart B, ypart A)]--(xpart B,ypart A);

label( btex $d(P_1,P_2)$ etex, 0.5[B,(xpart B, ypart A)] shifted (10,0) ); 

endfig;
end