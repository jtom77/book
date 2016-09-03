verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
etex

input mydefs;

u:=2cm;
v := 0.4u;

ahlength := 1mm;

pickup pencircle scaled 0.2pt;

path d;

d := (-1.4,-1)--(1.4,-1)--(1.4,1)--(-1.4,1)--cycle;

d := d scaled v;

fill d withcolor 0.9 white;
draw d;

fill fullcircle scaled 0.2u withcolor 0.8 white;
draw fullcircle scaled 0.2u;

draw (0,-v)--(0,v);

drawarrow (-0.8v,-0.8v)--(0.8v,-0.8v);
drawarrow (-0.8v,-0.8v)--(-0.8v,0.8v);



mark( (0,0) );



drawarrow (-1.6v,-0.4v)--(-2.5v,0.2v);

ahlength := 2mm;
label.top( btex $\alpha$ etex, 1/2[(-1.6v,-0.4v),(-2.5v,0.4v)] ); 


picture pic;
pic := currentpicture;
currentpicture := nullpicture;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vardef proj( expr x, y, z )=
(0.8*y+0.5*x,z+0.5*x-0.3*y) enddef;

vardef f( expr x, y )=
proj( u*((1+y*cosd( x/2 ))*sind(x)), 
u*( (1+y*cosd (x/2))*cosd(x) ), u*(y*sind( x/2 )) )
enddef;

beginfig(1);

ahlength :=mm;

pair a[];
pair b[];

M := 60;
dx := 360/M;

for i=0 upto M:
a[i] := f( i*dx, 1/4 );
b[i] := f( i*dx, -1/4 );
endfor; 

draw a0 for i=0 upto M: --a[i] endfor;
draw b0 for i=0 upto M: --b[i] endfor;

path c;

for i=0 step 4 until 32:
c :=  a[i]--a[i+1]--a[i+2]--a[i+3]--a[i+4]
--b[i+4]--b[i+3]--b[i+2]--b[i+1]--b[i]--cycle;
if( i=0 ):
fill c withcolor 0.9 white;
draw c;
else:
fill c withcolor white;
fi;
if( i < 32 ):
drawarrow 0.35[ a[i+1], b[i+1] ]--0.65[ a[i+1], b[i+1] ] 
withpen pencircle scaled 0.2 pt;
drawarrow 0.35[ a[i+1], b[i+1] ]--0.35[ a[i+3], b[i+3] ]
withpen pencircle scaled 0.2 pt;
fi;
draw subpath (0,5) of c;
draw subpath (5,10) of c;
endfor;

for i=32 step 4 until M-4:
c :=  a[i]--a[i+1]--a[i+2]--a[i+3]--a[i+4]
--b[i+4]--b[i+3]--b[i+2]--b[i+1]--b[i]--cycle;
fill c withcolor 0.9 white;
if( i=M-4 ):
fill c withcolor 0.9 white;
draw c;
else:
fill c withcolor white;
fi;
if( i>32 ):
drawarrow 0.35[ a[i+1], b[i+1] ]--0.65[ a[i+1], b[i+1] ] 
withpen pencircle scaled 0.2 pt;
drawarrow 0.35[ a[i+1], b[i+1] ]--0.35[ a[i+3], b[i+3] ]
withpen pencircle scaled 0.2 pt;
fi;
draw subpath (0,5) of c;
draw subpath (5,10) of c;
endfor;

mark( 1/2[ a0, b0 ] );


draw pic shifted (2.2u,-0.6u);






endfig;
end