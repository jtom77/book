verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex


u := 0.3cm;
v := 12;

beginfig(1);

pair a[];
numeric r[];

r[0] := 0;
numeric ln;
ln := 0.6931;

for i=1 upto 10:
r[i] := r[i-1]+(-1)**(i+1)*1/i;
endfor


for i=1 upto 10:
a[i] := (i, v*r[i])*u;
endfor

for i=1 step 2 until 8:
fill (0,ypart a[i])--(10.5u, ypart a[i])
--(10.5u, ypart a[i+1])--(0,ypart a[i+1])--cycle withcolor 
(0.95-0.03*i,0.95-0.03*i,0.95-0.03*i);
endfor

for i=1 upto 10:
draw (0,ypart a[i])--(10.5u, ypart a[i]);
draw a[i] withpen pencircle scaled 4;
draw a[i] withpen pencircle scaled 2 withcolor white;
endfor

draw (0,v*ln)*u--(10.5,v*ln)*u withpen pencircle scaled 2 withcolor white;
draw (0,v*ln)*u--(10.5,v*ln)*u withpen pencircle scaled 2;

drawarrow (0,0.5*v*u-u)--(11u,0.5*v*u-u);
drawarrow (0,0.5*v*u-u)--(0,v*u+2u);

for i=1 upto 10: 
draw (i*u,0.5*v*u-u)--(i*u,0.5*v*u-u-mm);
endfor

draw (-mm,v*u)--(0,v*u);
draw (-mm,0.5*v*u)--(0,0.5*v*u);
draw (-mm,v*ln*u)--(0,v*ln*u);

label.lft( btex $\mathbb{R}$ etex, (0,v*u+2u) );
label.bot( btex $\mathbb{N}$ etex, (11u,0.5*v*u-u) );
label.lft( btex $s_1$ etex, (-mm,v*u));
label.lft( btex $\lim s_n$ etex, (-mm,ln*v*u) );
label.lft( btex $s_2$ etex, (-mm,0.5*v*u) );


endfig;
end
