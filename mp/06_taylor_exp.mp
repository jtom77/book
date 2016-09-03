verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

vardef exp( expr x ) = mexp(256)**x enddef;
vardef f( expr x ) = 1+x+(x**2)/2 enddef;
vardef g( expr x ) = 1+x+(x**2)/2+(x**3)/6 enddef;
vardef h( expr x ) = 1+x+(x**2)/2+(x**3)/6+(x**4)/24 enddef;

u:= 0.8cm;
v := u;
numeric min;
numeric max;

picture dd; dd := dashpattern( on 6bp off 2bp on 2bp off 2bp );

beginfig(1);

pickup pencircle scaled 0.5pt;

labeloffset := 1.5pt;


pair a[];
pair b[];
pair c[];
pair d[];

M := 100;


xmin :=-3;
xmax :=1.6;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := ( u*(xmin+i*dx), v*exp( xmin+i*dx ) );
endfor 

draw a0 for i=1 upto M: --a[i] endfor withpen pencircle scaled 0.8pt;

draw (-3u,-2u)--(3u,4u) dashed dd scaled 0.6;

xmin :=-3;
xmax := 2;
dx := (xmax-xmin)/M;
for i=0 upto M:
b[i] := ( u*(xmin+i*dx), v*f( xmin+i*dx ) );
endfor 

draw b0 for i=1 upto M: --b[i] endfor dashed dd;

xmin := -3;
xmax :=  2;
dx := (xmax-xmin)/M;
for i=0 upto M:
c[i] := ( u*(xmin+i*dx), v*g( xmin+i*dx ) );
endfor 

draw c0 for i=1 upto M: --c[i] endfor dashed evenly;

xmin :=-3;
xmax := 2;
dx := (xmax-xmin)/M;
for i=0 upto M:
d[i] := ( u*(xmin+i*dx), v*h( xmin+i*dx ) );
endfor 

draw d0 for i=1 upto M: --d[i] endfor dashed evenly scaled 0.5;

clip currentpicture to ( (-3u,-v)--(3u,-v)--
(3u,4.8*v)--(-3u,4.8*v)--cycle );


drawarrow (-3u,0)--(3u,0) withpen pencircle scaled 0.3pt;
drawarrow (0,-v)--(0,4.8v) withpen pencircle scaled 0.3pt;

mark( (0,u) );

label.top( btex $\exp$ etex, (-2.8u,2) );
label.rt( btex $T_1$ etex,  (-2u+3,-v) );
label.rt( btex $T_2$ etex,   (-3u,f(-3)*v));
label.rt( btex $T_3$ etex,   (-3u-2,-v));
label.rt( btex $T_4$ etex,   (-3u,h(-3)*v));
label.rt( btex $1$ etex, (2,u-2)); 


endfig;
end