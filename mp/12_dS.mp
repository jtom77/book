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

u:=0.7cm;

beginfig(1);

pickup pencircle scaled 0.2pt;

pair A, B, C, D;

A := (1.8u,0);
B := (4u,0.8u);
C := (2.2u,2.5u);
D := (0,1.2u);

path c[];
path d;

c1 := A{dir 45}..B{dir 0};
 
c2 := B{dir 90}..C{dir 170};
c3 := C{dir 180}..D{dir -110};
c4 := D{dir 0}..A{dir -70};

d := c1--c2--c3--c4--cycle;

fill d withcolor 0.8 white;
draw d;

pair M;
pair v[];
M := (1.5u,1.8u);

v1 := (1,-0.6);
v2 := (1,0.5);
v3 := (-0.7,4);

v1 := v1 scaled 0.7*u;
v2 := v2 scaled u;
 
v3 := v3 scaled 0.5u;

fill M--M+v1--M+v1+v2--M+v2--cycle withcolor white;
draw M--M+v1--M+v1+v2--M+v2--cycle;

drawarrow M--M+v1;
drawarrow M--M+v2;
drawarrow M--M+v3;

label.rt( btex $\overrightarrow{\mathrm{d}S}=\eta \mathrm{d}S$ etex, M+v3+(1,0) );
label( btex ${\mathrm{d}S}$ etex, 1/2[M+v1,M+v2] );

v3 := 0.5*v3;

drawarrow M--M+v3;

label.rt( btex $\eta$ etex, M+v3+(1,0) );
v3 := (-2,3);
 
v3 := v3 scaled 0.4*u;

drawarrow M--M+v3;

label.top( btex $F$ etex, M+v3+(0,1) );

picture pic;
pic := currentpicture;
currentpicture := nullpicture;



d := (0,0)..(2u,u){dir -10}..(3.5u,2u);
draw d;

v1 := unitvector( direction 0.6 of d );

M := point 0.6 of d;

drawarrow M--M+u*v1;
drawarrow M--M+2*u*v1;

label.top( btex $\tau$ etex, M+u*v1+(0,1) );
label.top( btex $\overrightarrow{\mathrm{d}s}$ etex, M+2*u*v1+(0,1) );

v2 := (0.3u,0.8u);

drawarrow M--M+v2;

label.lft( btex $F$ etex, M+v2+(-1,0) );
draw pic shifted (-5u,-0.5u);

label( btex\normalsize $\langle F, \overrightarrow{\mathrm{d}S} \rangle=
\langle F, \eta \rangle \mathrm{d}S$ etex, (-3u,-u) );

label( btex\normalsize $\langle F,\overrightarrow{\mathrm{d}s} \rangle =
\langle F, \tau \rangle \mathrm{d}s $ etex, (2u,-u) );


endfig;
end


