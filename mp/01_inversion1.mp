verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

u:=1.4cm;

def draw_arc( expr A, B, C ) = 
pair start, stop;
start := A rotatedabout( B, 20 );
stop  := C rotatedabout( B, -20 );
draw start{unitvector(start-B) rotated -90}
..stop{unitvector(stop-B) rotated -90} dashed evenly;
enddef;

beginfig(1);

numeric ratio;
ratio := 3;
pair O,P,PP,RR,R, mid;
O := (0,0);
P := (ratio,0)*u;
PP := (1.0/ratio,0)*u;

path c;
c := fullcircle scaled 2u;
draw c;

path b;
b := PP--( xpart PP, 10u);
R := b intersectionpoint c;
RR := (xpart R, -ypart R);

P := P rotatedabout( O, 20 );
PP := PP rotatedabout( O, 20 );
R := R rotatedabout( O, 20 );
RR := RR rotatedabout( O,20 );

draw O--P--R--cycle;
draw RR--R;

draw_arc( RR, 1/2[O,P], R );

draw O withpen pencircle scaled 3;
draw R withpen pencircle scaled 3;
draw RR withpen pencircle scaled 3;
draw P withpen pencircle scaled 4;
draw PP withpen pencircle scaled 4;
draw P withpen pencircle scaled 2 withcolor white;
draw PP withpen pencircle scaled 2 withcolor white;

label.bot( btex $P$ etex, P );
label.ulft( btex $R$ etex, R );
label.bot( btex $R'$ etex, RR );

pair labelpt;
labelpt := (u,0) rotatedabout( O, -110 );

label.urt( btex $S^1$ etex, labelpt );

labeloffset := 1pt;
label.llft( btex $O$ etex, O );
label.lrt( btex $P'$ etex, PP shifted (2,2) );

endfig;
end