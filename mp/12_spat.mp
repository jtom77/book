verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

pickup pencircle scaled 0.2pt;

vardef proj( expr x, y, z )=
(0.9*x+0.7*y,z-0.2*x+0.4*y) enddef;

u:=0.6cm;

beginfig(1);

pickup pencircle scaled 0.2pt;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pair v[];

v1 := proj( 3u,0,2u );
v2 := proj( 0, 2u, u );

for i=0.5 step 0.6 until 2.7:
for j=0.4 step 0.6 until 1.7:
draw proj(i*u,j*u,-0.2u)--proj(i*u,j*u,2u);
endfor;
endfor;

path m;

m := (0,0){v1}..(v1-(0,0.7u))--(v1-(0,0.7u)){dir 70}..( v1+v2+(0.4u,-0.7u) )
--( v1+v2+(0.4u,-0.7u) ){dir -160}..v2--cycle;

fill m withcolor 0.9 white;
draw m;

fill (0,0)--v1--(v1+v2)--v2--cycle withcolor white; 
draw v1--(v1+v2)--v2 withpen pencircle scaled 0.6pt; 

drawarrow (0,0)--v1 withpen pencircle scaled 0.6pt;
drawarrow (0,0)--v2 withpen pencircle scaled 0.6pt;


for i=0.5 step 0.6 until 2.7:
for j=0.4 step 0.6 until 1.7:
mark( proj(i*u,j*u,2/3*i*u+0.5*j*u) ); 
drawarrow proj(i*u,j*u,2/3*i*u+0.5*j*u)--proj(i*u,j*u,3u);
endfor;
endfor;

mark( (0,0) );

label.lft( btex $a$ etex, (-1,0));

endfig;
end