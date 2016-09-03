verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
etex


input mydefs;

input mp-tool;
input mp-spec;
cmykcolors := true;

def myred := cmyk( 0.0,1.0,1.0,0.0 );

input mydefs;

pickup pencircle scaled 0.2pt;

vardef proj( expr x, y, z )=
(y-0.7*x,z-0.3*x-0.15*y) enddef;

vardef f( expr x, y )=
(y**2)+(x**2)
enddef;

vardef Re(expr x, y ) = x**2-y**2 enddef;
vardef Im(expr x, y ) = 2*x*y enddef;

u:=4mm;
v := 0.3*u;

beginfig(1);

ahlength := 2*mm;

numeric s;
s := 7;

for j=0 upto 2: 

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

c := (2.3u,0){dir 70}...(2.3u,2u)...(0,2.3u)...(-1.5u,0)
...(0,-1.7u)...(1.5u,0)...(0,1.2u)...(0,-0.5u)...cycle;

d := (2.3u,0)...(0,2.2u)...(-1.8u,0){dir -90}..(0,-0.2u){dir 0}
..(0,-1.2u){dir 180}..(-u,-1.4u)..(0,-1.6u){dir 20}..(1.5u,0)..(0,1.5u)..(0,-1.9u)..cycle;

e := (1.5u,0)..(0,1.5u)..(-1.3u,0)..(-u,-u)..(-0.6u,0)..(0,2.7u){dir 10}..
(0.6u,0){dir -90}..(0,-1.3u){dir -150}..(0,-2.5u)..cycle;

d := d shifted (s*u,0);
e := e shifted (2*s*u,0);


draw e withcolor myred;
drawarrow subpath (0,0.8) of e withcolor myred;
drawarrow subpath (0,3.8) of e withcolor myred;
drawarrow subpath (0,5.8) of e withcolor myred;
drawarrow subpath (0,8.8) of e withcolor myred;

drawarrow subpath (0,0.8) of c withcolor myred;
drawarrow subpath (0,3.8) of c withcolor myred;
drawarrow subpath (0,5.8) of c withcolor myred;
draw c withcolor myred;

draw d withcolor myred;
drawarrow subpath (0,0.8) of d withcolor myred;
drawarrow subpath (0,3.8) of d withcolor myred;
drawarrow subpath (0,7.8) of d withcolor myred;
drawarrow subpath (0,10.8) of d withcolor myred;


%draw (-3u,0)--(-3u+80mm,0) withcolor red;

%draw proj(xstop*u,ystart*u,0)--
%(proj(xstop*u,ystart*u,0) shifted (8cm,0)) 
%withcolor red withpen pencircle scaled 6pt;




endfig;
end