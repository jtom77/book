verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex
input mydefs;

path c, d;
pair mid;

vardef drawit( expr s, t, sh )=
c := c shifted (0,sh);
d := d shifted (0,sh);
mid := 1/2[ point s of c, point t of d ];
draw ( subpath (0,s) of c )...mid{dir 85}...( subpath (t,1) of d ) 
withpen pencircle scaled 0.2pt;
c := c shifted (0,-sh);
d := d shifted (0,-sh);
enddef;

u:=0.7cm;
v := 0.3*u;

beginfig(1);

c := (-3u,-u){dir 5}...(0,0){dir 5};
d := (0,0.7u){right}...(3u,1.5u){dir 5};

draw c;
draw d;

drawarrow (-3u,-1.2u)--(3u,-1.2u);
draw (0,-1.2u)--(0,-1.2u-mm);
label.bot( btex $a$ etex, (0,-1.2u-mm) );

draw currentpicture shifted (8u,0);

draw (0,0) withpen pencircle scaled 3pt;
draw (0,0.7u) withpen pencircle scaled 3pt;
draw (0,0.7u) withpen pencircle scaled 2pt withcolor white;

draw (8u,0) withpen pencircle scaled 3pt;
draw (8u,0.7u) withpen pencircle scaled 3pt;
draw (8u,0) withpen pencircle scaled 2pt withcolor white;


%label.bot( btex halbstetig von unten in $a$ etex, (0,-1.2u-11) );
%label.bot( btex halbstetig von oben in $a$ etex, (8u,-1.2u-11) ); 


draw (0,2u) withcolor white;



endfig;
end
