verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex


u := 0.6cm;

beginfig(1);

pair shift;

shift := (-7u,0);

drawarrow (0,0) shifted shift--(3u,0) shifted shift;
drawarrow (0,0) shifted shift--(0,3u) shifted shift;
draw (0,2u) shifted shift--(3u,2u) shifted shift dashed evenly;

pair b[];

for i=1 upto 20:
b[i] := (0.15*i*u,2u-u/sqrt(i));
b[i] := b[i] shifted shift;
draw b[i] withpen pencircle scaled 4;
draw b[i] withpen pencircle scaled 2 withcolor white;
endfor

label.bot( btex $\mathbb{R}$ etex, (2u,0) );

for i=0 step 0.15 until 2.8:
draw (i*u,0) shifted shift--(i*u,-mm) shifted shift;
endfor

label.bot( btex $\mathbb{N}$ etex, (3u,0) shifted shift );
label.lft( btex $\mathbb{R}$ etex, (0,3u) shifted shift );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pair a[];


a[0] := (u,u);

shift := (1.5u,1.5u);

for i=1 upto 20:
a[i] := a[i-1];
a[i] := a[i-1] rotatedabout( (0,0), 30 );
a[i] := a[i] xscaled 0.9 yscaled 0.85;
endfor

fill (3u,0)--(1.5u,-1.5u)--(-1.4u,-1.5u)--(0,0)--cycle 
withcolor 0.9 white;


for i=0 upto 20:
a[i] := a[i] shifted shift;
draw (ypart a[i]-0.5*(xpart a[i]), 0.15*i*u-0.5*(xpart a[i])) 
withpen pencircle scaled 4;
draw (ypart a[i]-0.5*(xpart a[i]), 0.15*i*u-0.5*(xpart a[i])) 
withpen pencircle scaled 2 withcolor white;
endfor

drawarrow (0,0)--(3u,0);
drawarrow (0,0)--(0,3u);
drawarrow (0,0)--(-0.5*3u,-0.5*3u);

for i=0 step 0.15 until 2.8:
draw (0,i*u)--(-mm,i*u);
endfor


label.lft( btex $\mathbb{N}$ etex, (0,3u) );
label.lft( btex $\mathrm{Re}$ etex, (-0.5*3u,-0.5*3u) );
label.bot( btex $\mathrm{Im}$ etex, (3u,0) );
%label.lft( btex $0$ etex, (0,-1) );
label.lft( btex $1$ etex, (0,0.15u) );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

shift := (6u,0);

fill (0,0) shifted shift--(3u,0) shifted shift--(3u,3u) shifted shift
--(0,3u) shifted shift--cycle withcolor 0.9 white;

drawarrow (0,0) shifted shift--(3u,0) shifted shift;
drawarrow (0,0) shifted shift--(0,3u) shifted shift;


for i=0 upto 20:
a[i] := a[i] shifted shift;
endfor;

for i=1 upto 20:
draw a[i]--a[i-1];
endfor

for i=0 upto 20:
draw a[i] withpen pencircle scaled 4;
draw a[i] withpen pencircle scaled 2 withcolor white;
endfor

label.bot( btex $\mathrm{Re}$ etex, (3u,0) shifted shift );
label.lft( btex $\mathrm{Im}$ etex, (0,3u) shifted shift );

endfig;
end
