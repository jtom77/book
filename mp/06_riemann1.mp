verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex


u:=3cm;
v := 0.1*u;

def pi = 3.14159 enddef;

numeric min;

path c;
numeric min;
numeric max;

vardef findmin( expr a, b ) = 
save r,s; 
r := xpart( c intersectiontimes ( (a,0)--(a,5u) ) );
s := xpart( c intersectiontimes ( (b,0)--(b,5u) ) );
min := r;
forever: exitunless( r<s );
r := r+0.01;
if( ypart( point r of c ) < ypart( point min of c ) ):
min := r;
fi;
endfor;
fill (a,0)--(b,0)--(b,ypart( point min of c ))--(a,ypart(point min of c))
--cycle withcolor 0.7 white; 
draw (a,0)--(b,0)--(b,ypart( point min of c ))--(a,ypart(point min of c))
--cycle; 
enddef;

vardef findmax( expr a, b ) = 
save r,s; 
r := xpart( c intersectiontimes ( (a,0)--(a,5u) ) );
s := xpart( c intersectiontimes ( (b,0)--(b,5u) ) );
max := r;
forever: exitunless( r<s );
r := r+0.01;
if( ypart( point r of c ) > ypart( point max of c ) ):
max := r;
fi;
endfor;
fill (a,0)--(b,0)--(b,ypart( point max of c ))--(a,ypart(point max of c))
--cycle withcolor 0.9 white; 
draw (a,0)--(b,0)--(b,ypart( point max of c ))--(a,ypart(point max of c))
--cycle; 
enddef;


beginfig(1);

labeloffset := 1.5pt;

c := (0,0.1u){dir -30}...(0.4u,0.3u){dir -50}...(u,0.5u){dir 50};
draw c;

pair a[];
pair t[];
numeric h[];

for i=0 upto 5:
a[i] := (0.2*u*i,0);
if( (i>0) and (i<5) ):
a[i] := a[i] shifted (uniformdeviate( 0.05 )*u, 0 );
fi;
endfor;

for i=0 upto 4:
t[i] := (0.1*u+0.2*u*i,0);
t[i] := t[i] shifted (uniformdeviate( 0.05 )*u, 0 );
h[i] := ypart(  (t[i]--(t[i] shifted (0,3u))) intersectionpoint c );
draw t[i]--(xpart t[i], h[i] ) withcolor red;
endfor;

for i=0 upto 4:
fill a[i]--a[i+1]--(xpart a[i+1],h[i])--(xpart a[i],h[i])--cycle 
withcolor 0.9 white;
draw a[i]--a[i+1]--(xpart a[i+1],h[i])--(xpart a[i],h[i])--cycle;
draw t[i]--(xpart t[i],h[i]) dashed evenly;
endfor

drawarrow (-0.1u,0)--(1.2u,0);
drawarrow (-0.1u,0)--(-0.1u,0.5u);



findmax( xpart a0, xpart a1 );
findmax( xpart a1, xpart a2 );
pair H, G;
H := point max of c;
findmax( xpart a2, xpart a3 );
findmax( xpart a3, xpart a4 );
findmax( xpart a4, xpart a5 );

findmin( xpart a0, xpart a1 );
findmin( xpart a1, xpart a2 );
findmin( xpart a2, xpart a3 );
G := point min of c;
findmin( xpart a3, xpart a4 );
findmin( xpart a4, xpart a5 );

draw c;

draw H--(xpart H,0) dashed withdots scaled 0.5;
draw H withpen pencircle scaled 3pt;
draw H withpen pencircle scaled 2pt withcolor white;
draw (xpart H,0)--(xpart H, -mm );
label.bot( btex $\overline{\xi}_{k-1}$ etex, (xpart H,-mm) );

draw G--(xpart G,0) dashed withdots scaled 0.5;
draw G withpen pencircle scaled 3pt;
draw G withpen pencircle scaled 2pt withcolor white;
draw (xpart G,0)--(xpart G, -mm );
label.bot( btex $\underline{\xi}_{k}$ etex, (xpart G,-mm) );


endfig;
end