verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex



numeric pi;
pi := 3.1415926;
vardef exp primary x = ((mexp 256)**x) enddef;
vardef cos primary x = (cosd(x*180/pi)) enddef;
vardef sin primary x = (sind(x*180/pi)) enddef;


u := 1.8cm;

beginfig(1);

numeric M;
M := 30;

pair a[];

a[0] := (u,0);

for i=1 upto M: 
a[i] := a[i-1];
a[i] := a[i] rotatedabout( (0,0), 30 );
a[i] := a[i] xscaled exp(-0.05*i) yscaled exp(-0.05*i);
endfor

scale := 50;
fill fullcircle scaled scale shifted a[M] withcolor 0.9 white;  
draw fullcircle scaled scale shifted a[M];  

scale := 25;
fill fullcircle scaled scale shifted a[8] withcolor 0.8 white;  
draw fullcircle scaled scale shifted a[8];  

for i=0 upto M:
draw a[i] withpen pencircle scaled 4;
%draw a[i]--a[i+1];
endfor 

draw a[8] withpen pencircle scaled 4;
draw a[8] withpen pencircle scaled 2 withcolor white; 
draw a[M] withpen pencircle scaled 4;
draw a[M] withpen pencircle scaled 2 withcolor white; 


label.bot( btex $a_N$ etex, a[8] );
label.lft( btex $a$ etex, a[M] );
label( btex $U_{\epsilon}(a)$ etex, (0,15) );

pair arrh;
arrh := a[8] shifted (10,0);
drawarrow arrh shifted (28,-10)--arrh;

label.rt( btex $U_{\epsilon/2}(a_N)$ etex, arrh shifted (28,-10) );




endfig;
end