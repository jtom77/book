verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex


input mydefs;

u:=1.4cm;

beginfig(1);


fill fullcircle scaled 2u withcolor 0.9 white;
draw fullcircle scaled 2u dashed evenly;
fill fullcircle scaled 1.7u withcolor white;
draw fullcircle scaled 1.7u;

label( btex $\overline{U}_r(a)$ etex, (-0.3u,0.3u) );

pair lab;
lab := (0,-0.95u);
lab := lab rotatedabout( (0,0), -45 );

draw lab--lab+(-8,-8);
label.bot( btex $U_R(a)$ etex, lab+(-8,-9) );


draw (0.5u,0.5u) withpen pencircle scaled 3pt;
draw (0.5u,0.5u) withpen pencircle scaled 2pt withcolor white;
draw (0,0) withpen pencircle scaled 3pt;
draw (0,0) withpen pencircle scaled 2pt withcolor white;

pair a,b;
a := (u,0) rotatedabout ( (0,0), 20 );
b := (1.7u/2,0) rotatedabout ( (0,0),-20 );

draw (0,0)--0.35[(0,0),a];
draw 0.65[(0,0),a]--a;

label( btex $R$ etex, 1/2[(0,0),a] );

draw (0,0)--0.4[(0,0),b];
draw 0.6[(0,0),b]--b;

label( btex $r$ etex, 1/2[(0,0),b] );

label.lft( btex $z$ etex, (0.5u-1,0.5u) );
label.bot( btex $a$ etex, (0,-2) );

mark( (0,0) );




endfig;
end