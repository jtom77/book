verbatimtex
%&latex
\documentclass{article}
\begin{document}
%\usepackage[T1]{fontenc}
%\renewcommand\rmdefault{bch}
%\usepackage{dsfont}
\footnotesize
etex


input mydefs;

u := 0.8cm;
ahlength := 2mm;
ahangle := 0.75*45;

beginfig(1);

pair z, w, zw;

z := (3,1)*u;
w := (0.5,2)*u;
zw := z+w; %(xpart z + xpart w, ypart z + ypart w);

drawarrow (-2mm,0)--(4u,0);
drawarrow (0,-2mm)--(0,4u);
drawarrow (0,0)--w;
drawarrow (0,0)--z;
drawarrow (0,0)--zw;
draw z--zw dashed evenly scaled 0.7 verythin;
draw w--zw dashed evenly scaled 0.7 verythin;


label.rt( btex $z$ etex, z+(0,-1) );
label.rt( btex $z+z'$ etex, z+w );
label.top( btex $z'$ etex, w );
label.bot( btex $\mathrm{Re}$ etex, (4u-mm,-mm) );
label.rt( btex $\mathrm{Im}$ etex, (mm,4u-mm) );
%label.lrt( btex $\mathds{C}$ etex, urcorner currentpicture );


endfig;
end
