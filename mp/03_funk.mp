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

u:=0.7cm;

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

draw A{dir -60}..M..B{dir 60};
draw B{dir 20}..N..C{ dir -10};
draw C..O..D{dir 180};
draw A{dir 10}..P..D{dir 80};


drawarrow (3u,2u)--(3u,5u);
drawarrow (3u,2u)--(3u,2u) shifted (-2u,-2u);
drawarrow (3u,2u)--(3u,2u) shifted (3u,0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


pair shift;
shift := (-4u,0);
drawarrow (0,0) shifted shift--(3u,0) shifted shift;
drawarrow (0,0) shifted shift--(0,3u) shifted shift;



endfig;
end