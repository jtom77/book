verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

vardef log( expr x ) = mlog(x)/256 enddef; 

u:=0.4cm;

beginfig(1);

pickup pencircle scaled 0.6pt;

labeloffset := 1pt;

xstart := 0;
xstop :=  14;
ystart := -4;
ystop := 3;

pair a[];
path c;

M := 100;
xmin := mexp(256)**(ystart);
xmax := xstop;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := u*( xmin+i*dx, log( xmin+i*dx ) );
endfor 

c := a0 for i=1 upto M: --a[i] endfor;
draw c;


clip currentpicture to 
( (xstart*u,ystart*u)--(xstop*u,ystart*u)
--(xstop*u,ystop*u)--(xstart*u,ystop*u)--cycle );

drawarrow (xstart*u,0)--(xstop*u,0);
drawarrow (0,ystart*u)--(0,ystop*u);


draw (u,0)--(u,-mm);
draw (0,u)--(-mm,u);

label.lft( btex $1$ etex, (-1.5mm,u) );
label.bot( btex $1$ etex, (u,-1.5mm) );
label.top( btex $\log$ etex, (4u,u*log(4)+2));





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




endfig;
end