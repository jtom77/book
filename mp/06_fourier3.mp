verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

def pi = 3.14159 enddef;

vardef cos( expr x ) = cosd( x*180/pi ) enddef; 
vardef sin( expr x ) = sind( x*180/pi ) enddef;

numeric y;

vardef f( expr n, x )= 
y := 0;
for i=1 upto n:
y := y+(sin(i*x))/i;
endfor;
y
enddef;



u:=0.6cm;
v := u;

beginfig(1);


path c;
path d;
path e;

pair a[];
pair b[];
pair bb[];

M := 200;
xmin := -pi;
xmax := pi;
dx := (xmax-xmin)/M;

for i=0 upto M:
a[i] := (xmin+i*dx, f(20, xmin+i*dx)  )*u;
endfor;

c := a0 for i=1 upto M: --a[i] endfor;

draw (-1.1*pi*u,0)--(1.1*pi*u,0);

draw (-pi*u,0)--(0,-0.5*pi*v) withpen pencircle scaled 0.3pt;
draw (pi*u,0)--(0,0.5*pi*v) withpen pencircle scaled 0.3pt;
draw (0,-0.5*pi*v)--(0,0.5*pi*v);

for i=-pi step pi until pi:
draw (i*u,0)--(i*u,-mm);
endfor;


label.bot( btex $-\pi$ etex, (-pi*u-1,-mm) );
label.bot( btex $\pi$ etex, (pi*u,-mm) );

picture coord;
coord := currentpicture;

draw c withpen pencircle scaled 0.3pt;





endfig;
end