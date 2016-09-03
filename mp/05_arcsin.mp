verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

def pi := 3.14159 enddef;

vardef sin( expr x ) = sind( x*180/pi ) enddef;
vardef cos( expr x ) = cosd( x*180/pi ) enddef; 

u:=cm;

beginfig(1);

pickup pencircle scaled 0.6pt;

labeloffset := 1pt;

xstart := -1.2;
xstop :=  1.5;
ystart := -pi-0.2;
ystop := pi+0.5;

pair a[];
pair b[];
path c;

M := 100;
xmin := ystart;
xmax := ystop;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := u*( sin(xmin+i*dx), xmin+i*dx  );
endfor 

c := a0 for i=1 upto M: --a[i] endfor;
draw c dashed evenly;

xmin :=  -pi/2;
xmax :=  pi/2;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := u*( sin(xmin+i*dx), xmin+i*dx  );
endfor 

c := a0 for i=1 upto M: --a[i] endfor;
draw c;



clip currentpicture to 
( (xstart*u,ystart*u)--(xstop*u,ystart*u)
--(xstop*u,ystop*u)--(xstart*u,ystop*u)--cycle );

drawarrow (xstart*u,0)--(xstop*u,0);
drawarrow (0,ystart*u)--(0,ystop*u);

draw (-u,0)--(-u,-mm);
draw (u,0)--(u,-mm);
draw (0,pi/2*u)--(-mm,pi/2*u);
draw (0,-pi/2*u)--(-mm,-pi/2*u);

label.bot( btex $-1$ etex, (-u,-mm) );
label.bot( btex $1$ etex, (u,-mm) );
label.lft( btex $\frac{\pi}{2}$ etex, (-mm,pi/2*u) );
label.lft( btex $-\frac{\pi}{2}$ etex, (-mm,-pi/2*u) );
label.lrt( btex $\arcsin$ etex, (sin(0.25*pi)*u, 0.25*pi*u) );

draw (-u,0)--(-u,pi/2*u)--(-4mm,pi/2*u) dashed withdots scaled 0.5;
draw (0,pi/2*u)--(u,pi/2*u)--(u,pi/4*u) dashed withdots scaled 0.5;
draw (u,pi/4*u-5)--(u,0) dashed withdots scaled 0.5;
draw (u,-4mm)--(u,-pi/2*u)--(0,-pi/2*u) dashed withdots scaled 0.5;
draw (-6mm,-pi/2*u)--(-u,-pi/2*u)--(-u,-4mm) dashed withdots scaled 0.5;

endfig;
end