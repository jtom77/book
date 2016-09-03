verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
etex

input mydefs;

numeric pi;
pi := 3.14159;

vardef proj( expr x, y, z )= (y-0.5*x,z-0.5*x) enddef;

u:=0.4cm;
v := 0.15*u;

beginfig(1);

pickup pencircle scaled 0.2pt;

pair A, B, C, D, AA, BB, CC, DD;

A := proj(0,0,0);
B := proj(6u,6u,0);
C := proj(0,18u,0);
D := proj(-8u,4u,0);
AA := proj(4u,u,20u);
BB := proj(7u,4u,20u);
CC := proj(4u,10u,20u);
DD := proj(0,3u,20u);


drawarrow A--proj(10u,0,0);
drawarrow A--proj(0,23u,0);
drawarrow A--proj(0,0,25u);


draw A--B--C--D--cycle;
draw AA--BB--CC--DD--cycle;
draw A--AA;
draw B--BB;
draw C--CC;
draw D--DD;







endfig;
end