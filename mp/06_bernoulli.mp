verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;


vardef f( expr x ) = x**2-x+1/6 enddef;
vardef g( expr x ) = x**3-1.5*(x**2)+x/2 enddef;


u:=0.85cm;
v := 0.3*u;

beginfig(1);

pair a[];
pair b[];
path c,d;
s := 5u;

M := 50;
xmin := 0;
xmax := 1;
dx := (xmax-xmin)/M;

for i=0 upto M:
a[i] := (xmin+i*dx, f(xmin+i*dx) )*u;
b[i] := (xmin+i*dx, g(xmin+i*dx) )*u;
endfor;

c := a0 for i=1 upto M: --a[i] endfor;
d := b0 for i=1 upto M: --b[i] endfor;

drawarrow (-2u-s,0)--(2.3u-s,0);
drawarrow (-2u,0)--(2.3u,0);
drawarrow (-2u+s,0)--(2.3u+s,0);
drawarrow (-s,0)--(-s,1.4u);
drawarrow (0,0)--(0,1.4u);
drawarrow (s,0)--(s,1.4u);

draw (-s,u)--(-s+mm,u);
draw (0,u)--(mm,u);
draw (s,u)--(s+mm,u);


for i=-2 upto 2:
draw (i*u,0)--(i*u,-mm);
draw (i*u-s,0)--(i*u-s,-mm);
draw (i*u+s,0)--(i*u+s,-mm);
endfor;

for i=-2 upto 1:
draw (i*u-s,-0.5u)--(i*u+u-s,0.5u);
endfor;

for i=-2 upto 1:
draw c shifted (i*u,0);
draw d shifted (i*u+s,0);
endfor;


for i=0 upto 1:
label.bot( btex $-2$ etex, (-2u,-mm) shifted (i*s,0) );
label.bot( btex $-1$ etex, (-u,-mm) shifted (i*s,0) );
label.bot( btex $0$ etex, (0,-mm) shifted (i*s,0) );
label.bot( btex $1$ etex, (u,-mm) shifted (i*s,0) );
label.bot( btex $2$ etex, (2u,-mm) shifted (i*s,0) );
endfor;

label.bot( btex $-2$ etex, (-s-2u-2mm,-mm) );
label.bot( btex $-1$ etex, (-s-u-2mm,-mm) );
label.bot( btex $0$ etex, (-s,-mm) );
label.bot( btex $1$ etex, (-s+u,-mm) );
label.bot( btex $2$ etex, (2u-s,-mm) );

label.rt( btex $1$ etex, (-s+mm,u) );
label.rt( btex $1$ etex, (mm,u) );
label.rt( btex $1$ etex, (s+mm,u) );

label.lft( btex $\overline{B}_1(x)$ etex, (-s-mm,1.3u) );
label.lft( btex $\overline{B}_2(x)$ etex, (-mm,1.3u) );
label.lft( btex $\overline{B}_3(x)$ etex, (s-mm,1.3u) );


endfig;
end