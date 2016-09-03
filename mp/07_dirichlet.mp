verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs

def pi = 3.14159 enddef;

vardef cos( expr x ) = cosd( x*180/pi ) enddef; 
vardef sin( expr x ) = sind( x*180/pi ) enddef;

vardef f( expr n, x ) = (sin( (n+1/2)*x ) )/(sin (x/2)) enddef;  

picture dd; dd := dashpattern( on 6bp off 2bp on 2bp off 2bp );

u:=0.8cm;
hscale:=0.2;

beginfig(1);


path c;
path d;
path e;
pair a[];
pair b[];
pair bb[];

M := 100;
xmin := -pi;
xmax := -0.01;
dx := (xmax-xmin)/M;

for i=0 upto M:
a[i] := (xmin+i*dx, hscale*f( 3, xmin+i*dx ))*u;
b[i] := (xmin+i*dx, hscale*f( 10, xmin+i*dx ))*u;
bb[i] := (xmin+i*dx, hscale*f( 1, xmin+i*dx ))*u;
endfor;

c := a0 for i=1 upto M: --a[i] endfor --(0,7*hscale)*u;
d := b0 for i=1 upto M: --b[i] endfor --(0,21*hscale)*u;
e := bb0 for i=1 upto M: --bb[i] endfor --(0,3*hscale)*u;

draw c withpen pencircle scaled 0.6pt;
draw d withpen pencircle scaled 0.2pt;
draw e withpen pencircle scaled 0.2pt dashed evenly;

draw c xscaled -1 withpen pencircle scaled 0.6pt;
draw d xscaled -1 withpen pencircle scaled 0.2pt;
draw e xscaled -1 withpen pencircle scaled 0.2pt dashed evenly;


drawarrow (-1.1*pi*u,0)--(1.2*pi*u,0);
drawarrow (0,-u)--(0,5u);

draw (pi*u,0)--(pi*u,-mm);
draw (-pi*u,0)--(-pi*u,-mm);

label.bot( btex $-\pi$ etex, (-pi*u,-mm) );
label.bot( btex $\pi$ etex, (pi*u,-1.5mm) );

label.rt( btex $D_1$ etex, (2u+2,4u) );
label.rt( btex $D_{3}$ etex, (2u+2,3.5u) );
label.rt( btex $D_{10}$ etex, (2u+2,3u) );

draw (u,4u)--(2u,4u) withpen pencircle scaled 0.2pt dashed evenly;
draw (u,3.5u)--(2u,3.5u) withpen pencircle scaled 0.5pt;
draw (u,3u)--(2u,3u) withpen pencircle scaled 0.2pt;



endfig;
end