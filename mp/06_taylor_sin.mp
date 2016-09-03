verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

def pi = 3.14159 enddef;

numeric rho;
rho := 2520**(1/7);

vardef sin( expr x ) = sind( x*180/pi ) enddef;
vardef f( expr x ) = x-(x**3)/6 enddef;
vardef g( expr x ) = x-(x**3)/6+(x**5)/120 enddef;
vardef h( expr x ) = x-(x**3)/6+(x**5)/120-0.5*((x/rho)**7) enddef;


u:= 0.5cm;
v := u;
numeric min;
numeric max;

picture dd; dd := dashpattern( on 6bp off 2bp on 2bp off 2bp );

beginfig(1);

pickup pencircle scaled 0.5pt;

labeloffset := 1.5pt;


pair a[];
pair b[];
pair c[];
pair d[];

M := 100;


xmin :=-2*pi;
xmax :=2*pi;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := ( u*(xmin+i*dx), v*sin( xmin+i*dx ) );
endfor 

draw a0 for i=1 upto M: --a[i] endfor withpen pencircle scaled 0.8pt;

draw (-3u,-3u)--(3u,3u) dashed dd scaled 0.6;

xmin :=-1.5*pi;
xmax := 1.5*pi;
dx := (xmax-xmin)/M;
for i=0 upto M:
b[i] := ( u*(xmin+i*dx), v*f( xmin+i*dx ) );
endfor 

draw b0 for i=1 upto M: --b[i] endfor  dashed dd;

xmin :=-1.5*pi;
xmax := 1.5*pi;
dx := (xmax-xmin)/M;
for i=0 upto M:
c[i] := ( u*(xmin+i*dx), v*g( xmin+i*dx ) );
endfor 

draw c0 for i=1 upto M: --c[i] endfor dashed evenly;

xmin :=-1.45*pi;
xmax := 1.45*pi;
dx := (xmax-xmin)/M;
for i=0 upto M:
d[i] := ( u*(xmin+i*dx), v*h( xmin+i*dx ) );
endfor 

draw d0 for i=1 upto M: --d[i] endfor dashed evenly scaled 0.5;

clip currentpicture to ( (-2.1*pi*u,-3*v)--(2.4*pi*u,-3*v)--
(2.4*pi*u,3*v)--(-2.1*pi*u,3*v)--cycle );

drawarrow (-2.1*pi*u,0)--(2.2*pi*u,0) withpen pencircle scaled 0.3pt;
drawarrow (0,-3v)--(0,3v) withpen pencircle scaled 0.3pt;

label.lft( btex $\sin$ etex, (-1.75*pi*u,0.8*v+2) );
label.lft( btex $T_1$ etex,  (-3u,-3v) );
label.lft( btex $T_5$ etex,  (-4.2u,-3v) );
label.lft( btex  $T_3$ etex,  (-3.5u+2,3v) );
label.lft( btex $T_7$ etex,  (-4.7u+2,3v) );

mark( (0,0) );

label.bot( btex $-2\pi$ etex, (-2*pi*u,-1) );
label.top( btex $2\pi$ etex, (2*pi*u,1) );



endfig;
end