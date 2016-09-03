verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

u := 1.2cm;
ahlength := 2mm;
ahangle := 0.75*45;

beginfig(1);

fill fullcircle scaled 2u withcolor 0.9 white;
draw fullcircle scaled 2u;

fill fullcircle scaled 0.7u shifted (0.5u,0.2u) withcolor 0.8 white;
draw fullcircle scaled 0.7u shifted (0.5u,0.2u);


pair lab[];
lab1 := (0,-0.9u);
lab1 := lab1 rotatedabout( (0,0), -40 );

draw lab1--lab1-(7,7);

label.lft( btex $U_\varepsilon(a)$ etex, lab1-(7,7) );

lab2 := (0.3u,0) shifted (0.5u,0.2u);
lab2 := lab2 rotatedabout( (0.5u,0.2u), 40 );

draw lab2--lab2+(7,7);

label.rt( btex $U_{\varepsilon^*}(x)$ etex, lab2+(7,7) );

mark( (0,0) );
mark( (0.5u,0.2u) );

label.bot( btex $a$ etex, (0,-2) );
label.bot( btex $x$ etex, (0.5u,0.2u-2) ); 


endfig;
end

