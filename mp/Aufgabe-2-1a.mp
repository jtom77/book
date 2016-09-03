verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
etex

input mydefs;

numeric pi;
pi := 3.14159;


vardef sin( expr x ) = sind( x*180/pi ) enddef;
vardef f( expr x ) = 4*sin( pi*x/12.0 ) enddef;


u:=0.7cm;
v := u;

beginfig(1);

pair a[];
pair b[];

pickup pencircle scaled 0.2pt;



numeric M;
M := 100;
dx := 12/M;

for i=0 upto M:
a[i] := ( u*i*dx, v*f(i*dx) );
endfor;


drawarrow (0,0)--(13u,0);
drawarrow (0,0)--(0,5v);


for i=1 upto 12:
draw (i*u,mm)--(i*u,-mm);
endfor;

for i=1 upto 4:
draw (-mm,i*v)--(mm,i*v);
endfor;

draw a0 for i=1 upto M: --a[i] endfor;



label.bot( btex $1$ etex, (1*u,-mm) );
label.bot( btex $2$ etex, (2*u,-mm) );
label.bot( btex $3$ etex, (3*u,-mm) );
label.bot( btex $4$ etex, (4*u,-mm) );
label.bot( btex $5$ etex, (5*u,-mm) );
label.bot( btex $6$ etex, (6*u,-mm) );
label.bot( btex $7$ etex, (7*u,-mm) );
label.bot( btex $8$ etex, (8*u,-mm) );
label.bot( btex $9$ etex, (9*u,-mm) );
label.bot( btex $10$ etex, (10*u,-mm) );
label.bot( btex $11$ etex, (11*u,-mm) );
label.bot( btex $12$ etex, (12*u,-mm) );
label.bot( btex $x$ etex, (13*u,-mm) );

label.lft( btex $1$ etex, (-mm,1*v) );
label.lft( btex $2$ etex, (-mm,2*v) );
label.lft( btex $3$ etex, (-mm,3*v) );
label.lft( btex $4$ etex, (-mm,4*v) );
label.lft( btex $f(x)$ etex, (-mm,5*v) );

label.urt( btex $K$ etex, (9u,v*f(9) ) );



endfig;
end