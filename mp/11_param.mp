verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex
input mydefs
u:=1.3cm;
v := 0.3*u;

beginfig(1);

pair A,B,C,D, v,w;

v := ( 1.2u,0.8u );
w := 0.95*(-2u,0.5u );

A := (0,0);
 
B := A+v;
C := B+w;
D := A+w;

pair a[];
a1 := A shifted (0,0.5u);
a2 := B shifted (0,0.5u);
a3 := C shifted (0,0.8u);
a4 := D shifted (0,0.3u);

path c[];
c1 := a1{dir 70}...a2{dir -10};
c2 := a2{dir 170}...a3{dir 180};
c3 := a3{dir -160}...a4{dir -115};
c4 := a4{dir 40}...a1{dir 0};


pair E,F;
E := 0.6[A,D];
F := 0.6[B,C];

a5 := c4 intersectionpoint ( E--E+(0,10u) );
a6 := c2 intersectionpoint ( F--F+(0,10u) );

c5 := a5{dir 80}...a6{dir -10};

draw A--a1 dashed withdots scaled 0.2;
draw B--a2 dashed withdots scaled 0.2;
draw C--a3 dashed withdots scaled 0.2;
draw D--a4 dashed withdots scaled 0.2;

draw C--( (D--C) intersectionpoint c4 ) dashed evenly scaled .7;

fill c5--F--E--cycle withcolor 0.9 white;

draw E--( (E--F) intersectionpoint c4 );
draw F--( (E--F) intersectionpoint c4 ) dashed evenly scaled .7;
draw E--a5;
draw F--a6 dashed evenly;

draw c5;
path d;
d := c1--c2--c3--c4--cycle;
draw d;


draw D--A--B;
draw B--( (B--C) intersectionpoint c1 );
draw F--( (B--C) intersectionpoint c1 ) dashed evenly scaled .7;
draw D--( (D--C) intersectionpoint c4 );

label( btex $G(y_0)$ etex 
rotated angle(F-E), 1/2[E,a6] shifted (0.1*(F-E)) );


label.rt(btex $a$ etex, A-(0,2));
label.rt(btex $b$ etex, B-(0,2) );
label.bot( btex $y_0$ etex, E-(0,1) );

pair G;
G := 1/5[D,A];

label.bot( btex $M$ etex, G-(0,1) );


pair shift;
shift := (3u,0.3u);

drawarrow (0,0) shifted shift--(3u,0) shifted shift;
drawarrow (0,0) shifted shift--(0,2u) shifted shift;

path e;
e := (0.3u,1.2u){dir 50}...(2.7u,0.6u){dir 30};
draw e shifted shift;

label.rt( btex $G(y)$ etex, (2,2u-2) shifted shift );

draw ((0.3u,0) shifted shift)--((2.7u,0) shifted shift) 
withpen pencircle scaled 1pt;

draw ((0.3u,0) shifted shift)--((0.3u,1.2u) shifted shift) 
dashed withdots scaled 0.2;
draw ((2.7u,0) shifted shift)--((2.7u,0.6u) shifted shift) 
dashed withdots scaled 0.2;

label.bot( btex $M$ etex, (1.7u,-1) shifted shift );
label.bot( btex $y$ etex, (3u-2,-2) shifted shift );

draw (1.2u,0) shifted shift--(1.2u,-mm) shifted shift;
label.bot( btex $y_0$ etex, (1.2u,-mm) shifted shift );

G := e intersectionpoint ( (1.2u,0)--(1.3u,10u) );

draw ((1.2u,0) shifted shift)--(G shifted shift) dashed evenly;

endfig;
end

