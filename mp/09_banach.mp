verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex


input mydefs;

u:=1.5cm;
v := 0.3*u;






beginfig(1);

labeloffset := 1pt;


path c;

c := (0,0)--(3u,0)--(3u,2u)--(0,2u)--cycle;
draw c;
label.urt( btex $M$ etex, (point 0.05 of c)+(0,1) ); 

for i=0 upto 7:
c := c scaled 0.7 shifted (0.6u,0.4u);
if( i<4 ):
fill c withcolor (0.9-0.1*i,0.9-0.1*i,0.9-0.1*i);
else:
fill c withcolor (0.6,0.6,0.6);
fi;
draw c;
endfor;

pair lab[];

lab1 := (0.7*3u-3+0.6*u,0.4u+3);
lab2 := lab1 shifted (0.5u,-0.3u);
draw lab1--lab2;
label.rt( btex $\varphi(M)$ etex, lab2+(1,0) );

lab1 := lab1 shifted (-0.2u,u);
lab2 := lab2 shifted (0,1.8u);
draw lab1--lab2;
label.rt( btex $\varphi(\varphi(M))$ etex, lab2+(1,0) );


 




endfig;
end