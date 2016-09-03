verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex
def pi = 3.14159 enddef;

vardef cos( expr x ) = cosd( x*180/pi ) enddef;
 
vardef sin( expr x ) = sind( x*180/pi ) enddef;

u:=4cm;
v := 0.3*u;

beginfig(1);

path c;

c := (0,0.2u){dir -30}...(u,0.6u){dir -50};

numeric Int;
Int := 0;
numeric ink;
ink := 0;

forever: exitunless (ink<1);
Int := Int+ypart( point ink of c )*
( xpart( point (ink+0.05) of c ) - xpart( point ink of c ) )/(u*u);
ink := ink+0.05;
endfor;

fill (0,0)--(0,Int*u)--(u,Int*u)--(u,0)--cycle withcolor 0.9 white;
draw (0,-mm)--(0,Int*u)--(u,Int*u)--(u,-mm);

pair xi;
xi := c intersectionpoint ( (0,Int*u)--(5u,Int*u) );

draw c;

drawarrow (-0.1u,0)--(1.2u,0);
drawarrow (-0.1u,0)--(-0.1u,0.7u);

label.bot( btex $a$ etex, (0,-mm) );
label.bot( btex $b$ etex, (u,-mm) );
label.bot( btex $\xi$ etex, (xpart xi,-mm) );
label.lft( btex $f(\xi)$ etex, (-0.1u-mm,ypart xi) );

draw xi--(-0.1u,ypart xi) dashed withdots scaled 0.5;
draw (-0.1u-mm,ypart xi)--(-0.1u,ypart xi);

draw (point 1 of c)--(u,0) dashed withdots scaled 0.5;

draw xi--(xpart xi,0.8*Int*u) dashed withdots scaled 0.5;
draw (xpart xi,0)--(xpart xi,0.2*Int*u) dashed withdots scaled 0.5;
draw (xpart xi,0)--(xpart xi,-mm);
draw xi withpen pencircle scaled 3pt;
draw xi withpen pencircle scaled 2pt withcolor white;

label(btex $\int_a^b f \mathrm{d}x$ etex, (0.5u+4,0.5*Int*u) );

endfig;
end

