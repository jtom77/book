verbatimtex
%&latex
\documentclass{article}
\begin{document}
%\footnotesize
etex

input mydefs;

u := 1cm;
ahlength := 2mm;
ahangle := 0.75*45;

beginfig(1);

fill fullcircle scaled 2u withcolor 0.9 white;
draw fullcircle scaled 2u dashed evenly;

draw (0,0) withpen pencircle scaled 2;

pair a;
a := (u,0) rotatedabout ( (0,0), 30 );

draw (0,0)--a;


label.lft( btex $a$ etex, (0,0) );

pair labelpt;
labelpt := 1/2[(0,0),a];
labelpt := labelpt shifted ( 5*unitvector(a-(0,0)) rotated 90 ); 

label( btex $\lbrace$ etex xscaled 1.5 yscaled 2.6 rotated -60, labelpt);

labelpt := labelpt shifted ( 5*unitvector(a-(0,0)) rotated 90 );
label( btex $\varepsilon$ etex, labelpt );
 
label( btex $U_\varepsilon(a)$ etex, (0,-0.6u) );

endfig;
end

