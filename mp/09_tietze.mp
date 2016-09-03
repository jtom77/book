verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

u:=0.5cm;
v := 0.3*u;




beginfig(1);


pair a[];
M := 100;
dx := 6/M;

for i=0 upto M:
a[i] := (i*dx, sin(i*dx)+0.5*cos(3*i*dx)+0.3*sin(8*i*dx) +1/(i*dx+0.8) )*u;
endfor;

draw a0 for i=1 upto M: --a[i] endfor withpen pencircle scaled 1.3pt;;

label.rt( btex $g$ etex, a[40]+(2,0) );

draw (-4u,0)--(10u,0);
draw (0,-2.3u)--(0,2.3u);
draw (6u,-2.3u)--(6u,2.3u);
draw (0,2u)--(6u,2u) dashed evenly scaled 0.5 withpen pencircle scaled 0.2pt;
draw (0,-2u)--(6u,-2u) dashed evenly scaled 0.5 withpen pencircle scaled 0.2pt;
draw (0,2u/3)--(6u,2u/3) 
dashed evenly scaled 0.5 withpen pencircle scaled 0.2pt;
draw (0,-2u/3)--(6u,-2u/3) 
dashed evenly scaled 0.5 withpen pencircle scaled 0.2pt;


draw (-4u,2u/3)--(2.5u,2/3u){right}..{right}(4.4u,-2u/3)--(10u,-2u/3) withpen pencircle scaled 1.3pt;

draw (0,2u)--(-mm,2u);
draw (0,-2u)--(-mm,-2u);
draw (0,-2u/3)--(-mm,-2u/3);
draw (6u,2u/3)--(6u+mm,2u/3);

label.lft( btex $s$ etex, (-mm,2u) );
label.lft( btex $-s$ etex, (-mm,-2u) );
label.rt( btex $s/3$ etex, (6u+mm,2u/3) );
label.lft( btex $-s/3$ etex, (-mm,-2u/3) );
label.bot( btex $A$ etex, (u,0) );
label.bot( btex $X$ etex, (-2.5u,0) );
label.top( btex $v$ etex, (-2.5u,2u/3) );


endfig;
end

