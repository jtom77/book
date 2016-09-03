verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex


u := 0.4cm;

beginfig(1);

pair a[];
numeric r[];
M := 40;
v := 2.5;

r[0] := 0;
numeric ln;
ln := 0.6931;
numeric pi;
pi := 2;

i := 0;
pos := 1;
neg := 2;
forever: exitunless (i<40);
if (r[i] < pi):
r[i+1] := r[i]+1/(pos**(6/5));
%label.rt( decimal(1/pos), (i,r[i])*u );
pos := pos+2;
else:
r[i+1]=r[i]-1/(neg**(6/5));
neg := neg+2;
fi
i := i+1;
draw (0.3*i*u,r[i]*u*v) withpen pencircle scaled 3;
if (r[i]<r[i-1]):
draw (0.3*i*u,r[i]*u*v) withpen pencircle scaled 1.5pt withcolor white;
fi
endfor

r[0] := 0;
for i=1 upto 40:
if ((-1)**(i+1)>0):
r[i] := r[i-1]+1/(i**(6/5));
draw (i*0.3*u, r[i]*u*v ) withpen pencircle scaled 3;
else:
r[i] := r[i-1]-1/(i**(6/5));
draw (i*0.3*u, r[i]*u*v ) withpen pencircle scaled 3;
draw (i*0.3*u, r[i]*u*v ) withpen pencircle scaled 1.5pt withcolor white;
fi
endfor

draw (-mm, r[39]*v*u)--(13,v*r[39])*u;
draw (-mm,v*pi*u)--(13,v*pi)*u;

drawarrow (0,0)--(0,1.2*u*v*pi);
drawarrow (0,0)--(13u,0);

for i=0 upto 40:
draw (i*0.3*u,0)--(i*0.3*u,-0.5*mm);
endfor;

for i=0 step 5 until 40:
draw (i*0.3*u,0)--(i*0.3*u,-mm);
endfor;


label( btex $\sum\limits_{n=1}^\infty\frac{(-1)^{n-1}}{n^{6/5}}$ etex, 
(5.2u,1.3*v*u) );
label.lft( btex $2$ etex, (-mm,v*pi*u) );
label.lft( btex $\mathbb{R}$ etex, (0,1.2*u*v*pi) );
label.bot( btex $\mathbb{N}$ etex, (13u,0) );


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pair shift;
shift := (-17u,0);


i := 0;
pos := 1;
neg := 2;
forever: exitunless (i<40);
if (r[i] < pi):
r[i+1] := r[i]+1/pos;
%label.rt( decimal(1/pos), (i,r[i])*u );
pos := pos+2;
else:
r[i+1] :=r[i]-1/neg;
neg := neg+2;
fi
i := i+1;
draw (0.3*i*u,r[i]*u*v) shifted shift withpen pencircle scaled 3;
if (r[i]<r[i-1]):
draw (0.3*i*u,r[i]*u*v) shifted shift withpen pencircle scaled 1.5pt withcolor white;
fi
endfor

r[0] := 0;
for i=1 upto 40:
if ((-1)**(i+1)>0):
r[i] := r[i-1]+1/i;
draw (i*0.3*u, r[i]*u*v ) shifted shift withpen pencircle scaled 3;
else:
r[i] := r[i-1]-1/i;
draw (i*0.3*u, r[i]*u*v ) shifted shift withpen pencircle scaled 3;
draw (i*0.3*u, r[i]*u*v ) shifted shift withpen pencircle scaled 1.5pt withcolor white;
fi
endfor

draw (-mm,v*ln*u) shifted shift--(13,v*ln)*u shifted shift;
draw (-mm,v*pi*u) shifted shift--(13,v*pi)*u shifted shift;

drawarrow (0,0) shifted shift--(0,1.2*pi*v*u) shifted shift;
drawarrow (0,0) shifted shift--(13u,0) shifted shift;

for i=0 upto 40:
draw (i*0.3*u,0) shifted shift--(i*0.3*u,-0.5*mm) shifted shift;
endfor;

for i=0 step 5 until 40:
draw (i*0.3*u,0) shifted shift--(i*0.3*u,-mm) shifted shift;
endfor;


label( btex $\sum\limits_{n=1}^\infty \frac{(-1)^{n-1}}{n}$ etex, 
(6u,1.2*v*u) shifted shift);
label.lft( btex $2$ etex, (-mm,v*pi*u) shifted shift);
label.lft( btex $\mathbb{R}$ etex, (0,1.2*u*pi*v) shifted shift);
label.bot( btex $\mathbb{N}$ etex, (13u,0) shifted shift);






endfig;
end
