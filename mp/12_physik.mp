verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

vardef f(expr x)= x/(1+abs(x)) enddef;

u:=0.7cm;
v := 0.3*u;

beginfig(1);


path c;

pair a[];

a1 := (2u,0.5u);
a2 := (0.5u,1.5u);
a3 := (-1.8u,0.5u);
a4 := (-2.6u,-0.5u);
a5 := (0.5u,-1.5u);

path c[];
c1 := a1{dir 150}..a2{dir 90};
c2 := a2{dir -140}..a3{dir -180};
c3 := a3{dir -90}..a4{dir -160};
c4 := a4{dir 0}..a5{dir -50};
c5 := a5{dir 80}..a1{dir 30};

path d;
d := c1--c2--c3--c4--c5--cycle;

fill d withcolor 0.9 white;
draw d;


for i=-5 step 2 until 5:
drawarrow (-2.7u,0.02u*i){dir 0}..(3u-0.4u*abs(i),0.35*u*i);
endfor;




endfig;
end