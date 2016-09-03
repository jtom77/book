verbatimtex
%&latex
\documentclass{article}
\begin{document}
%\footnotesize
etex

input mydefs;

u := 0.6cm;
ahlength := 2mm;
ahangle := 0.75*45;

beginfig(1);

path c;
path d;

c := (u,0){dir 70}...(-u,0){dir -30}...cycle;
d := (0,u){dir 120}...(0,-5){dir -10}...cycle;


d := d scaled 2;
d := d shifted (0,u); 



path e;
e := buildcycle( c,d );

fill e withcolor 0.8 white;

path f;
f := fullcircle scaled 0.8u shifted (-0.2u,1.3u);
fill f withcolor white;

mark( (-0.2u,1.3u) );

draw d;
draw c; 
draw f;




endfig;
end

