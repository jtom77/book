verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex


input mydefs;
u:=1.8cm;
v := 0.3*u;

def pi = 3.14159 enddef;

vardef cos( expr x ) = cosd( x*180/pi ) enddef; 
vardef sin( expr x ) = sind( x*180/pi ) enddef;

vardef draw_curve( expr n,m,r,s, scale )=
save a;
save p; save q;
pair a[];
path p;
path q;
p := fullcircle scaled scale;
for i=0 upto length(p):
a[i] := point i of p;
a[i] := a[i] xscaled (n*(1.2+sin(m*i))) yscaled (r*(1.5+cos(s*i)));
endfor;
q := a0 for i=1 upto length(p): ..a[i] endfor..cycle;
fill q withcolor 0.9 white;
draw q;
enddef;






beginfig(1);

labeloffset := 1pt;

draw_curve( 1.2,1.4,0.5,1, 1.3u );



pair A,B,C,D;
A := (0.2u,-0.5u);
D := (1.05u,0.3u);
B := (-0.1u,0.1u);
C := (0.9u,0.4u);




fill fullcircle scaled 0.5u shifted C withcolor 0.8 white;
draw fullcircle scaled 0.5u shifted C;

mark( A ); mark( B ); mark( C ); mark( D );
draw A--B--C--D;

label.lft( btex $a$ etex, A-(1,0) );
label.top( btex $u$ etex, C+(0,1) );
label.lft( btex $b$ etex, D-(0,2) );
%label.top( btex $K(u)$ etex, C shifted (-3,5) );
label( btex $U$ etex, (-0.7u,-0.5u) );


endfig;
end