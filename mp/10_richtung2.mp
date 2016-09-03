verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex
input mydefs;

u:=0.3cm;
v := 0.3*u;

beginfig(1);

pair a[];

path p;
pair v;

p := (2u,0){dir 100}...(0,2u){left}...(-2u,0){left}
...(0.6u,-2u){dir 60}...cycle;

p := p shifted (0,-u);

fill p withcolor 0.9 white;
draw p;

v := (2u,1.5u);
pair a;

a := (-2u,-3u);

mark( a );
mark( a+v );
drawarrow a--(a+v);


label.lft( btex $a$ etex, a-(1,0) );
label.rt( btex $a+v$ etex, a+v+(-5,4) );
label( btex $D$ etex, (-2.5u+1,-1.5u-2) );
label.bot( btex $v$ etex, 1/2[a,a+v]+(0,-1) );
picture pic;
pic := currentpicture;
currentpicture := nullpicture;

drawarrow (0,0)--(8u,0);
drawarrow (0,0)--(0,7u);
drawarrow (0,0)--v;

label.top( btex $v$ etex, 1/2[(0,0),v]+(0,1) );

label.bot( btex $x_1$ etex, (8u-1,-mm) );
label.lft( btex $x_2$ etex, (-mm,7u-1) );

draw pic shifted (5u,6u);

endfig;
end











