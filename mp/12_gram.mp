verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex
input mydefs;

def pi = 3.14159 enddef;

vardef cos( expr x ) = cosd( x*180/pi ) enddef;
 
vardef sin( expr x ) = sind( x*180/pi ) enddef;

vardef f( expr a )= a+(18+(0.5+xpart a)*sin(0.5*ypart a), 
	      cos(0.5*xpart a)+ypart a ) enddef;

u:=0.5cm;
v := 0.3*u;

beginfig(1);

pair a[][];

M := 5;
dx := 5.0/M;

fill (3u,u)--(4u,u)--(4u,2u)--(3u,2u)--cycle withcolor 0.8 white;

for i=0 upto M:
draw (dx*i,0)*u--(dx*i,M*dx)*u;
draw (0,dx*i)*u--(M*dx,dx*i)*u;
endfor;

for i=0 upto M:
for j=0 upto M:
a[i][j] := f( (dx*i,dx*j) )*0.5*u;
endfor;
endfor;

path c[];
path d[];

for i=0 upto M:
c[i] := a[i][0] for j=0 upto M: ..a[i][j] endfor;
d[i] := a[0][i] for j=0 upto M: ..a[j][i] endfor;
endfor;

path e;
e := (subpath (M-1,M) of d1)--(subpath (1,2) of c[M-1])
--(subpath (M,M-1) of d2)--(subpath (2,1) of c[M-2])--cycle;

fill e withcolor 0.8 white;

for i=0 upto M:
draw c[i];
draw d[i];
endfor;

drawarrow (subpath (0,3) of c[M-2]) withpen pencircle scaled 0.6pt;
drawarrow (subpath (M-1,M) of d1) withpen pencircle scaled 0.6pt;
drawarrow (3u,u)--(4u,u) withpen pencircle scaled 0.6pt;
drawarrow (3u,u)--(3u,2u) withpen pencircle scaled 0.6pt;

drawarrow (6u,4u)--(8u,4u);
label.top( btex $\alpha$ etex, (7u,4u+2) );
draw (3.9u,1.7u)--(5.4u,1.2u);
label.rt( btex $1\,\mathrm{d}v$ etex, (5.4u+2,1.2u) );

pair lab[];
lab1 := point 2.3 of c[M-1];
lab1 := lab1-(0.2u,0);
lab2 := lab1 shifted (1.5u,-0.4u);
draw lab1--lab2;

label.rt( btex $\sqrt{g^\alpha}\,\mathrm{d}v$ etex, lab2+(2,0) );

endfig;
end

