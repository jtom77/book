verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

u := 0.9cm;

vardef draw_angle( expr a, b, length, col ) = 
fill ( (0,0)+length*unitvector( a-(0,0) ))
{unitvector( a-(0,0) ) rotated 90}..
( (0,0)+length*unitvector( b-(0,0) ) )
{unitvector( b-(0,0) ) rotated 90}--(0,0)--cycle withcolor col;
drawarrow ( (0,0)+length*unitvector( a-(0,0) ))
{unitvector( a-(0,0) ) rotated 90}..
( (0,0)+length*unitvector( b-(0,0) ) )
{unitvector( b-(0,0) ) rotated 90};
enddef;

beginfig(1);

pair z, w, zw;
zangle := 25;
wangle := 45;
zwangle := zangle+wangle;
z := (3.5u,0);
w := (2.5u,0);
zw := (3u,0);
z := z rotatedabout( (0,0), zangle );
w := w rotatedabout( (0,0), wangle );
zw := zw rotatedabout( (0,0), zwangle );

ahlength := 1.5mm;
draw_angle( (1,0), zw, 11mm, white );
draw_angle( (1,0), w, 10mm, white );
draw_angle(  w, zw, 9mm, 0.8 white);
draw_angle( (1,0), z, 9mm, 0.8 white );

ahlength := 2mm;
ahangle := 0.75*45;

drawarrow (0,0)--z;
drawarrow (0,0)--w;
drawarrow (0,0)--zw;

drawarrow (0,0)--(4u,0);
drawarrow (0,0)--(0,4u);

pair labelpt;
labelpt := (3u,0);
labelpt := labelpt rotatedabout((0,0),zwangle/2);

label.rt( btex $z$ etex, z );
label.urt( btex $z'$ etex, w );
label.top( btex $zz'$ etex, zw );

labelpt := (2.3u,0);
labelpt := labelpt rotatedabout( (0,0), zwangle );

labeloffset := 0.5pt;
label.lft( btex $|zz'|$ etex rotated zwangle, labelpt);

label.bot( btex $\mathrm{Re}$ etex, (4u-mm,-mm) );
label.lft( btex $\mathrm{Im}$ etex, (-mm,4u-mm) );

endfig;
end
