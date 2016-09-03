verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex



u:=1.4cm;

beginfig(1);

pickup pencircle scaled 0.6pt;

path c;

c := (u,u)...(2u,0.8u)...{dir 30}(3u,2u);


path d, e;
d := c shifted (0,-0.25u);
e := c shifted (0,0.25u);

M := 50;
for i=0 upto M:
fill (point (i*2/M) of d)--(point ((i+1)*2/M) of d)
--(point ((i+1)*2/M) of e)--(point (i*2/M) of e)--cycle 
withcolor 0.9 white;
endfor;

draw c withpen pencircle scaled 1.5pt withcolor 0.4 white;
draw d dashed evenly;
draw e dashed evenly;

pickup pencircle scaled 0.3pt;
for k=0 upto 0:
M := 20;
pair a[];
for i=0 upto M:
a[i] := point (i*2/M) of c;
a[i] := a[i] shifted (0, u*uniformdeviate(0.2)-0.1u);
%draw a[i] withpen pencircle scaled 1.5pt;
endfor
draw a0 for i=1 upto M-1: ..a[i] endfor..a[M]{dir 30};
endfor

drawarrow (0.5u,0.2u)--(3.6u,0.2u);
drawarrow (0.5u,0.2u)--(0.5u,2.3u);

labeloffset := 1pt;
label.rt( btex $f$ etex, (point 2.0 of c) shifted (2,0) );


drawarrow (u-10,u-4)--(u-10,u-0.25u);
drawarrow (u-10,u+4)--(u-10,u+0.25u);
label( btex $2\varepsilon$ etex, (u,u) shifted (-10,0) );




endfig;
end