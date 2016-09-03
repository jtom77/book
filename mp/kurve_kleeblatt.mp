verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

def pi = 3.14159 enddef;

vardef cos( expr x ) = cosd( x*180/pi ) enddef; 
vardef sin( expr x ) = sind( x*180/pi ) enddef;

vardef f( expr t )=
(sin(t)*sin(2*t), cos(t)*sin(2*t))
enddef;

u:=5cm;
v := 0.3*u;
numeric min;
numeric max;

beginfig(1);

M := 25;
min := 0;
max := 2*pi;
dx := 100/(2*pi);

pair a[];

for i=0 upto M:
a[i] := (i*dx, u*sin(2*i*dx));
endfor;

draw a0 for i=1 upto M: --a[i] endfor;



endfig;
end