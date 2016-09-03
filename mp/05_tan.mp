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
vardef tan( expr x ) = sin(x)/cos(x) enddef;
vardef cot( expr x ) = cos(x)/sin(x) enddef;

u:=0.3cm;

beginfig(1);

labeloffset := 1pt;

xstart := -1.5*pi-1;
xstop := 1.5*pi+1;
ystart := -8;
ystop := 8;

pair a[];
pair b[];
path c;

M := 100;
xmin :=-pi/2+0.1;
xmax := pi/2-0.1;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := u*( xmin+i*dx, tan( xmin+i*dx ) );
endfor 

for i=-1.5*pi step pi until 1.5*pi:
draw (i*u,ystart*u)--(i*u,ystop*u) dashed withdots scaled 0.5;
endfor;

for i=-1.5*pi step 0.5*pi until 1.5*pi:
draw (i*u,-mm)--(i*u,0);
endfor

 
c := a0 for i=1 upto M: --a[i] endfor;
draw c withpen pencircle scaled 0.6pt;
draw c shifted (-pi*u,0) withpen pencircle scaled 0.6pt;
draw c shifted (pi*u,0) withpen pencircle scaled 0.6pt;

drawarrow (xstart*u,0)--(xstop*u,0);
drawarrow (0,ystart*u)--(0,ystop*u);

clip currentpicture to 
( (xstart*u,ystart*u)--(xstop*u,ystart*u)
--(xstop*u,ystop*u)--(xstart*u,ystop*u)--cycle );

%label( btex $-\frac{3\pi}{2}$ etex, (-1.5*pi*u,-3mm) );
label( btex $-\pi$ etex, (-pi*u,-3mm) );
%label( btex $-\frac{\pi}{2}$ etex, (-0.5*pi*u,-3mm) );
%label( btex $\frac{3\pi}{2}$ etex, (1.5*pi*u,-3mm) );
label( btex $\pi$ etex, (pi*u,-3mm) );
%label( btex $\frac{\pi}{2}$ etex, (0.5*pi*u,-3mm) );
label.bot( btex $x$ etex, (xstop*u,-mm) );

draw (-pi*u,ystop*u-2)--(-3mm,ystop*u-2) withpen pencircle 
scaled 3mm withcolor white;
label.lft( btex $\tan x$ etex, (-mm,ystop*u-2) );

picture firstpic;
firstpic := currentpicture;
currentpicture := nullpicture;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

M := 100;
xmin :=-pi+0.1;
xmax := -0.1;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := u*( xmin+i*dx, cot( xmin+i*dx ) );
endfor 

for i=-pi step pi until pi:
draw (i*u,ystart*u)--(i*u,ystop*u) dashed withdots scaled 0.5;
endfor;

for i=-1.5*pi step 0.5*pi until 1.5*pi:
draw (i*u,-mm)--(i*u,0);
endfor

c := a0 for i=1 upto M: --a[i] endfor;
draw c withpen pencircle scaled 0.6pt;
draw c shifted (pi*u,0) withpen pencircle scaled 0.6pt;
draw (subpath (M/2,M) of c) shifted (-pi*u,0) withpen pencircle scaled 0.6pt;
draw (subpath (0,M/2) of c) shifted (2*pi*u,0) withpen pencircle scaled 0.6pt;

drawarrow (xstart*u,0)--(xstop*u,0);
drawarrow (0,ystart*u)--(0,ystop*u);

clip currentpicture to 
( (xstart*u,ystart*u)--(xstop*u,ystart*u)
--(xstop*u,ystop*u)--(xstart*u,ystop*u)--cycle );

%label( btex $-\frac{3\pi}{2}$ etex, (-1.5*pi*u-2,-3mm) );
label( btex $-\pi$ etex, (-pi*u,-3mm) );
%label( btex $-\frac{\pi}{2}$ etex, (-0.5*pi*u,-3mm) );
%label( btex $\frac{3\pi}{2}$ etex, (1.5*pi*u,-3mm) );
label( btex $\pi$ etex, (pi*u,-3mm) );
%label( btex $\frac{\pi}{2}$ etex, (0.5*pi*u,-3mm) );
label.bot( btex $x$ etex, (xstop*u,-mm) );

%draw (-pi*u,ystop*u-2)--(-3mm,ystop*u-2) withpen pencircle 
%scaled 3mm withcolor white;
label.lft( btex $\cot x$ etex, (-mm,ystop*u-2) );

draw firstpic shifted (-4*pi*u,0);



endfig;
end