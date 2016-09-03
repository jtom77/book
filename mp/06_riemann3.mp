verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

u:=3cm;
v := 0.3*u;

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
fill (a,0)--(b,0)--(b,ypart( point min of c )-0.03u)
--(a,ypart(point min of c)-0.03u)--cycle withcolor 0.9 white; 
draw (a,0)--(b,0)--(b,ypart( point min of c )-0.03u)
--(a,ypart(point min of c)-0.03u)--cycle; 
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
fill (a,0)--(b,0)--(b,ypart( point max of c )+0.03u)
--(a,ypart(point max of c)+0.03u)--cycle withcolor white; 
draw (a,0)--(b,0)--(b,ypart( point max of c )+0.03u)
--(a,ypart(point max of c)+0.03u)--cycle; 
enddef;


beginfig(1);

c := (0,0.4u){dir -30}...(u,0.8u){dir -50};
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
withcolor 0.8 white;
draw a[i]--a[i+1]--(xpart a[i+1],h[i])--(xpart a[i],h[i])--cycle;
draw t[i]--(xpart t[i],h[i]) dashed evenly;
endfor

draw t2--(t2-(0,mm));
draw a2--(a2-(0,mm));
draw a3--(a3-(0,mm));

drawarrow (-0.1u,0)--(1.2u,0);
drawarrow (-0.1u,0)--(-0.1u,u);

%label.bot( btex $x_0$ etex, a0-(0,mm) );
%label.bot( btex $x_1$ etex, a1-(0,mm) );
label.bot( btex $x_{k-1}$ etex, a2-(5,mm) );
label.bot( btex $x_k$ etex, a3-(-5,mm) );
%label.bot( btex $x_4$ etex, a4-(0,mm) );
%label.bot( btex $x_5$ etex, a5-(0,mm) );

%label.bot( btex $\xi_0$ etex, t0-(0,mm) );
%label.bot( btex $\xi_1$ etex, t1-(0,mm) );
label.bot( btex $\xi_k$ etex, t2-(0,mm) );
%label.bot( btex $\xi_3$ etex, t3-(0,mm) );
%label.bot( btex $\xi_4$ etex, t4-(0,mm) );

findmax( xpart a0, xpart a1 );
findmax( xpart a1, xpart a2 );
findmax( xpart a2, xpart a3 );
findmax( xpart a3, xpart a4 );
findmax( xpart a4, xpart a5 );


findmin( xpart a0, xpart a1 );
findmin( xpart a1, xpart a2 );
findmin( xpart a2, xpart a3 );
findmin( xpart a3, xpart a4 );
findmin( xpart a4, xpart a5 );

draw c withpen pencircle scaled 1pt;

endfig;
end