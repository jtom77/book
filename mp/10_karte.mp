verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex
input mydefs;

u:=0.7cm;
v := 0.3*u;

beginfig(1);

pickup pencircle scaled 0.2pt;

pair a[];

path p;
path sq;
shift := 8u;

sq := (-1,-1)--(1,-1)--(1,1)--(-1,1)--cycle;
sq := sq xscaled 2.5u yscaled 2u;
draw sq;
draw sq shifted (shift,0);

p := fullcircle scaled 4u;
dx := length(p)/10;
path c;

for i=0 upto 10:
a[i] := point dx*i of p;
endfor;

for i=1 step 2 until 9:
a[i] := a[i] scaled 0.3;
endfor;

c := a0{up}...a1...a2...a3...a4...a5...a6...a7...a8...a9...a0{up};

path e;
e := fullcircle scaled u shifted a1;
fill e withcolor 0.9 white;
draw e;

draw c;
 
numeric s[];
s1 := xpart( (subpath(0,1) of c) intersectiontimes e );
s2 := xpart( (subpath(1,2) of c) intersectiontimes e );

draw subpath (s1,1+s2) of c withpen pencircle scaled 0.8pt;
 
mark(a1);
 
label.urt( btex $a$ etex, a1 );
label.( btex $U$ etex, a1 shifted (-0.2u,-0.2u) );
draw a7 withpen pensquare scaled 4mm withcolor white;
label( btex $M$ etex, a7-(0,2) );


draw (shift+0.5u,0.5u)--(shift,0);
label.top( btex $V=\varphi(U)$ etex, (shift+0.5u,0.5u) );

fill fullcircle xscaled 1.2u yscaled 0.7u shifted (shift,0) 
withcolor 0.9 white;
draw fullcircle xscaled 1.2u yscaled 0.7u shifted (shift,0);

draw (shift-2.5u,0)--(shift+2.5u,0);
draw (shift-0.6u,0)--(shift+0.6u,0) withpen pencircle scaled 0.8pt;
label.llft( btex $\mathbb{R}^k_0$ etex, (shift+2.5u,0) );
draw (shift+0.5u,-0.5u)--(shift,0);
label.bot( btex $\varphi( M\cap U )$ etex, (shift+0.5u,-0.5u) );

label.ulft( btex $\mathbb{R}^n$ etex, (2.5u,-2u) );
label.ulft( btex $\mathbb{R}^n$ etex, (shift+2.5u,-2u) );

drawarrow (3u,u)--(5u,u);

label.top( btex $\varphi$ etex, (4u,u) );

endfig;
end

