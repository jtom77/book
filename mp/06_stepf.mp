verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

def pi = 3.14159 enddef;

vardef cos( expr x ) = cosd( x*180/pi ) enddef; 
vardef sin( expr x ) = sind( x*180/pi ) enddef;

u:=2cm;
v := 0.3*u;

vardef dot( expr A )=
draw A withpen pencircle scaled 3pt;
enddef;

vardef mark( expr A )=
draw A withpen pencircle scaled 3pt;
draw A withpen pencircle scaled 2pt withcolor white
enddef;

beginfig(1);

drawarrow (0,0)--(3u,0);
drawarrow (0,-0.6u)--(0,u);

numeric t[];
t0 := 0.2;
t1 := 0.6;
t2 := 1.3;
t3 := 2.0;
t4 := 2.7;

numeric h[];

h0 := 0.9;
h1 := 0.4;
h2 := -0.6;
h3 := 0.7;
h4 := 0.7;

for i=0 upto 3:
if( h[i] >= 0 ):
draw (t[i]*u,0)--(t[i]*u,h[i]*u) dashed withdots scaled 0.5;
draw (t[i+1]*u,0)--(t[i+1]*u,h[i]*u) dashed withdots scaled 0.5;
else: 
draw (t[i]*u,-5)--(t[i]*u,h[i]*u) dashed withdots scaled 0.5;
draw (t[i+1]*u,-5)--(t[i+1]*u,h[i]*u) dashed withdots scaled 0.5;
fi;
draw (t[i]*u,h[i]*u)--(t[i+1]*u,h[i]*u);
draw (t[i]*u,0)--(t[i]*u,-mm);
endfor;

draw (t[4]*u,0)--(t[4]*u,-mm);

dot( (t0,h0)*u );
dot( (t1,h0)*u );

mark( (t1,h1)*u );
mark( (t2,h1)*u );
dot(  (t2,0.8)*u );

mark( (t2,h2)*u );
mark( (t3,h3)*u );
dot(  (t3,0.2)*u );

dot( (t4,h4)*u );


label.bot( btex $x_0=a$ etex, (t0*u,-mm) );
label.bot( btex $x_1$ etex, (t1*u,-mm) );
label.bot( btex $x_2$ etex, (t2*u,-mm) );
label.bot( btex $x_3$ etex, (t3*u,-mm) );
label.bot( btex $x_4=b$ etex, (t4*u,-mm) );





 


endfig;
end