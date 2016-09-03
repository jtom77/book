verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

def pi = 3.14159 enddef;

vardef cos( expr x ) = cosd( x*180/pi ) enddef; 
vardef sin( expr x ) = sind( x*180/pi ) enddef;

vardef drawspitz( expr x, y )=
draw (x,0)--(x-1/4*(x-y),-v)--(x-3/4*(x-y),v)--(y,0) withpen 
pencircle scaled 0.3pt;
enddef;

u:=5cm;
v := 0.3*u;
numeric min;
numeric max;

vardef findmin( expr a, b ) = 
save r,s,h; 
r := a;
s := b;
min := r;
forever: exitunless( r<s );
r := r+0.01;
if( sin(1/r) < sin(1/min) ):
min := r;
fi;
endfor;
h := sin(1/min);
fill (a*u,0)--(b*u,0)--(b*u,h*v)--(a*u,h*v)--cycle withcolor 0.9 white; 
draw (a*u,0)--(b*u,0)--(b*u,h*v)--(a*u,h*v)--cycle; 
enddef;

vardef findmax( expr a, b ) = 
save r,s,h; 
r := a;
s := b;
max := r;
forever: exitunless( r<s );
r := r+0.01;
if( sin(1/r) > sin(1/max) ):
max := r;
fi;
endfor;
h := sin(1/max);
fill (a*u,0)--(b*u,0)--(b*u,h*v)--(a*u,h*v)--cycle withcolor white; 
draw (a*u,0)--(b*u,0)--(b*u,h*v)--(a*u,h*v)--cycle; 
enddef;


beginfig(1);

pickup pencircle scaled 0.3pt;

labeloffset := 1.5pt;

fill (0,0)--(0.2u,0)--(0.2u,v)--(0,v)--cycle withcolor white;
draw (0,0)--(0.2u,0)--(0.2u,v)--(0,v)--cycle;
fill (0,0)--(0.2u,0)--(0.2u,-v)--(0,-v)--cycle withcolor 0.9 white;
draw (0,0)--(0.2u,0)--(0.2u,-v)--(0,-v)--cycle;

drawarrow (0,0)--(1.1u,0);
drawarrow (0,-1.1v)--(0,1.4v);

drawarrow (0.1u-4,v+4)--(0,v+4);
drawarrow (0.1u+4,v+4)--(0.2u,v+4);

label( btex $\varepsilon$ etex, (0.1u,v+4) );

pair a[];
pair b[];

M := 300;
xmin :=1/(5*pi);
xmax :=1;
dx := (xmax-xmin)/M;
for i=0 upto M:
b[i] := ( u*(xmin+i*dx), v*sin( 1/(xmin+i*dx) ) );
endfor 

numeric start;
start := u/(30*pi);
i := 5;


%drawspitz( u/i, u/(i-2*pi) );
%i := i-2*pi;
%endfor;

forever: exitunless( i<50 );
drawspitz( u/(i*pi), u/((i+2)*pi) );
i := i+2;
endfor;

for i=0.2 step 0.05 until 0.32:
findmin( i, i+0.05 );
findmax( i, i+0.05 );
endfor

for i=0.35 step 0.05 until 1:
findmax( i, i+0.05 );
findmin( i, i+0.05 );
endfor

draw b0 for i=1 upto M: --b[i] endfor withpen pencircle scaled 0.3pt;

draw (0,-v)--(-mm,-v);
draw (0,v)--(-mm,v);

label.bot( btex $x$ etex, (1.1u-2,-3) );
label.lft( btex $y$ etex, (-3,1.4v-2) );
label.rt( btex $x\mapsto \sin\frac{1}{x}$ etex, (0.5u,1.2v) );
label.lft( btex $1$ etex, (-mm,v));
label.lft( btex $-1$ etex, (-mm,-v) );

endfig;
end