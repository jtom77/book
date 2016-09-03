verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex


u := 0.5cm;

beginfig(1);

pair a[];
numeric r[];
M := 40;
v := 2;

r[0] := 0;
numeric ln;
ln := 0.6931;
numeric pi;
pi := v;

i := 0;
pos := 1;
neg := 2;
forever: exitunless (i<40);
if (r[i] < pi):
r[i+1] := r[i]+1/pos;
%label.rt( decimal(1/pos), (i,r[i])*u );
pos := pos+2;
else:
r[i+1]=r[i]-1/neg;
neg := neg+2;
fi
i := i+1;
draw (0.3*i*u,r[i]*u*v) withpen pencircle scaled 4;
if (r[i]<r[i-1]):
draw (0.3*i*u,r[i]*u*v) withpen pencircle scaled 2 withcolor white;
fi
endfor

r[0] := 0;
for i=1 upto 40:
if ((-1)**(i+1)>0):
r[i] := r[i-1]+1/i;
draw (i*0.3*u, r[i]*u*v ) withpen pencircle scaled 4;
else:
r[i] := r[i-1]-1/i;
draw (i*0.3*u, r[i]*u*v ) withpen pencircle scaled 4;
draw (i*0.3*u, r[i]*u*v ) withpen pencircle scaled 2 withcolor white;
fi
endfor

draw (-mm,v*ln*u)--(13,v*ln)*u;
draw (-mm,v*pi*u)--(13,v*pi)*u;

drawarrow (0,0)--(0,5u);
drawarrow (0,0)--(13u,0);

for i=0 upto 40:
draw (i*0.3*u,0)--(i*0.3*u,-mm);
endfor;

label.lft( btex $\ln 2$ etex, (-mm,v*ln*u) );
label.lft( btex $\frac{2}{3}$ etex, (-mm,v*pi*u) );
label.lft( btex $\mathbb{R}$ etex, (0,5u) );
label.bot( btex $\mathbb{N}$ etex, (13u,0) );




endfig;
end
