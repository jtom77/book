verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

u := 0.7cm;


def pi = 3.14159 enddef;

vardef cos( expr x ) = cosd( x*180/pi ) enddef; 
vardef sin( expr x ) = sind( x*180/pi ) enddef;

vardef f( expr x )=
0.6+sin(x)+cos(3*x)/3+cos(4*x)/5+sin(6*x)/6+sin(8*x)/8
enddef;

beginfig(1);

pair a[];

M := 100;
xmin:=0;
xmax:=6;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := (xmin+i*dx, f(xmin+i*dx ) )*u;
endfor;

% draw a0 for i=1 upto M: --a[i] endfor withpen pencircle scaled 0.6pt;

% drawarrow (0,0)--(6.5u,0);
% drawarrow (0,-u)--(0,2.5u);


s := 8u;

drawarrow (s,0)--(s+6.5u,0);
drawarrow (s,-u)--(s,2.5u);

for i=5 step 5 until M:
markempty( a[i]+(s,0) );
draw (s+xpart a[i], 0)--(s+xpart a[i],-mm);
endfor;

% label.bot( btex $X$ etex, (6.5u-2,-mm) );
% label.lft( btex $Y$ etex, (-mm,2.5u-2) );
label.bot( btex $X$ etex, (s+6.5u-2,-mm) );
label.lft( btex $Y$ etex, (s-mm,2.5u-2) );



endfig;
end