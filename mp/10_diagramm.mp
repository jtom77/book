verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
etex


prologues := 3;
input mydefs;

pickup pencircle scaled 0.2pt;

vardef drawarr( expr A, B, s )=
drawarrow (A+s*unitvector(B-A))--(B-s*unitvector(B-A));
enddef;

u:=1.4cm;
v := 0.3*u;

beginfig(1);



pair a[];

l := 3*mm;

a1 := (0,u);
a2 := (1.5u,0);
a3 := (-1.5u,0);
a4 := (0,-u);

drawarr( a1, a2, l );
drawarr( a1, a3, l );
drawarr( a4, a3, l );
drawarr( a4, a2, l );

draw (0,u-l)--(0,l);
drawarrow (0,-l)--(0,-u+2*mm);

label( btex $\mathbb{R}^k\times \mathbb{R}^m$ etex, a1+(0,7mm) );
label( btex $\cup$ etex, a1+(0,3.5mm) );
label( btex $D$ etex, a1 );
label( btex $\mathbb{R}^k$ etex, a3 );
label( btex $\mathbb{R}^m$ etex, a2+(2,0) );
label( btex $\mathbb{R}^k\times \mathbb{R}^m$ etex, a4-(0,3) );

label.ulft( btex\footnotesize $\mathrm{pr}_1$ etex, 1/2[a1,a3] );
label.llft( btex\footnotesize $\mathrm{pr}_1$ etex, 1/2[a3,a4] );
label.lrt( btex\footnotesize $\mathrm{pr}_2$ etex, 1/2[a4,a2] );
label.urt( btex\footnotesize $f$ etex, 1/2[a1,a2] );
label( btex\footnotesize $F=\mathrm{pr}_1 \times f$ 
etex, 1/2[a1,a4] );



endfig;
end