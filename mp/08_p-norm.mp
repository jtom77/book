verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

vardef draw_norm( expr m, col )=
save c;
path c;
c := (u,0){(0,1)}..(m,m){(-1,1)}..(0,u){(-1,0)}..(-m,m){(-1,-1)}
..(-u,0){(0,-1)}..(-m,-m){(1,-1)}..(0,-u){(1,0)}..(m,-m){(1,1)}..cycle;
fill c withcolor col;
draw c;
enddef;

u := 1.8cm;

beginfig(1);

pickup pencircle scaled 0.3pt;

color col[];
col1 := 0.9 white;
col2 := white;

fill unitsquare scaled 2u shifted (-u,-u) withcolor white;
draw unitsquare scaled 2u shifted (-u,-u);

draw_norm( u/( 2**(1/4) ), col1 );

fill fullcircle scaled 2u withcolor col2;
draw fullcircle scaled 2u; 

fill (u,0)--(0,u)--(-u,0)--(0,-u)--cycle withcolor col1;
draw (u,0)--(0,u)--(-u,0)--(0,-u)--cycle;

pair lab[];
lab1 := (-0.5u,-0.5u);
lab2 := (-u/sqrt(2), -u/sqrt(2) );
lab3 := (-u/(2**(1/4)), -u/(2**(1/4)) );
lab4 := (-u,-u);

labeloffset := 1pt;
label.urt( btex $1$ etex, lab1 );
label.urt( btex $2$ etex, lab2 );
label.urt( btex $4$ etex, lab3 );
label.urt( btex $\infty$ etex, lab4 );



endfig;
end

