verbatimtex
%&latex
\documentclass[10pt]{article}
\begin{document}
\footnotesize
etex

input mydefs

def pi = 3.14159 enddef;

vardef cos( expr x ) = cosd( x*180/pi ) enddef; 
vardef sin( expr x ) = sind( x*180/pi ) enddef;

u:=1.8cm;
v := 0.7*u;

vardef dot( expr A )=
draw A withpen pencircle scaled 3pt;
enddef;

vardef mark( expr A )=
draw A withpen pencircle scaled 3pt;
draw A withpen pencircle scaled 2pt withcolor white
enddef;

beginfig(1);

labeloffset := 1.5pt;


numeric t[];
t0 := 0.2;
t1 := 0.8;
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
fill (t[i]*u,0)--(t[i+1]*u,0)--(t[i+1]*u,h[i]*u)--(t[i]*u,h[i]*u)--cycle 
withcolor 0.9 white;
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
mark( (t3,h2)*u );
mark( (t3,h3)*u );
dot(  (t3,0.2)*u );

dot( (t4,h4)*u );


label.bot( btex $x_0=a$ etex, (t0*u+3,-mm) );
label.bot( btex $x_1$ etex, (t1*u,-mm) );
label.bot( btex $x_2$ etex, (t2*u,-mm) );
label.bot( btex $x_3$ etex, (t3*u,-mm) );
label.bot( btex $x_4=b$ etex, (t4*u,-mm) );

label( btex $c_1 \Delta x_1$ etex, 1/2[(t0*u,0),(t1*u,h0*u) ] );
label.top( btex $\mathbf{+}$ etex, 1/2[(t0*u,0),(t1*u,0) ] );
label( btex $c_2 \Delta x_2$ etex, 1/2[(t1*u,0),(t2*u,h1*u) ] );
label.top( btex $\mathbf{+}$ etex, 1/2[(t1*u,0),(t2*u,0) ] );
label( btex $c_3 \Delta x_3$ etex, 1/2[(t2*u,0),(t3*u,h2*u) ] );
label.bot( btex $\mathbf{-}$ etex, 1/2[(t2*u,0),(t3*u,0) ] );
label( btex $c_4 \Delta x_4$ etex, 1/2[(t3*u,0),(t4*u,h3*u) ] );
label.top( btex $\mathbf{+}$ etex, 1/2[(t3*u,0),(t4*u,0) ] );

drawarrow (0,0)--(3u,0);
drawarrow (0,-0.8u)--(0,1.35u);


for i=0 upto 3:
draw (-mm,h[i]*u)--(0,h[i]*u);
endfor;

label.lft( btex $c_1$ etex, (-mm,h0*u) );
label.lft( btex $c_2$ etex, (-mm,h1*u) );
label.lft( btex $c_3$ etex, (-mm,h2*u) );
label.lft( btex $c_4$ etex, (-mm,h3*u) );


draw (1.75u,0)--(1.75u,mm);
label.top( btex $\overline{x}$ etex, (1.75u,mm) );


 


endfig;
end