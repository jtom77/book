verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex
input mydefs;

u:=0.6cm;
v := 0.3*u;

beginfig(1);

pickup pencircle scaled 0.2pt;

pair a[];

path p;

p := fullcircle scaled 4u;
dx := length(p)/10;
path c;

for i=0 upto 10:
a[i] := point dx*i of p;
endfor;

a0 := a0 shifted (-u,0);
a3 := a3 shifted (-0.2u,0.4u);
a4 := a4 shifted (-0.3u,0.1u);
a5 := a5 shifted (-0.5u,0);
a6 := a6 shifted (-0.3u,-0.3u);
a9 := a9 shifted (0.5u,-0.6u);

c := a0{up}...a4...a7{dir 70}...a0{up}...cycle;

fill c withcolor 0.9 white;
draw c;

pair t[];
t1 := (-1.3u,-0.5u);
t2 := t1 shifted (0.7u,0.7u);

fill fullcircle scaled 2.5u shifted t1 withcolor white;
draw fullcircle scaled 2.5u shifted t1;

draw t1--t2;
mark( t1 );
mark( t2 );

label.lft( btex $a$ etex, t1-(0,2) );
label.lft( btex $a+h$ etex, t2-(2,0) );
label.lft( btex $D$ etex, a0-(2mm,0) );
label( btex\small $U_\delta(a)$ etex, t1+(-0.1u,-0.8u) );


endfig;
end


