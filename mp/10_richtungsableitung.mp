verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

vardef proj( expr x, y, z )=( 0.8y-0.6*x, z-0.4*x-0.2*y ) enddef;


u:=0.6cm;
v := 0.3*u;

beginfig(1);


pickup pencircle scaled 0.3pt;

drawarrow (0,0)--proj(5u,0,0);
drawarrow (0,0)--proj(0,5u,0);
drawarrow (0,0)--proj(0,0,4u);

pair a[];
path c[];

a1 := proj(4u,0,2u);
a2 := proj(4u,4u,u);
a3 := proj(0,4u,0.5u);
a4 := proj(0,0,3u);

pickup pencircle scaled 0.6pt;
draw a1--proj(4u,0,0) dashed withdots scaled 0.5;
draw a2--proj(4u,4u,0) dashed withdots scaled 0.5;
draw a3--proj(0,4u,0) dashed withdots scaled 0.5;
draw a4--proj(0,0,0) dashed withdots scaled 0.5;


pickup pencircle scaled 0.3pt;

draw proj(4u,0,0)--proj(4u,4u,0)--proj(0,4u,0) dashed withdots scaled 0.5pt;



c2 := a2{dir 30}...a3{dir 10};
c3 := a3{dir 110}...a4{dir -180};
c4 := a4{dir -150}...a1{dir -170};
c1 := a1{dir -30}...a2{dir -60};

path d;

d := c1--c2--c3--c4--cycle;

fill d withcolor 0.9 white;
draw d;




draw (0,0)--( ( (0,0)--proj(5u,0,0) ) intersectionpoint c1 ) 
dashed evenly scaled 0.5;
draw (0,0)--( ( (0,0)--proj(0,5u,0) ) intersectionpoint c2 ) 
dashed evenly scaled 0.5;
draw (0,0)--a4 dashed evenly scaled 0.5;

pair b[];
draw proj( 4u,2u,0 )--proj( 0,2u,0 ) dashed withdots scaled 0.5;
draw proj( 2u,4u,0 )--proj( 2u,0,0 ) dashed withdots scaled 0.5;  

b1 := (proj(4u,2u,0)--proj(4u,2u,10u)) intersectionpoint c1;
b2 := (proj(2u,4u,0)--proj(2u,4u,10u)) intersectionpoint c2;
b3 := (proj(0,2u,0)--proj(0,2u,10u)) intersectionpoint c3;
b4 := (proj(2u,0,0)--proj(2u,0,10u)) intersectionpoint c4;
b5 := proj(2u,2u,3u);

draw proj(4u,2u,0)--b1 dashed withdots scaled 0.5;
draw proj(2u,4u,0)--b2 dashed withdots scaled 0.5;
draw proj(0,2u,0)--b3 dashed withdots scaled 0.5;
draw proj(2u,0,0)--b4 dashed withdots scaled 0.5;
draw proj(2u,2u,0)--b5 dashed withdots scaled 0.5;

c5 := b1{dir 10}..b5..b3;
c6 := b2{dir 120}..b5..b4;

draw c5 withpen pencircle scaled 0.6pt;
draw c6 withpen pencircle scaled 0.6pt;

mark( b5 );
 
labeloffset := 1.5pt;

label.top( btex $f_{[1]}$ etex, point 1.4 of c5 shifted (-1,0.5) );
label.rt( btex  $f_{[2]}$ etex, point 0.3 of c6 );

label.bot( btex $x_1$ etex, proj(5u,0,0) shifted (1,0) );
label.bot( btex $x_2$ etex, proj(0,5u,0) shifted (-1,-0.5) );
label.lft( btex $x_3$ etex, proj(0,0,4u) shifted (0,-1) );
label.rt( btex $a$ etex, b5 shifted (1,1) );






endfig;
end