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

u:=3cm;
v := 0.3*u;

beginfig(1);



drawarrow (-0.1u,0)--(1.2u,0);
drawarrow (-0.1u,0)--(-0.1u,1.2u);


path c;

c := (0,0.4u){dir -30}...(u,0.8u){dir -50};


path d,e;

d := c shifted (0,-0.11u);
e := c shifted (0,0.11u);

fill d--( point 1.0 of e )--( subpath(1,0) of e )--cycle withcolor 0.9 white;

draw c;
draw e dashed evenly;
draw d dashed evenly;

pair arrowpt[];
arrowpt1 := (point 1.0 of d) shifted (0.1u,0);
arrowpt2 := (point 1.0 of e) shifted (0.1u,0);

ahlength := 1mm;

drawarrow 0.7[arrowpt1,arrowpt2]--arrowpt2;
drawarrow 0.7[arrowpt2,arrowpt1]--arrowpt1;


pair a[];
pair t[];
numeric h[];
numeric N, dx;
N := 8;
dx := 1.0/N;

for i=0 upto N:
a[i] := (dx*u*i,0);
if( (i>0) and (i<N) ):
a[i] := a[i] shifted (uniformdeviate( 0.03 )*u, 0 );
fi;
endfor;

for i=0 upto N-1:
t[i] := (0.5*u*dx+dx*u*i,0);
t[i] := t[i] shifted (uniformdeviate( 0.03 )*u, 0 );
h[i] := ypart(  (t[i]--(t[i] shifted (0,3u))) intersectionpoint c );
endfor;

h[N] := h[N-1];

for i=0 upto N-1:
draw (xpart a[i+1],h[i])--(xpart a[i],h[i]);
endfor

for i=1 upto (N-1):
if( h[i] > h[i-1] ):
draw a[i]--(xpart a[i], h[i] ) dashed withdots scaled 0.3;
else:
draw a[i]--(xpart a[i], h[i-1] ) dashed withdots scaled 0.3;
fi;
endfor;
draw a0--(xpart a0, h0) dashed withdots scaled 0.3;
draw a[N]--(xpart a[N], h[N]) dashed withdots scaled 0.3;



label( btex $2\varepsilon$ etex, 1/2[arrowpt1,arrowpt2] );


endfig;
end