verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
etex

input mydefs;

numeric pi;
pi := 3.14159;

vardef proj( expr x, y, z )= (y-0.5*x,z-0.5*x) enddef;

u:=2.6cm;
v := 0.15*u;

beginfig(1);

pickup pencircle scaled 0.2pt;

pair A, B, C, D, E, F, G, H;

A := proj(0,0,0);
B := proj(u,0,0);
C := proj(u,u,0);
D := proj(0,u,0);
E := proj(0,0,u);
F := proj(u,0,u);
G := proj(u,u,u);
H := proj(0,u,u);


drawarrow A--proj(1.5u,0,0);
drawarrow A--proj(0,1.5u,0);
drawarrow A--proj(0,0,1.5u);

pair P,Q,R;

P := proj(u,0,0.6u);
Q := proj(1.0u,0.4u,1.0u);
R := proj(0.6u,0,1.0u);


draw P-1.5*(Q-P)--Q+1.5*(Q-P) withcolor blue;
fill P--Q--R--cycle withcolor blue;
draw P--Q--R--cycle dashed evenly;

draw A--B--C--D--cycle;
draw E--F--G--H--cycle;
draw B--F;
draw C--G;
draw D--H;
draw A--E;


label.bot( btex $x_1$ etex, proj(1.5u,0,0) );
label.bot( btex $x_2$ etex, proj(0,1.5u,0) );
label.rt( btex $x_3$ etex, proj(0,0,1.5u) );
label.ulft( btex $B$ etex, B );
label.urt( btex $A(0|0|0)$ etex, A );
label.lrt( btex $C$ etex, C );
label.urt( btex $D$ etex, D+(0,mm) );
label.lft( btex $F$ etex, F );
label.lrt( btex $G$ etex, G );
label.urt( btex $E$ etex, E+(0,mm) );
label.rt( btex $H$ etex, H );
label( btex $S_4$ etex, F+(0.25u-3,-0.05u-2) );


label.rt( btex $P_4$ etex, proj(1u+mm,0,0.6u) + (2,-2) );





endfig;
end