verbatimtex
%&latex
\documentclass{article}
\usepackage{color}
\usepackage{amsmath}
\def\i{\mathrm{i}}
\begin{document}
\footnotesize
etex

input mydefs;

u := 0.8cm;
ahlength := 2mm;
ahangle := 0.75*45;

beginfig(1);

pair a[];

a1 := (3,1.5)*u;
a2 := (-xpart a1, ypart a1);
a3 := -a1;
a4 := -a2;

mark( a1 );
mark( a2 );
mark( a3 );
mark( a4 );

drawarrow (-4u,0)--(4u,0);
drawarrow (0,-2.2u)--(0,2.5u);

draw a1--a2--a3--a4--cycle dashed withdots scaled 0.5;

for i=1 upto 4: 
drawarrow (0,0)--a[i];
%draw a[i] withpen pencircle scaled 4;
%draw a[i] withpen pencircle scaled 2 withcolor white;
endfor

draw (0,ypart a1)--(-mm,ypart a1) thin;
draw (0,ypart a3)--(-mm,ypart a3) thin;
draw (xpart a1,0)--(xpart a1,-mm) thin;
draw (xpart a2,0)--(xpart a2,-mm) thin;

label.urt( btex $\strut z=x+\i y$ etex, a1 );
label.ulft( btex $\strut\overline{-z}=-x+\i y$ etex, a2 );
label.llft( btex $\strut -z=-x-\i y$ etex, a3-(0,1) );
label.lrt( btex $\strut\overline{z}=x-\i y$ etex, a4-(0,1) );

label.bot( btex $\mathrm{Re}$ etex, (4u-1,-2) );
label.lft( btex $\mathrm{Im}$ etex, (-2,2.5u-1) );

fill unitsquare scaled 4mm shifted (0,ypart a1) shifted (-5mm,-2mm) 
withcolor white;
label.lft( btex $\i y$ etex, (-mm, ypart a1) );

fill unitsquare scaled 3mm shifted (xpart a1,0) shifted (-1.5mm,-4mm) 
withcolor white;
label.bot( btex $x$ etex, (xpart a1,-mm) );

fill unitsquare scaled 7mm shifted (0,ypart a3) shifted (-8mm,-3mm) 
withcolor white;
label.lft( btex $-\i y$ etex, (-mm, ypart a3) );

fill unitsquare scaled 3mm shifted (xpart a2,0) shifted (-1.5mm,-4mm) 
withcolor white;
label.bot( btex $-x$ etex, (xpart a2,-mm) );

endfig;
end
