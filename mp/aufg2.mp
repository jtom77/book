verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
etex

input mydefs;

pickup pencircle scaled 0.2pt;

vardef proj( expr x, y, z )=
(y-0.7*x,z-0.3*x-0.15*y) enddef;

vardef f( expr x, y )=
(y**2)+(x**2)
enddef;

vardef Re(expr x, y ) = x**2-y**2 enddef;
vardef Im(expr x, y ) = 2*x*y enddef;

u:=80.0/13*mm;
v := 0.3*u;

beginfig(1);

ahlength := 2*mm;

numeric s;
s := 7;

for j=0 upto 1: 

drawarrow (-3u+j*s*u,0)--(3u+j*s*u,0);
drawarrow (j*s*u,-3u)--(j*s*u,3u);

for i=-2 upto 2:
draw (i*u+j*s*u,0) withpen pencircle scaled 3pt;
draw (j*s*u,i*u) withpen pencircle scaled 3pt;
endfor;

endfor;

path c;
path d;
path e;

c := (2u,0){dir 50}..(2.5u,2u)..(0.3u,0.5u)..(0,2.5u){dir 180}..(-2u,0){dir 190};

d := (2.5u,0){dir 90}..(0,1.5u)..(-2.2u,0){dir -70}..(-0.5u,0)..(0.5u,0){dir -90};

d := d shifted (s*u,0);
draw c;
draw d;
draw d yscaled -1; 

path e;
e := d yscaled -1;


drawarrow subpath (0,0.6) of c;
drawarrow subpath (0,1.6) of c;
drawarrow subpath (0,2.6) of c;
drawarrow subpath (0,3.6) of c;

drawarrow subpath (4,0.6) of d;
drawarrow subpath (4,1.6) of d;
drawarrow subpath (4,2.6) of d;


drawarrow subpath (0,0.6) of e;
drawarrow subpath (0,1.6) of e;
drawarrow subpath (0,2.6) of e;



%draw (-3u,0)--(-3u+80mm,0) withcolor red;

%draw proj(xstop*u,ystart*u,0)--
%(proj(xstop*u,ystart*u,0) shifted (8cm,0)) 
%withcolor red withpen pencircle scaled 6pt;




endfig;
end