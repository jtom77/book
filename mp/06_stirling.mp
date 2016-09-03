verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

def pi = 3.14159 enddef;

vardef log( expr x ) = 3/x enddef;

u:=0.7cm;
v := 0.3*u;

beginfig(1);

path d;
path c;
path e;
path f;

pair a[];
M := 100;
xmin := 0.7;
xmax := 8;
dx := (xmax-xmin)/M;

for i=0 upto M:
a[i] := (xmin+i*dx, log( xmin+i*dx) )*u;
endfor;
c := a0 for i=1 upto M: --a[i] endfor;

numeric s,t,r;

for i=1 upto 6:
s := xpart( c intersectiontimes ( (i*u+0.5*u,0)--(i*u+0.5*u,10u) ) );
t := xpart( c intersectiontimes ( (i*u+u,0)--(i*u+u,10u) ) );
r := xpart( c intersectiontimes ( (i*u,0)--(i*u,10u) ) );
e := (i*u+0.5*u,log(i+1)*u)--(point s of c)--(subpath (s,t) of c)--cycle; 
f := (i*u,log(i)*u)--(i*u+0.5u,log(i)*u)--(subpath (s,r) of c)--cycle; 
fill e;
fill f;
d := (i*u-0.5*u,0)--(i*u+0.5*u,0)
--(i*u+0.5*u,u*log(i))--(i*u-0.5*u,u*log(i))--cycle;
draw d;
draw (i*u,u*log(i))--(i*u,0) dashed withdots scaled 0.5;
endfor;


draw c;

for i=1 upto 6:
if( (i<3) or (i>4) ):
draw (i*u,0)--(i*u,-mm);
fi;
mark( (i*u,u*log(i) ) );
endfor;

drawarrow (0,0)--(8u,0);


label.bot( btex $M$ etex, (u,-mm) );
label.bot( btex $M+1$ etex, (2u,-mm) );
label.bot( btex $\cdots$ etex, (3.5u,-mm) );
label.bot( btex $N-1$ etex, (5u,-mm) );
label.bot( btex $N$ etex, (6u,-mm) );




endfig;
end