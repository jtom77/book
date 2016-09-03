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
vardef f( expr x ) = (x**2)*sin( 1/x ) enddef;


u:=3cm;
v := 0.3*u;

beginfig(1);

path c;

drawarrow (-2u,0)--(2u,0);
drawarrow (0,-0.1u)--(0,2u);

draw (-2u,2u)--(0,0)--(2u,2u);

picture first;
first := currentpicture;
currentpicture := nullpicture;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pair a[];

M := 100;
xmin := -pi; xmax := -0.05;
dx := (xmax-xmin)/M;

for i=0 upto M:
a[i] := (xmin+i*dx, f(xmin+i*dx))*u;
endfor;

draw a0 for i=1 upto M: --a[i] endfor;

xmin := 0.05; xmax := pi;
dx := (xmax-xmin)/M;

for i=0 upto M:
a[i] := (xmin+i*dx, f(xmin+i*dx))*u;
endfor;

draw a0 for i=1 upto M: --a[i] endfor;




drawarrow (-2u,0)--(2u,0);
drawarrow (0,-2u)--(0,2u);



draw (-2u,2u)--(0,0)--(2u,2u);



endfig;
end