verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

def pi = 3.14159 enddef;
vardef sin( expr x ) = sind( 180*x/pi ) enddef;
vardef cos( expr x ) = cosd( 180*x/pi ) enddef;
vardef f( expr x, n) = sin(n*x)/sqrt(n) enddef;
vardef g( expr x, n) = sqrt(n)*cos(n*x) enddef;



u:=0.4cm;

beginfig(1);

pickup pencircle scaled 0.6pt;

drawarrow (-2*pi*u,0)--(2*pi*u,0);
drawarrow (0,-2.3*u)--(0,2.5*u);

M := 500;
xmax := -pi; xmin := pi;
dx := (xmax-xmin)/M;

pair a[][];
pair b[][];

for k=1 step 4 until 5:
for i=0 upto M:
a[k][i] := (xmin+i*dx, f(xmin+i*dx, k))*u;
endfor;
endfor

for k=1 step 4 until 5:
draw a[k][0] for i=1 upto M: --a[k][i] endfor;
endfor


endfig;
end