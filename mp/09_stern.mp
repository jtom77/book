verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

u:=cm;
v := 0.3*u;






beginfig(1);

labeloffset := 1pt;


path c;
c := (u,0.2u)..(0.2u,0.5u)..(0,u)..(-0.5u,0.3u)..(-u,-0.3u)
..(-0.5u,-0.5u)..(0.4u,-u)..(0.4u,-0.5u)..cycle;

fill c withcolor 0.9 white;
draw c;

draw (0,0)--(0.8u,0.2u);
draw (0,0)--(0,0.7u);
draw (0,0)--(-0.8u,-0.3u);
draw (0,0)--(0.2u,-0.8u);

dot( (0.8u,0.2u) );
dot( (0,0.7u) );
dot( (-0.8u,-0.3u) );
dot( (0.2u,-0.8u) ); 

mark( (0,0) );

label.ulft( btex $s^*$ etex, (0,-1) );



endfig;
end