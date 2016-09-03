verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

vardef f( expr x, n ) = x**n enddef;

u:=2.5cm;

beginfig(1);



M := 100;
xmax := 0; xmin := 1;
dx := (xmax-xmin)/M;
pair a[][];

for k=1 upto 9:
for i=0 upto M:
a[k][i] := (xmin+i*dx, f(xmin+i*dx, k))*u;
endfor;
endfor

for k=1 upto 5:
draw a[k][0] for i=1 upto M: --a[k][i] endfor;
endfor

drawarrow (0,0)--(1.2u,0);
drawarrow (0,0)--(0,1.3u);

draw (u,0)--(u,-mm);
draw (0,u)--(-mm,u);
draw (u,0)--(u,u)--(0,u) dashed withdots scaled 0.5;


mark( (u,u) );

labeloffset := 0.5pt;
label.bot( btex $1$ etex, (u,-mm-1) );
label.lft( btex $1$ etex, (-mm-1,u) );

label.ulft( btex $f_0$ etex, (0.35u,0.35u) );
label.ulft( btex $f_1$ etex, (0.5, 0.25)*u );
label.lrt( btex $f_5$ etex, a[5][30] );


endfig;
end