verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex


u:=3cm;
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



input mydefs;


beginfig(1);

labeloffset := 1pt;

draw_curve( 1.2,1.4,0.5,1, 1.3u );




endfig;
end