verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\usepackage{mathrsfs}
\begin{document}
\footnotesize
etex
input mydefs;

vardef drawarr( expr A, B, s )=
drawarrow A--(B-s*unitvector(B-A) );
enddef;

u:=cm;
v := 0.3*u;

beginfig(1);

draw (-2u,0)--(2u,0);
drawarr ( (-u,0), (u,0), 2pt );
drawarr ( (-u,0), (u,2u), 2pt );
drawarr ( (u,2u), (u,0),  2pt );

mark( (-u,0) );
mark( (u,0) );
mark( (u,2u) );

label.bot( btex $S_n f$ etex, (u,-2) );
label.bot( btex $0$ etex, (-u,-2) );
label.top( btex $f$ etex, (u,2u+2) );
label.rt( btex  $f-S_nf$ etex, (u,u) );
label( btex $\mathscr{R}(2\pi)$ etex, (-1.2u,1.5u) );
label.rt( btex $\mathscr{T}(2\pi)$ etex, (2u,0) );

endfig;
end

