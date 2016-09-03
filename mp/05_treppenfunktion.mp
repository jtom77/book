verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

vardef d( expr x )=
draw x withpen pencircle scaled 3pt;
enddef;

u:=0.75cm;
v := 0.3*u;

beginfig(1);


draw (-0.4u,0)--(5.1u,0);

pickup pencircle scaled 0.6pt;
draw (0.5u,2u)--(1.5u,2u);
draw (1.5u,u)--(2.2u,u);
draw (2.2u,1.3u)--(3.5u,1.3u);
draw (3.5u,2.6u)--(4.2u,2.6u);

draw (0.5u,2u)--(0.5u,0) dashed withdots scaled 0.5;
draw (1.5u,2u)--(1.5u,0) dashed withdots scaled 0.5;
draw (2.2u,2.0u)--(2.2u,0) dashed withdots scaled 0.5;
draw (3.5u,2.6u)--(3.5u,0) dashed withdots scaled 0.5;
draw (4.2u,2.6u)--(4.2u,0) dashed withdots scaled 0.5;



mark( (1.5u,2u) );
mark( (1.5u,u) );
mark( (2.2u,1.3u) );
mark( (3.5u,2.6u) );

d( (0.5u,2u) );
d( (1.5u,2u) );
d( (3.5u,1.3u) );
d( (4.2u,2.6u) );
d( (2.2u,2.0u) );



endfig;
end