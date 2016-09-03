verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

def pi = 3.14159 enddef;

vardef sin( expr x ) = sind( x*180/pi ) enddef;
vardef f( expr x )=sin(x)/x enddef;


u:=0.5cm;
v := u;
numeric min;
numeric max;

beginfig(1);

drawarrow (-10u,0)--(10u,0);
drawarrow (0,0)--(0,2u);
  draw (0,0)--(0,-mm);
  draw (pi*u,0)--(pi*u,-mm);
  draw (-pi*u,0)--(-pi*u,-mm);
  draw (2*pi*u,0)--(2*pi*u,-mm);
  draw (-2*pi*u,0)--(-2*pi*u,-mm);
  label.bot(btex $0$ etex, (0,-mm));
  label.bot(btex $\pi$ etex, (pi*u,-mm));
  label.bot(btex $-\pi$ etex, (-pi*u,-mm));
  label.bot(btex $2\pi$ etex, (2*pi*u,-mm));
  label.bot(btex $-2\pi$ etex, (-2*pi*u,-mm));
  
pair a[];
M := 100;

xmin := -10;
xmax := -0.01;
dx := (xmax-xmin)/M;

for i=0 upto M:
a[i] := (xmin+i*dx, f(xmin+i*dx) )*u;
endfor;

draw a0 for i=1 upto M: --a[i] endfor --(0,u) thick;
 
xmin := 0.01;
xmax := 10;
dx := (xmax-xmin)/M;

for i=0 upto M:
a[i] := (xmin+i*dx, f(xmin+i*dx) )*u;
endfor;

draw (0,u)--a0 for i=1 upto M: --a[i] endfor thick;

s := 12u;

label( btex $\frac{\sin x }{x}$ etex, (5u,u) );
label.bot(btex $x$ etex, (10u-mm,-mm));
label.lft(btex $y$ etex, (-mm,2u-mm));



endfig;
end