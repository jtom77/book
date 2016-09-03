verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex



u:=cm;
v := 0.3*u;
numeric min;
numeric max;

beginfig(1);

labeloffset := 1.5pt;

pair a[];
pair b[];
path c;
path d;
path e;
path f;

M := 100;
xmin := 0.2;
xmax := 5;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := (xmin+i*dx-0.5, 1/( (xmin+i*dx)**2 ) )*u;
b[i] := (xmin+i*dx, 1/( (xmin+i*dx)**1.5 ) )*u;
endfor;

c := a0 for i=1 upto M: --a[i] endfor;
d := b0 for i=1 upto M: --b[i] endfor;

e := (3u,5u)--(4u,0)--(0.5u,0)--(0.5u,5u);

f := buildcycle( d, e );
fill f withcolor 0.9 white;

f := buildcycle( c, e );
fill f withcolor 0.8 white;



draw c;
draw d;

labeloffset := 1.5pt;
label.bot( btex $1$ etex, (u,-mm) );


clip currentpicture to 
( (0,0)--(4u,0)--(4u,2u)--(0,2u)--cycle );

draw (0.5u,-mm)--(0.5u,0);
draw (0.5u,0)--(0.5u,2u) dashed evenly;

drawarrow (0,0)--(4u,0);


labeloffset := 1.5pt;
label.bot( btex $a$ etex, (0.5u,-mm) );
label.bot( btex $\to\infty$ etex, (4u,-mm) );

label.lft( btex $|f|$ etex, (0.2u,1.8u) );
label.urt( btex $g$ etex, (u,u) );

endfig;
end