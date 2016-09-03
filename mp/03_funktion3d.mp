verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

def pi = 3.141 enddef;

vardef sin( expr x ) = sind( 180/pi*x ) enddef;
vardef cos( expr x ) = cosd( 180/pi*x ) enddef;


vardef p( expr x, y, z )= (y-0.7*x,z-0.7*x) enddef;

u:=0.5cm;

beginfig(1);

pair shift;
shift := (2.5u,2.5u);

pair A, B, C, D;
pair M, N, O, P;

A := (0,0);
B := (4u,0);
C := B shifted shift;
D := A shifted shift;

%draw A--B--C--D--cycle;

M := 2/3[A,B];
N := 1/2[B,C];
O := 1/2[C,D];
P := 1/2[D,A];

A := A shifted (0,u);
M := M shifted (0,0.5);
N := N shifted (0,-u);
O := O shifted (0,.5u);

path a, b, c, d;
a := A{dir -60}..M..B{dir 60};
b := B{dir 20}..N..C{ dir -10};
c := C..O..D{dir 180};
d := D{dir -80}..P..A{dir -190};

path f;

f := b--c--cycle;
fill f withcolor 0.8 white;
f := d--a--cycle;
fill f withcolor 0.8 white;

draw a;
draw b; 
draw c;
draw d;

pair s, t;
s := point 1.7 of a;
t := point 0.7 of b;
draw s--t;
s := point 0.0 of c;
t := point 1.8 of b;
draw s--t;

path arr;
arr := (3u,u)--(3u,u) shifted (-2u,-2u);
pair inter;
inter := a intersectionpoint arr;
drawarrow inter--(3u,u) shifted (-2u,-2u);
%draw (3u,u)--arr dashed evenly;

arr := (3u,u)--(3u,u) shifted (4u,0);
inter := b intersectionpoint arr;
drawarrow inter--(3u,u) shifted (4u,0);
%draw (3u,u)--arr dashed evenly;

drawarrow (3u,2u)--(3u,4u);
%draw (3u,u)--(3u,2u) dashed evenly;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%labeloffset := 1pt;
label.lft( btex $x_1$ etex, (3u,u) shifted (-2u+3,-2u+3) );
label.bot( btex $x_2$ etex, (3u,u) shifted (4u-3,0) );
label.lft( btex $x_3$ etex, (3u,4u-3) );

endfig;
end