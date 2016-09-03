verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

def pi = 3.14159 enddef;
B2 := 1.0/12.0;
B4 := -1.0/(30*12);

vardef cos( expr x ) = cosd( x*180/pi ) enddef; 
vardef sin( expr x ) = sind( x*180/pi ) enddef;
vardef log( expr x ) = mlog(x)/256 enddef;
vardef exp( expr x ) = mexp(256)**x enddef;

K := 0.5*log( 2*pi );

vardef gamma( expr x ) = exp( (x+0.5)*log(x)-x+K+B2/x ) enddef;
vardef lgamma( expr x ) = gamma(x+1)/(x+1) enddef;
vardef rgamma( expr x ) = pi*x/( sin(pi*x)*gamma(-x) ) enddef;


u:=0.5cm;
v := 0.3*u;
numeric min;
numeric max;


beginfig(1);

labeloffset := 1.5pt;

pair a[];
pair b[];
path d;

numeric g;

M := 100;
xmin := 1;
xmax := 2.9;
dx := (xmax-xmin)/M;
for i=0 upto M:
g := gamma( xmin+i*dx );
a[i] := (xmin+i*dx+1, g )*u;
b[i] := (xmin+i*dx+1, 1/g )*u;
endfor;

draw a0 for i=1 upto M: --a[i] endfor;

M := 100;
xmin := -0.8;
xmax := 1;
dx := (xmax-xmin)/M;
for i=0 upto M:
g := lgamma( xmin+i*dx );
a[i] := (xmin+i*dx+1, g )*u;
b[i] := (xmin+i*dx+1, 1/g )*u;
endfor;

draw a0 for i=1 upto M: --a[i] endfor;


xmin := -1.8;
xmax := -1.15;
dx := (xmax-xmin)/M;
for i=0 upto M:
g := rgamma( xmin+i*dx );
a[i] := (xmin+i*dx+1, g )*u;
b[i] := (xmin+i*dx+1, 1/g )*u;
endfor;

draw a0 for i=1 upto M: --a[i] endfor;


xmin := -2.9;
xmax := -2.15;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := (xmin+i*dx+1, rgamma( xmin+i*dx ) )*u;
endfor;

draw a0 for i=1 upto M: --a[i] endfor;


xmin := -3.98;
xmax := -3.05;
dx := (xmax-xmin)/M;
for i=0 upto M:
g := rgamma( xmin+i*dx );
a[i] := (xmin+i*dx+1, g )*u;
b[i] := (xmin+i*dx+1, 1/g )*u;
endfor;

draw a0 for i=1 upto M: --a[i] endfor;

xmin := -4.995;
xmax := -4.03;
dx := (xmax-xmin)/M;
for i=0 upto M:
g := rgamma( xmin+i*dx );
a[i] := (xmin+i*dx+1, g )*u;
b[i] := (xmin+i*dx+1, 1/g )*u;
endfor;

draw a0 for i=1 upto M: --a[i] endfor;



for i=-4 upto -1:
draw (i*u,5u)--(i*u,-mm) dashed withdots scaled 0.5;
draw (i*u,-10)--(i*u,-5u) dashed withdots scaled 0.5;
endfor;

for i=-4 upto 4:
draw (i*u,0)--(i*u,-mm);
endfor;

draw (-mm,u)--(0,u);

clip currentpicture to ( (-4.2u,-5u)--(5u,-5u)--(5u,5u)--(-4.2u,5u)--cycle );

drawarrow (-4.2u,0)--(5u,0);
drawarrow (0,-5u)--(0,5u);

label.bot( btex $-4$ etex, (-4u,-mm) );
label.bot( btex $-3$ etex, (-3u,-mm) );
label.bot( btex $-2$ etex, (-2u,-mm) );
label.bot( btex $-1$ etex, (-1u,-mm) );
label.bot( btex $4$ etex, (4u,-mm) );
label.bot( btex $3$ etex, (3u,-mm) );
label.bot( btex $2$ etex, (2u,-mm) );
label.bot( btex $1$ etex, (1u,-mm) );
label.lft( btex $1$ etex, (-mm,u) );

label.rt( btex $\Gamma$ etex, (4u,5u-3) );

endfig;
end