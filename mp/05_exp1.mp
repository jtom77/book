verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

def pi = 3.14159 enddef;

vardef p( expr x,y,z ) = (0.9*y+0.7*x,z-0.7*x+0.3*y) enddef;

vardef cos( expr x ) = cosd( x*180/pi ) enddef; 
vardef exp( expr x ) = mexp(256)**x enddef;
vardef f( expr x, y) = 0.8*exp(x)*cos(y) enddef;

u:=0.3cm;

beginfig(1);

path c[];
path d[];

M := 51;
xmin := -3; xmax := 2;
dx := (xmax-xmin)/M;
pair a[][];
ymin := -5; ymax := 5;
dy := (ymax-ymin)/M;

for i=0 upto M:
for j=0 upto M:
a[i][j] := p( u*(xmin+i*dx), u*(ymin+j*dy), u*f( xmin+i*dx, ymin+j*dy ) );
endfor;
endfor;

draw (0,0)--p(0,6u,0);
drawarrow (0,0)--p(0,0,4u);

for i=0 step 3 until M:
c[i] := a[i][0] for j=1 upto M: ...a[i][j] endfor;
d[i] := a[0][i] for j=1 upto M: ...a[j][i] endfor;
draw c[i];
draw d[i];
endfor

path h[][];
path g[][];


drawarrow (0,0)--p(4u,0,0);
drawarrow p(0,2.7u,0)--p(0,7u,0);

label.bot( btex $\mathrm{Re}\,z$ etex, p(4u,0,0) shifted (-6,1) );
label.bot( btex $\mathrm{Im}\,z$ etex, p(0,7u,0) shifted (7,0));
label.lft( btex $\mathrm{Re}\,\exp z$ etex, p(0,0,4u) shifted (0,-2) );



endfig;
end