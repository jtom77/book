verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

u := 3cm;

beginfig(1);

pickup pencircle scaled 0.2pt;


pair v,w;
v := (4,-1.3)*0.12u;
w := (2,3)*0.2u;

pair A,B,C,D;

A := (-0.7u,0);
B := A+v;
C := B+w;
D := A+w;

pair P, X, O;
P := (-0.3u,0.2u);
O := (-1,-0.6)*u;

fill fullcircle scaled u withcolor 0.9 white;
draw fullcircle scaled u;

draw (0,0)--P;
fill A--B--C--D--cycle withcolor white;
draw halfcircle rotated -90 xscaled 0.2u yscaled u dashed evenly scaled 0.5;
draw halfcircle xscaled u yscaled 0.2u dashed evenly scaled 0.5;



path c;
c := fullcircle scaled u;
numeric r,s;
r := xpart(c intersectiontimes (C--D));
s := xpart(c intersectiontimes (A--B));
draw subpath (0,r) of c;
draw subpath (r,s) of c dashed evenly scaled 0.5;
draw subpath (s,8) of c;

c := halfcircle rotated 90 xscaled 0.2u yscaled u;
r := xpart(c intersectiontimes (C--D));
s := xpart(c intersectiontimes (B--C));
draw subpath (0,r) of c;
draw subpath (r,s) of c dashed evenly scaled 0.5;
draw subpath (s,4) of c;

c := halfcircle xscaled u yscaled -0.2u;
r := xpart(c intersectiontimes (B--C));
draw subpath (0,r) of c;
draw subpath (r,4) of c dashed evenly scaled 0.5;



dot( P );
dot( (0,0) );

drawarrow (0,0)--P dashed evenly scaled 0.5;

X := P shifted (0.15u,0.24u);
drawarrow P--X;

fill A--(A+0.5*v)--(A+0.5*v+0.3*w)--(A+0.15*w)--cycle withcolor white;
draw A--B--C--D--cycle;

label.rt( btex $T_aM$ etex, A+(6,2) );
label.lft( btex $a$ etex, P-(1,0) );

label.rt( btex $O$ etex, (0,-1) );



endfig;
end