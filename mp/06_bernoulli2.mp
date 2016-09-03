verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex
input mydefs;

vardef f( expr x ) = x**5-(5/2)*(x**4)+(5/3)*(x**3)-(1/6)*(x) enddef;
vardef g( expr x ) = x**3-1.5*(x**2)+x/2 enddef;

u:=1.2cm;
v := 0.3*u;

beginfig(1);

fill (0,-0.6u)--(u,-0.6u)--(u,0.8u)--(0,0.8u)--cycle withcolor 0.9 white;

draw (0,-0.6u)--(0,-0.3u) withpen pencircle scaled 0.2pt;
draw (u,-0.6u)--(u,-0.3u) withpen pencircle scaled 0.2pt;
draw (0,-0.1u)--(0,0.8u) withpen pencircle scaled 0.2pt;
draw (u,-0.1u)--(u,0.8u) withpen pencircle scaled 0.2pt;

pair a[];
pair b[];
path c,d;
s := 5u;

M := 50;
xmin := 0;
xmax := 1;
dx := (xmax-xmin)/M;

for i=0 upto M:
a[i] := (xmin+i*dx, 10*f(xmin+i*dx) )*u;
b[i] := (xmin+i*dx, 10*g(xmin+i*dx) )*u;
endfor;

c := a0 for i=1 upto M: --a[i] endfor;
d := b0 for i=1 upto M: --b[i] endfor;

drawarrow (-u,0)--(2.3u,0);

for i=-1 upto 1:
draw c shifted (i*u,0) dashed evenly scaled 0.5;
draw d shifted (i*u,0);
endfor;

for i=-1 upto 2:
draw (i*u,0)--(i*u,-mm);
endfor;

for i=0 upto 0:
label.bot( btex $0$ etex, (0,-1.7mm) shifted (0.5,0) );
label.bot( btex $1$ etex, (u,-1.7mm) shifted (0.5,0) );
endfor;

mark( (0.5u,0) );

label.top( btex $\overline{B}_5$ etex, (1.75u,0.2u+1) );
label.top( btex $\overline{B}_3$ etex, (1.25u,0.5u-1) );

label.bot( btex $\frac{1}{2}$ etex, (0.5u,-mm) );

label.bot( btex zehnfach \"uberh\"oht etex, (0.5u,-0.8u) );

endfig;
end

