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

u:=0.28cm;
v := 0.3*u;

beginfig(1);

path c;
path d;
path e;

pair a[];
pair b[];
pair bb[];

M := 100;
xmin := -2*pi;
xmax := 2*pi;
dx := (xmax-xmin)/M;

for i=0 upto M:
a[i] := (xmin+i*dx, f(1, xmin+i*dx)  )*u;
b[i] := (xmin+i*dx, f(2, xmin+i*dx)  )*u;
bb[i] := (xmin+i*dx, f(3, xmin+i*dx)  )*u;
endfor;

c := a0 for i=1 upto M: ...a[i] endfor;
d := b0 for i=1 upto M: ...b[i] endfor;
e := bb0 for i=1 upto M: ...bb[i] endfor;

drawarrow (-2.1*pi*u,0)--(2.5*pi*u,0);
drawarrow (0,-1.6u)--(0,3u);

draw (-2*pi*u,0.5*pi*u)--(0,-0.5*pi*u) withpen pencircle scaled 0.6pt;
draw (2*pi*u,-0.5*pi*u)--(0,0.5*pi*u) withpen pencircle scaled 0.6pt;
draw (-2*pi*u,0.5*pi*u)--(-2*pi*u,0) dashed withdots scaled 0.3;
%draw (2*pi*u,-0.5*pi*u)--(2*pi*u,-0.25*pi*u) dashed withdots scaled 0.5;


draw (-2*pi*u,0) withpen pencircle scaled 3pt;
draw (0,0) withpen pencircle scaled 3pt;
draw (2*pi*u,0) withpen pencircle scaled 3pt;

for i=-2*pi step pi until 2*pi:
draw (i*u,0)--(i*u,-mm);
endfor;
draw (0,0.5*pi*u)--(-mm,0.5*pi*u);

mark( (-2*pi*u,0.5*pi*u) );
mark( (0,0.5*pi*u) );
mark( (2*pi*u,-0.5*pi*u) );
mark( (0,-0.5*pi*u) );


label.bot( btex $-2\pi$ etex, (-2*pi*u,-mm) );
label.bot( btex $-\pi$ etex, (-pi*u-1,-mm) );
label.bot( btex $\pi$ etex, (pi*u,-mm) );
label.bot( btex $2\pi$ etex, (2*pi*u+3,-mm) );

label.lft( btex $\frac{\pi}{2}$ etex, (-mm,0.5*pi*u) );


picture coord;
coord := currentpicture;

draw c withpen pencircle scaled 0.3pt;

label.bot( btex\normalsize $S_1 h(x)$ etex, (0,-1.6u-2mm) );

draw coord shifted (5*pi*u,0);
draw d shifted (5*pi*u,0) withpen pencircle scaled 0.3pt;

label.bot( btex\normalsize $S_2 h(x)$ etex, (0,-1.6u-2mm) 
shifted (5*pi*u,0));

draw coord shifted (10*pi*u,0);
draw e shifted (10*pi*u,0) withpen pencircle scaled 0.3pt;

label.bot( btex\normalsize $S_3 h(x)$ etex, (0,-1.6u-2mm) 
shifted (10*pi*u,0) );
%label.bot( btex\normalsize $\blacklozenge$ etex, (2.8u,-1.6u-2mm) );



endfig;
end