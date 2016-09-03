verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex


vardef fak( expr n ) = 
numeric tmp;
tmp := 1;
for i=1 upto n:
tmp := tmp*i;
endfor
tmp
enddef;

u := 0.6cm;
Euler := 2.71827;

beginfig(1);

pair a[];
pair b[];
numeric k[];

for i=1 upto 6:
k[i] := 1/fak(i);
endfor;

a[0] := (0,u);
for i=1 upto 6:
Temp := 1;
for j=1 upto i:
Temp := Temp+k[j];
endfor;
a[i] := (0.25*i, Temp)*u;
endfor

for i=7 upto 20:
a[i] := (0.25*i*u,ypart a[6]);
endfor;

for i=0 upto 20:
draw a[i] withpen pencircle scaled 4;
endfor

drawarrow (0,0)--(5.5u,0);
drawarrow (0,0)--(0,4u);
draw (0,Euler)*u--(5.5,Euler)*u dashed evenly;

for i=1 upto 20:
b[i] := (0.25*i,(1+1/i)**i)*u;
draw b[i] withpen pencircle scaled 4;
draw b[i] withpen pencircle scaled 2 withcolor white;
endfor

draw a[1] withpen pencircle scaled 4;

for i=1 upto 20:
draw (0.25*i*u,0)--(0.25*i*u,-0.5*mm);
endfor

for i=5 step 5 until 20:
draw (0.25*i*u,0)--(0.25*i*u,-1.2*mm);
endfor

draw (0,u)--(-1mm,u);
draw (0,2u)--(-1mm,2u);

draw (0,Euler*u)--(-1mm,Euler*u);
label.lft( btex $e$ etex, (-1mm, Euler*u) );

label.bot( btex $\mathbb{N}$ etex, (5.5u,0) );
label.lft( btex $\mathbb{R}$ etex, (0,4u) );
label.lft( btex $1$ etex, (-1mm,u) );
label.lft( btex $2$ etex, (-1mm,2u));


draw (3u,1.6u) withpen pencircle scaled 4;
draw (3u,u) withpen pencircle scaled 4;
draw (3u,u) withpen pencircle scaled 2 withcolor white;

label.rt( btex $:E_n$ etex, (3u,1.6u) );
label.rt( btex $:e_n$ etex, (3u,u) );


endfig;
end











