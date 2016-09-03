verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
etex

input mydefs;

numeric pi;
pi := 3.14159;

vardef proj( expr x, y, z )= (y-0.5*x,z-0.5*x) enddef;

u:=cm;
v := 0.15*u;

beginfig(1);

pickup pencircle scaled 0.2pt;




drawarrow (0,0)--proj(6u,0,0);
drawarrow (0,0)--proj(0,6u,0);
drawarrow (0,0)--proj(0,0,7u);

for i=1 upto 6:
draw proj(0,-mm,i*u)--proj(0,mm,i*u);
endfor;

for i=1 upto 5:
draw proj(i*u,-mm,0)--proj(i*u,mm,0);
draw proj(-mm,i*u,0)--proj(mm,i*u,0);
endfor;


draw proj(3u,0,0)--proj(0,4u,0)--proj(0,0,6u)--cycle;
draw proj(2u,0,6u)--proj(2u,0,0)--proj(0,3u,0)--proj(0,3u,6u);

pair A, B;
A = ( proj(3u,0,0)--proj(0,0,6u) ) intersectionpoint 
( proj(2u,0,0)--proj(2u,0,6u) );
B = ( proj(0,4u,0)--proj(0,0,6u) ) intersectionpoint 
( proj(0,3u,0)--proj(0,3u,6u) );

draw (A-0.3*(B-A))--(B+0.3*(B-A));


label.lft( btex $1$ etex, proj(u,0,0)-(mm,0) );
label.lft( btex $2$ etex, proj(2u,0,0)-(mm,0) );
label.lft( btex $3$ etex, proj(3u,0,0)-(mm,0) );
label.lft( btex $4$ etex, proj(4u,0,0)-(mm,0) );
label.lft( btex $5$ etex, proj(5u,0,0)-(mm,0) );
label.lft( btex $x_1$ etex, proj(6u,0,0) );

label.top( btex $1$ etex, proj(-mm,u,0)+(2,0) );
label.top( btex $2$ etex, proj(-mm,2u,0)+(2,0) );
label.top( btex $3$ etex, proj(-mm,3u,0)+(2,0) );
label.top( btex $4$ etex, proj(-mm,4u,0)+(2,0) );
label.top( btex $5$ etex, proj(-mm,5u,0)+(2,0) );
label.top( btex $x_2$ etex, proj(mm,6u,0) );

label.lft( btex $1$ etex, proj(0,-mm,u) );
label.lft( btex $2$ etex, proj(0,-mm,2u) );
label.lft( btex $3$ etex, proj(0,-mm,3u) );
label.lft( btex $4$ etex, proj(0,-mm,4u) );
label.lft( btex $5$ etex, proj(0,-mm,5u) );
label.lft( btex $6$ etex, proj(0,-mm,6u) );
label.lft( btex $x_3$ etex, proj(0,-mm,7u) );


draw A withpen pencircle scaled 3pt;
draw B withpen pencircle scaled 3pt;
draw proj(2u,0,0) withpen pencircle scaled 3pt;
draw proj(3u,0,0) withpen pencircle scaled 3pt;
draw proj(0,3u,0) withpen pencircle scaled 3pt;
draw proj(0,4u,0) withpen pencircle scaled 3pt;
draw proj(0,0,6u) withpen pencircle scaled 3pt;

label.bot( btex $T_1$ etex, proj(2u,0,0) );
label.bot( btex $S_1$ etex, proj(3u,0,0) );
label.bot( btex $T_2$ etex, proj(0,3u,0) );
label.bot( btex $S_2$ etex, proj(0,4u,0) );

label.rt( btex $E_2$ etex, 0.8[proj(0,3u,0), proj(0,3u,6u)] );
label.urt( btex $E_1$ etex, 0.6[proj(0,4u,0), proj(0,0,6u)] );

label.rt( btex Schnittgerade etex, B+0.3*(B-A) );



endfig;
end