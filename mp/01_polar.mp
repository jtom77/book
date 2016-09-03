verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex



input mydefs;

u:=1.0cm;


def draw_angle( expr A, O, B, l ) = 
pair start, stop;
start := O+l*unitvector(A-O);
stop :=  O+l*unitvector(B-O);
draw start{unitvector(start-A) rotated 90}..stop;
enddef;

beginfig(1);

pair P;

drawarrow (-u,0)--(4u,0);
drawarrow (0,-0.7u)--(0,3u);

P := (3u,2u);

draw (0,0)--P;
draw P--(xpart P,0) dashed evenly;
draw P--(0,ypart P) dashed evenly;
draw (0,ypart P)--(-6,ypart P);
draw (xpart P,0)--(xpart P,-6);
markempty P;

ahlength:=2mm;
drawdblarrow (0,-4)--(3u,-4) thin;
drawdblarrow (-4,0)--(-4,2u) thin;

draw_angle( P, (0,0), (1,0) , 9mm );

label( btex $\varphi$ etex, (6mm,0) rotatedabout( (0,0), 15) );
label.rt( btex $z = x+\mathrm{i}y$ etex, P+(2,0) );
label.ulft( btex $r$ etex, 1/2[(0,0),P] );
label.bot( btex $\mathrm{Re}$ etex, (4u-1,-2) );
label.lft( btex $\mathrm{Im}$ etex, (-2,3u-1) );
%label.bot( btex $x$ etex, (xpart P, -mm ) );
%label.lft( btex $y$ etex, (-mm,ypart P ) );
label.bot( btex $r \cos\varphi$ etex, (1.5u,-5) );
label.lft( btex $r \sin\varphi$ etex, (-5,u) );

endfig;
end
