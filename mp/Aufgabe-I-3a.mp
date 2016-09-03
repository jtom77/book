verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
etex

input mydefs;

numeric pi;
pi := 3.14159;


vardef exp( expr x ) = ((mexp 256)**x) enddef;
vardef f( expr x ) = 20*x*exp(-0.5*x) enddef;


u:=0.7cm;
v := 0.7*u;

beginfig(1);

pair a[];
pair b[];

pickup pencircle scaled 0.2pt;



numeric M;
M := 100;
dx := 12/M;

for i=0 upto M:
a[i] := ( u*i*dx, v*f(i*dx) );
endfor;


drawarrow (0,0)--(13u,0);
drawarrow (0,0)--(0,17v);

for i=1 upto 12:
draw (i*u,0.5*mm)--(i*u,-0.5*mm);
endfor;

for i=2 step 2 until 12:
draw (i*u,mm)--(i*u,-mm);
endfor;

for i=5 step 5 until 15:
draw (-mm,i*v)--(mm,i*v);
endfor;

for i=1 step 1 until 15:
draw (-0.5*mm,i*v)--(0.5*mm,i*v);
endfor;


draw a0 for i=1 upto M: --a[i] endfor;



label.bot( btex $2$ etex, (2*u,-mm) );
label.bot( btex $4$ etex, (4*u,-mm) );
label.bot( btex $6$ etex, (6*u,-mm) );
label.bot( btex $8$ etex, (8*u,-mm) );
label.bot( btex $10$ etex, (10*u,-mm) );
label.bot( btex $12$ etex, (12*u,-mm) );
label.bot( btex $x$ etex, (13*u,-mm) );

label.lft( btex $5$ etex, (-mm,5*v) );
label.lft( btex $10$ etex, (-mm,10*v) );
label.lft( btex $15$ etex, (-mm,15*v) );
label.lft( btex $f(t)$ etex, (-mm,17*v) );





endfig;
end