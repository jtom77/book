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
v := 4;

r[0] := 0;
numeric ln;
ln := 0.6931;
numeric pi;
pi := 3.1415;

for i=1 upto M:
if ( r[i-1] < pi ):
if ((-1)**(i+1) < 0): 
r[i] := r[i-1]+1/(i+1);
label.lft( decimal(1/(i+1)), (i*0.5*u,r[i]*v*u) );
else:
r[i] := r[i-1]+1/i;
fi
else:
if ((-1)**(i+1) < 0):
r[i] := r[i-1]-1/i;
else: 
r[i] := r[i-1]-1/(i-1);
fi;
fi
endfor

for i=1 upto M:
a[i] := (0.5*i, v*r[i])*u;
endfor

for i=1 upto M:
draw a[i] withpen pencircle scaled 4;
draw a[i] withpen pencircle scaled 2 withcolor white;
endfor

draw (0,v*pi)*u--(10,v*pi)*u withpen pencircle scaled 2;

drawarrow (0,0)--(10u,0);
drawarrow (0,0)--(0,9u);

for i=1 upto M-1: 
draw (i*u,0)--(i*u,-mm);
endfor

draw (-mm,4u)--(0,4u);
draw (-mm,8u)--(0,8u);
%draw (-mm,8*ln*u)--(0,8*ln*u);

label.lft( btex $\mathbb{R}$ etex, (0,9u) );
label.bot( btex $\mathbb{N}$ etex, (10u,3u) );
label.lft( btex $1$ etex, (-mm,8u));
label.lft( btex $\lim s_n$ etex, (-mm,ln*8*u) );
label.lft( btex $\frac{1}{2}$ etex, (-mm,4u) );

endfig;
end
