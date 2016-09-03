verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

pickup pencircle scaled 0.2pt;

vardef proj( expr x, y, z )=
(0.9*x+0.7*y,z-0.2*x+0.4*y) enddef;

u:=cm;

beginfig(1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pair v[];

pair A,B,C,D,E,F,G,H;

A := (0,0);
B := proj( 1.1u,0,-0.3u );
C := proj( u,1.2u,0);
D := proj( 0,u,0);

E := proj(0,0,u);
F := proj( u,0,u );
G := proj( u,u,u);
H := proj( 0,u,1.1u);

path t[]; 
path s[]; 
path q[];
t1 := A{dir 0}..B;
t2 := B{dir 110}..F;
t3 := F{dir 190}..E;
t4 := E{dir -80}..A;

s1 := B{dir 55}..C;
s2 := C..G{dir 90};
s3 := G..F{dir -170};
s4 := subpath (1,0) of t2;

q1 := subpath (1,0) of t3;
q2 := subpath (1,0) of s3;
q3 := G{dir -160}..H;
q4 := H{dir -110}..E;

fill t1--t2--t3--t4--cycle withcolor 0.95 white;
fill s1--s2--s3--s4--cycle withcolor 0.8 white;
fill q1--q2--q3--q4--cycle withcolor 0.9 white;
draw q1--q2--q3--q4--cycle;
draw s1--s2--s3--s4--cycle;
draw t1--t2--t3--t4--cycle;


pair a[];
pair b[];
pair c[];
M := 100;
dx := 300/M;

for i=0 upto M:
a[i] := proj( 0.5u+0.2*u*cosd(i*dx), 0, 0.5u+0.2*u*sind(i*dx) );
b[i] := proj( u, 0.5u+0.2*u*cosd(i*dx), 0.5u+0.2*u*sind(i*dx) );
c[i] := proj( 0.5u+0.2*u*cosd(i*dx), 0.5u+0.2*u*sind(i*dx), u );
endfor;

ahlength := mm;
drawarrow a0 for i=1 upto M: --a[i] endfor;
drawarrow b0 for i=1 upto M: --b[i] endfor;
drawarrow c0 for i=1 upto M: --c[i] endfor;

ahlength := 2mm;

path g[];
pair start[];
pair stop[];
pair d[];

for i=0 upto 10:
start[i] := proj( -2u, 0.5u+0.03*u*cosd( i*36 ), 0.5u+0.03*u*sind( i*36 ) );
stop[i] := proj( 2u, 0.5u+u*cosd( i*36 ), 0.5u+u*sind( i*36 ) );
d[i] :=  proj( 2u, 0.5u+u*cosd( i*36 ), 0.5u+u*sind( i*36 ) );
draw start[i]{proj(u,0,0)}..stop[i]{d[i]} cutafter t4;
endfor;


for i=0 upto 10:
start[i] := proj( u, 0.5u+0.4*u*cosd( i*36 ), 0.4u+0.4*u*sind( i*36 ) );
stop[i] := proj( 3u, 0.5u+0.8*u*cosd( i*36 ), 0.5u+0.8*u*sind( i*36 ) );
d[i] :=  proj( 4u, 0.5u+u*cosd( i*36 ), 0.5u+u*sind( i*36 ) );
mark( start[i] );
drawarrow start[i]{proj(u,0,0)}..stop[i]{d[i]};
endfor;

start1 := proj( 0.8u, 0, 0.7u );
stop1 := start1 shifted (1.8u,-0.6u);
mark( start1 );
drawarrow start1{dir -40}..stop1{dir -10};

start1 := proj( 0.8u, 0, 0.4u );
stop1 := start1 shifted (1.8u,-0.6u);
mark( start1 );
drawarrow start1{dir -20}..stop1{dir 10};

start1 := proj( 0.8u, 0.6u, u );
stop1 := start1 shifted (u,u);
mark( start1 );
drawarrow start1{dir 20}..stop1{dir 70};

start1 := proj( 0.8u, 0.2u, u );
stop1 := start1 shifted (2u,u);
mark( start1 );
drawarrow start1{dir 10}..stop1{dir 40};





endfig;
end