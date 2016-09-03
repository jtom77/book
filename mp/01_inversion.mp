verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

u:=1.5cm;

def draw_arc( expr A, B, C ) = 
pair start, stop;
start := A rotatedabout(B,10);
stop :=  C rotatedabout(B,-10);
draw start{unitvector(start-B) rotated -90}..stop;
enddef;

beginfig(1);

numeric ratio;
ratio := 2.5;
pair O,P,PP,S,R;
O := (0,0);
P := (ratio*u,0);
PP := (u/ratio,0);

path circ;
path Pcirc;

numeric circsize; circsize := 2*u*ratio;
circ := fullcircle scaled 2u; 
Pcirc := fullcircle scaled circsize shifted P;



R := circ intersectionpoint Pcirc;
S := (xpart R, -ypart R );
fill O--P--R--cycle withcolor 0.8 white;
draw_arc( PP, R, O );
draw_arc( O, P, R );
%draw_arc( O, S, PP );


draw O--P--R--cycle;
draw R--PP;

path vertical;
vertical := PP--(xpart PP,-6u);
pair T;
T := vertical intersectionpoint circ;
draw PP--T dashed evenly;
draw O--T dashed evenly;
draw T--P dashed evenly;

draw P withpen pencircle scaled 4;
draw O withpen pencircle scaled 3;
%draw S withpen pencircle scaled 3;
draw R withpen pencircle scaled 3;
draw T withpen pencircle scaled 3;
draw PP withpen pencircle scaled 4;
draw PP withpen pencircle scaled 2 withcolor white;
draw P withpen pencircle scaled 2 withcolor white;

draw circ;
%draw Pcirc;

label.lrt( btex $P'$ etex, PP );
label.bot( btex $P$ etex, P);
label.llft( btex $O$ etex, O shifted (0,-2));
%label.bot( btex $S$ etex, S shifted (-3,0));
label.top( btex $R$ etex, R shifted (-3,0));
label.bot( btex $T$ etex, T );


endfig;
end