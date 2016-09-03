verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex
input mydefs;

def pi := 3.14 enddef;

vardef f( expr x ) = x**5-(5/2)*(x**4)+(5/3)*(x**3)-(1/6)*(x) enddef;
vardef g( expr x ) = x**3-1.5*(x**2)+x/2 enddef;

u:=.5cm;
v := 0.3*u;

beginfig(1);

drawarrow (-1.3*pi*u,0)--(1.4*pi*u,0);


draw (-pi*u,u)--(-pi*u,0) dashed evenly scaled 0.5;
draw (-pi*u,-3mm)--(-pi*u,-u) dashed evenly scaled 0.5;
draw (0,u)--(0,0) dashed evenly scaled 0.5;
draw (0,-3mm)--(0,-u) dashed evenly scaled 0.5;
draw (pi*u,u)--(pi*u,0) dashed evenly scaled 0.5;
draw (pi*u,-3mm)--(pi*u,-u) dashed evenly scaled 0.5;


draw (-1.3*pi*u,u)--(-pi*u,u) withpen pencircle scaled 0.6pt;
draw (-pi*u,-u)--(0,-u) withpen pencircle scaled 0.6pt;
draw (pi*u,u)--(0,u) withpen pencircle scaled 0.6pt;
draw (pi*u,-u)--(1.4*pi*u,-u) withpen pencircle scaled 0.6pt;

draw (-pi*u,0) withpen pencircle scaled 3pt;
draw (0,0) withpen pencircle scaled 3pt;
draw (pi*u,0) withpen pencircle scaled 3pt;

mark( (-pi*u,u) );
mark( (-pi*u,-u) );
mark( (pi*u,u) );
mark( (pi*u,-u) );
mark( (0,u) );
mark( (0,-u) );

labeloffset := 0pt;

label.bot( btex $-\pi$ etex, (-pi*u,-mm));
label.bot( btex $0$ etex, (0,-0.7mm));
label.bot( btex $\pi$ etex, (pi*u,-mm));







endfig;
end

