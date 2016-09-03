verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex
input mydefs;

u:=1.5cm;

beginfig(1);


path c;


c := (0,0){dir 65}..(3u,u);
draw subpath (0.14,1) of c withpen pencircle scaled 0.6pt;

s := 0.4;
pair mid;
pair t;
pair f;
pair n;

mid := point s of c;

t := 1.3u*unitvector( direction s of c );
n := t rotated 90;

f := mid+0.7*t+0.3*n;

draw (mid+0.7*t)--f dashed evenly;

drawarrow mid--mid+t;
drawarrow mid--f;

mark( mid );
 
label.rt( btex $\dot{\alpha}(t)$ etex, mid+t );
label.top( btex $F(\alpha(t))$ etex, f+(0,1) );
label.rt( btex $\alpha$ etex, (point 0.18 of c) shifted (2,0) );
label.bot( btex $\alpha(t)$ etex, mid+(3,-1) );
 

endfig;
end
