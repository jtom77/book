%verbatimtex
%%&latex
%\documentclass{article}
%\begin{document}
%\fogotnotesize
%etex

input mydefs;

u:=1.2cm;



def draw_arc( expr A, B, C ) = 
pair start, stop;
start := A rotatedabout( B, 20 );
stop  := C rotatedabout( B, -20 );
draw start{unitvector(start-B) rotated -90}
..stop{unitvector(stop-B) rotated -90} dashed evenly;
enddef;

beginfig(1);

pickup pencircle scaled 0.2pt;

numeric ratio;
ratio := 2.8;
pair O,P,PP,RR,R, mid;
O := (0,0);
P := (ratio,0)*u;
PP := (1.0/ratio,0)*u;

path c;
c := fullcircle scaled 2u;
draw c withpen pencircle scaled 0.6pt;

path b;
b := PP--( xpart PP, 10u);
R := b intersectionpoint c;
RR := (xpart R, -ypart R);

P := P rotatedabout( O, 40 );
PP := PP rotatedabout( O, 40 );
R := R rotatedabout( O, 40 );
RR := RR rotatedabout( O,40 );

draw O--P--R--cycle;


pair K;
K := (xpart PP, -ypart PP);
draw PP--K dashed evenly scaled 0.5;
draw R--RR;

mark( K );
mark( P );

draw O withpen pencircle scaled 3;

mark( P );
mark( PP );

label.rt( btex $z$ etex, P+(1,0) );
label.bot( btex $z^{-1}$ etex, K-(0,1) );

pair labelpt;
labelpt := (u,0) rotatedabout( O, -140 );

label.urt( btex $S^1$ etex, labelpt );

draw (-1.1u,0)--(1.7u,0);

endfig;
end
