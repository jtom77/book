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

u:=1.2cm;
v := 0.3*u;

beginfig(1);

c := (-u,-u){dir 5}...(0,0){dir 5}...(u,0.2u);
d := (0,u){dir 40}...(u,2u){dir 5};

draw subpath (0,1) of c withpen pencircle scaled 1pt;
draw d withpen pencircle scaled 1pt;

drawit( 1.2, 0.5, -5 );
drawit( 1.1, 0.25, -1 );
%drawit( 1.06, 0.2, 0 );
drawit( 1.03, 0.15, 0 );

draw (0,0) withpen pencircle scaled 3pt;
draw (0,0) withpen pencircle scaled 2pt withcolor white;
draw (0,u) withpen pencircle scaled 3pt;


label.top( btex $f$ etex, point 0.8 of c );
label.rt( btex $f_k \uparrow f$ etex, (0.3u,0.5u) );



endfig;
end
