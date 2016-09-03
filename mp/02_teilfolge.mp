verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

u := 0.15cm;

beginfig(1);


numeric M;
M := 20;


pair shift; 
pair shifta;

shift := (30u,0); 
shifta := (-30u,0);

drawarrow (0,0)--(22u,0);
drawarrow (0,0)--(0,12u);
drawarrow (0,0) shifted shift--(22u,0) shifted shift;
drawarrow (0,0) shifted shift--(0,12u) shifted shift;
drawarrow (0,0) shifted shifta--(22u,0) shifted shifta;
drawarrow (0,0) shifted shifta--(0,12u) shifted shifta;


for i=1 upto M:
draw (i*u,0)--(i*u,-1mm);
draw (i*u,0) shifted shift--(i*u,-1mm) shifted shift;
draw (i*u,0) shifted shifta--(i*u,-1mm) shifted shifta;
endfor

for i=5 step 5 until M:
draw (i*u,0)--(i*u,-1.5mm);
draw (i*u,0) shifted shift--(i*u,-1.5mm) shifted shift;
draw (i*u,0) shifted shifta--(i*u,-1.5mm) shifted shifta;
endfor


pair a[];

a[0] := (0,0);

for i=1 upto M:
a[i] := ( i, 12-10/(i**(1/3)) )*u;
draw a[i] shifted shifta withpen pencircle scaled 4;
draw a[i] shifted shifta withpen pencircle scaled 2 withcolor white;
endfor;

draw a[1] withpen pencircle scaled 4;
draw a[4] withpen pencircle scaled 4;
draw a[5] withpen pencircle scaled 4;
draw a[7] withpen pencircle scaled 4;
draw a[9] withpen pencircle scaled 4;
draw a[12] withpen pencircle scaled 4;
draw a[14] withpen pencircle scaled 4;
draw a[17] withpen pencircle scaled 4;
draw a[19] withpen pencircle scaled 4;
draw a[20] withpen pencircle scaled 4;

draw a[1] withpen pencircle scaled 2 withcolor white;;
draw a[4] withpen pencircle scaled 2 withcolor white;;
draw a[5] withpen pencircle scaled 2 withcolor white;;
draw a[7] withpen pencircle scaled 2 withcolor white;;
draw a[9] withpen pencircle scaled 2 withcolor white;;
draw a[12] withpen pencircle scaled 2 withcolor white;;
draw a[14] withpen pencircle scaled 2 withcolor white;;
draw a[17] withpen pencircle scaled 2 withcolor white;;
draw a[19] withpen pencircle scaled 2 withcolor white;;
draw a[20] withpen pencircle scaled 2 withcolor white;;


pair b[];

b[1] := (xpart a[1], ypart a[7]);
b[2] := (xpart a[2], ypart a[17]);
b[3] := (xpart a[3], ypart a[2]);
b[4] := (xpart a[4], ypart a[13]);
b[5] := (xpart a[5], ypart a[9]);
b[6] := (xpart a[6], ypart a[5]);
b[7] := (xpart a[7], ypart a[12]);
b[8] := (xpart a[8], ypart a[20]);
b[9] := (xpart a[9], ypart a[1]);
b[10] := (xpart a[10], ypart a[4]);
b[11] := (xpart a[11], ypart a[6]);

b[12] := (xpart a[12], ypart a[8]);
b[13] := (xpart a[13], ypart a[15]);
b[14] := (xpart a[14], ypart a[10]);
b[15] := (xpart a[15], ypart a[19]);
b[16] := (xpart a[16], ypart a[14]);
b[17] := (xpart a[17], ypart a[3]);
b[18] := (xpart a[18], ypart a[11]);
b[19] := (xpart a[19], ypart a[16]);
b[20] := (xpart a[10], ypart a[18]);

for i=1 upto M:
b[i] := b[i] shifted shift;
draw b[i] withpen pencircle scaled 4;
draw b[i] withpen pencircle scaled 2 withcolor white;
endfor

label.bot(  btex $\mathbb{N}$ etex, (22u,0) );
label.bot(  btex $\mathbb{N}$ etex, (22u,0) shifted shift);
label.bot(  btex $\mathbb{N}$ etex, (22u,0) shifted shifta);
label.lft(  btex $\mathbb{R}$ etex, (0,12u) );
label.lft(  btex $\mathbb{R}$ etex, (0,12u) shifted shift);
label.lft(  btex $\mathbb{R}$ etex, (0,12u) shifted shifta);
 


endfig; 
end