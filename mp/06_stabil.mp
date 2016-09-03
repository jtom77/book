verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

u:=1.7cm;
v := 0.3*u;

vardef dot( expr A )=
draw A withpen pencircle scaled 3pt;
enddef;

vardef mark( expr A )=
draw A withpen pencircle scaled 3pt;
draw A withpen pencircle scaled 2pt withcolor white
enddef;

beginfig(1);

labeloffset := 1.5pt;


fill (0.5u,0)--(0.5u,0.5u)--(u,0.5u)--(u,0)--cycle withcolor 0.9 white;
fill (0.25u,0)--(0.25u,u)--(0.5u,u)--(0.5u,0)--cycle withcolor 0.8 white;
fill (0.125u,0)--(0.125u,2u)--(0.25u,2u)--(0.25u,0)--cycle withcolor 0.7 white;

draw (0.125u,0)--(0.125u,2u) dashed withdots scaled 0.5;
draw (0.25u,0)--(0.25u,2u) dashed withdots scaled 0.5;
draw (0.5u,0)--(0.5u,u) dashed withdots scaled 0.5;
draw (u,0)--(u,0.5u) dashed withdots scaled 0.5;

draw (0.125u,2u)--(0.25u,2u);
draw (0.25u,u)--(0.5u,u);
draw (0.5u,0.5u)--(u,0.5u);

draw (0,0.5u)--(-mm,0.5u);
draw (0,u)--(-mm,u);
draw (0,2u)--(-mm,2u);

label.bot( btex $\frac{1}{8}$ etex, (0.125u,0) );
label.bot( btex $\frac{1}{4}$ etex, (0.25u,0) );
label.bot( btex $\frac{1}{2}$ etex, (0.5u,0) );
label.bot( btex $1$ etex, (u,0) );
label.lft( btex $\frac{1}{2}$ etex, (-mm,0.5u) );
label.lft( btex $1$ etex, (-mm,u ) );
label.lft( btex $2$ etex, (-mm,2u ) );

label.top( btex $\varphi_1$ etex, (u-3,0.5u) );
label.top( btex $\varphi_2$ etex, (0.5u-3,u) );
label.top( btex $\varphi_3$ etex, (0.25u-3,2u) );

drawarrow (0,0)--(1.4u,0);
drawarrow (0,0)--(0,2.2u);


endfig;
end