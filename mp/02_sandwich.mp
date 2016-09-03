verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

numeric pi;
pi := 3.1415926;
vardef exp primary x = ((mexp 256)**x) enddef;
vardef cos primary x = (cosd(x*180/pi)) enddef;
vardef sin primary x = (sind(x*180/pi)) enddef;

u := 0.18cm;

beginfig(1);

M := 20;

pair a[];
pair b[];
pair c[];

drawarrow (0,0)--(22u,0);
drawarrow (0,-8u)--(0,10u);


draw (0,6u)--(-1mm,6u);
draw (0,-6u)--(-1mm,-6u);


for i=1 upto M:
a[i] := (i, 6*sin(i)/i )*u;
b[i] := (i, 6*1/i )*u;
c[i] := (i, -6*1/i)*u;
draw b[i] withpen pencircle scaled 3 withcolor 0.6 white;
draw c[i] withpen pencircle scaled 3 withcolor 0.6 white;
draw a[i] withpen pencircle scaled 3;
%draw a[i] withpen pencircle scaled 2 withcolor white;
endfor

label.bot( btex $\mathbb{N}$ etex, (22u-1,-2) );
label.lft( btex $\mathbb{R}$ etex, (-2,10u-1) );
label.lft( btex $1$ etex, (-1mm,6u) );
label.lft( btex $-1$ etex, (-1mm,-6u) );


endfig;
end
