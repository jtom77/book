verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs

vardef norm( expr x )=
sqrt( ((xpart x)**2)+((ypart x)**2) )
enddef;

vardef f( expr x )= ( (xpart x)/(1+norm(x)), (ypart x)/(1+norm(x)) )
enddef;
 
u:=1cm;
v := 0.3*u;

beginfig(1);

%fill (-2.5u,-u)--(2u,-u)--(2u,1.5u)--(-2.5u,1.5u)--cycle 
%withcolor 0.9 white;
 
pair a[];

path c;
draw fullcircle scaled 2u;

c := (0,-u)..(-0.6u,0){up}..(0,u);
c := c rotatedabout( (0,0), -45 );

draw c dashed evenly;

c := (0,-u)..(-0.5u,0){up}..(0,u);
c := c rotatedabout( (0,0), -75 );

draw (-3.5u,-u)--(0.5,2u) dashed evenly;

path g;
g := (0,-3u)--(0,3u);
g := g rotated -75;
g := g shifted (0,1.2u);
draw g;


draw c;

clip currentpicture to 
( (-2.5u,-u)--(2u,-u)--(2u,1.5u)--(-2.5u,1.5u)--cycle );


dot( (0,0) );

label.lft( btex $O$ etex, (0,0) );
label( btex $\mathbb{R}^2$ etex, (1.8u,-0.8u) );
%label.bot( btex $g$ etex, (-2.4u,-0.1u) );
%label.bot( btex $h$ etex, (2u,1.2u);




endfig;
end