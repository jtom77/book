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

u:=0.46cm;
v := 1.3*u;

beginfig(1);

pair a[];
pair b[];

M := 100;
xmin :=-4*pi;
xmax := 4*pi;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := ( u*(xmin+i*dx), v*cos( xmin+i*dx ) );
b[i] := ( u*(xmin+i*dx), v*sin( xmin+i*dx ) );
endfor 

draw a0 for i=1 upto M: --a[i] endfor withpen pencircle scaled 0.6pt;
draw b0 for i=1 upto M: --b[i] endfor withpen pencircle scaled 0.3pt;

drawarrow (-4*pi*u-4,0)--(4*pi*u+u,0);
drawarrow (0,-1.2v)--(0,1.6v);

for i=-4*pi step pi until 4*pi:
draw (i*u,-mm)--(i*u,mm); 
endfor

draw (-mm,-v)--(mm,-v);
draw (-mm,v)--(mm,v);

labeloffset := 1.5pt;
label.bot( btex $-4\pi$ etex, (-4*pi*u,-mm) );
label.bot( btex $-3\pi$ etex, (-3*pi*u-2,-mm) );
label.bot( btex $-2\pi$ etex, (-2*pi*u+1,-mm) );
label.bot( btex $-\pi$ etex, (-1*pi*u-2,-mm) );
label.bot( btex $\pi$ etex, (1*pi*u,-mm) );
label.bot( btex $2\pi$ etex, (2*pi*u+2,-mm) );
label.bot( btex $3\pi$ etex, (3*pi*u-1,-mm) );
label.bot( btex $4\pi$ etex, (4*pi*u,-mm) );
%label.bot( btex $-\frac{7\pi}{2}$ etex, (-7*0.5*pi*u,-mm) );
%label.bot( btex $-\frac{5\pi}{2}$ etex, (-5*0.5*pi*u,-mm) );
%label.bot( btex $-\frac{3\pi}{2}$ etex, (-3*0.5*pi*u,-mm) );
%label.bot( btex $-\frac{\pi}{2}$ etex, (-1*0.5*pi*u,-mm) );
%label.bot( btex $\frac{7\pi}{2}$ etex, (7*0.5*pi*u,-mm) );
%label.bot( btex $\frac{5\pi}{2}$ etex, (5*0.5*pi*u,-mm) );
%label.bot( btex $\frac{3\pi}{2}$ etex, (3*0.5*pi*u,-mm) );
%label.bot( btex $\frac{\pi}{2}$ etex, (1*0.5*pi*u,-mm) );

draw (-2.5mm,v-5)--(-2.5mm,v+5) withpen pencircle scaled 2mm withcolor white;
label.lft( btex $1$ etex, (-3,v) );
label.lft( btex $-1$ etex, (-2,-v) );

label.lft( btex $\cos$ etex, (1.8*pi*u-2,cos(1.8*pi)*v) );
label.rt( btex $\sin$ etex, (2.7*pi*u+2,sin(2.7*pi)*v) );


endfig;
end