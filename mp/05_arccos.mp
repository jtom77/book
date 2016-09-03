verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

def pi := 3.14159 enddef;

vardef sin( expr x ) = sind( x*180/pi ) enddef;
vardef cos( expr x ) = cosd( x*180/pi ) enddef; 

u:=0.48cm;

beginfig(1);

pickup pencircle scaled 0.6pt;

labeloffset := 1pt;

pair b[];


xstart := -1.2;
xstop :=  1.6;
ystart :=-pi-0.2;
ystop := pi+0.8;

path c;

M := 100;
xmin :=  -pi;
xmax :=  -0.4;
dx := (xmax-xmin)/M;
for i=0 upto M:
b[i] := u*( cos(xmin+i*dx), xmin+i*dx  );
endfor 
c := b0 for i=1 upto M: --b[i] endfor;
draw c dashed evenly;


xmin :=  0;
xmax :=  pi;
dx := (xmax-xmin)/M;
for i=0 upto M:
b[i] := u*( cos(xmin+i*dx), xmin+i*dx  );
endfor 

c := b0 for i=1 upto M: --b[i] endfor;
draw c;

clip currentpicture to 
( (xstart*u,ystart*u)--(xstop*u,ystart*u)
--(xstop*u,ystop*u)--(xstart*u,ystop*u)--cycle );

drawarrow (xstart*u,0)--(xstop*u,0);
drawarrow (0,ystart*u)--(0,ystop*u);

draw (-u,0)--(-u,-mm);
draw (u,0)--(u,-mm);
draw (0,pi/2*u)--(-mm,pi/2*u);
draw (0,pi*u)--(-mm,pi*u);
draw (0,-pi/2*u)--(-mm,-pi/2*u);
draw (0,-pi*u)--(-mm,-pi*u);


label.bot( btex $-1$ etex, (-u,-mm) );
label.bot( btex $1$ etex, (u,-mm) );
label.lft( btex $\frac{\pi}{2}$ etex, (-mm,pi/2*u) );
label.lft( btex $\pi$ etex, (-mm,pi*u) );
label.lft( btex $-\frac{\pi}{2}$ etex, (-mm,-pi/2*u) );
label.lft( btex $-\pi$ etex, (-mm,-pi*u) );
label.urt( btex $\arccos$ etex, (cos(0.25*pi)*u, 0.25*pi*u) );

draw (-u,0)--(-u,pi*u)--(-4mm,pi*u) dashed withdots scaled 0.5;
draw (0,pi*u)--(u,pi*u)--(u,pi/4*u+5) dashed withdots scaled 0.5;
draw (u,pi/4*u)--(u,0) dashed withdots scaled 0.5;

picture firstpic;
firstpic := currentpicture;
currentpicture := nullpicture;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xstart := -1.2;
xstop :=  1.6;
ystart := -pi-0.2;
ystop := pi+0.8;

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


picture secondpic;
secondpic := currentpicture;
currentpicture := nullpicture;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


pair a[];

xstart := -4;
xstop :=   4;
ystart :=-pi-0.2;
ystop :=  pi+0.8;

drawarrow (xstart*u,0)--(xstop*u,0);
drawarrow (0,ystart*u)--(0,ystop*u);

M := 100;
xmin := -0.45*pi;
xmax :=  0.45*pi;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := u*( sin(xmin+i*dx)/cos(xmin+i*dx), xmin+i*dx  );
endfor 

path c;
c := a0 for i=1 upto M: --a[i] endfor;

draw c;

for i=-1 upto 1:
draw c shifted (0,i*pi*u) dashed evenly;
endfor;

draw (xstart*u,-pi/2*u)--(-18,-pi/2*u) dashed withdots scaled 0.5;
draw (0,-pi/2*u)--(xstop*u,-pi/2*u) dashed withdots scaled 0.5;
draw (xstart*u,pi/2*u)--(-9,pi/2*u) dashed withdots scaled 0.5;
draw (0,pi/2*u)--(xstop*u,pi/2*u) dashed withdots scaled 0.5;

draw (0,pi/2*u)--(-mm,pi/2*u);
draw (0,-pi/2*u)--(-mm,-pi/2*u);

label.lft( btex $\frac{\pi}{2}$ etex, (-mm,pi/2*u) );
label.lft( btex $-\frac{\pi}{2}$ etex, (-mm,-pi/2*u) );
label.lrt( btex $\mathrm{arctan}$ etex, a[80] );

clip currentpicture to 
( (xstart*u,ystart*u)--(xstop*u,ystart*u)
--(xstop*u,ystop*u)--(xstart*u,ystop*u)--cycle );

picture thirdpic;
thirdpic := currentpicture;
currentpicture := nullpicture;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pair a[];

xstart := -4;
xstop :=   4;
ystart :=-pi-0.2;
ystop := pi+0.8;

drawarrow (xstart*u,0)--(xstop*u,0);
drawarrow (0,ystart*u)--(0,ystop*u);

M := 100;
xmin := 0.05*pi;
xmax := 0.95*pi;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := u*( cos(xmin+i*dx)/sin(xmin+i*dx), xmin+i*dx  );
endfor 

path c;
c := a0 for i=1 upto M: --a[i] endfor;

draw c;

for i=-1 upto 0:
draw c shifted (0,i*pi*u) dashed evenly;
endfor;

draw (xstart*u,-pi*u)--(-18,-pi*u) dashed withdots scaled 0.5;
draw (0,-pi*u)--(xstop*u,-pi*u) dashed withdots scaled 0.5;
draw (xstart*u,pi*u)--(-9,pi*u) dashed withdots scaled 0.5;
draw (0,pi*u)--(xstop*u,pi*u) dashed withdots scaled 0.5;

draw (0,pi*u)--(-mm,pi*u);
draw (0,-pi*u)--(-mm,-pi*u);

label.lft( btex $\pi$ etex, (-mm,pi*u) );
label.lft( btex $-\pi$ etex, (-mm,-pi*u) );
label.urt( btex $\mathrm{arccot}$ etex, a[20] );


clip currentpicture to 
( (xstart*u,ystart*u)--(xstop*u,ystart*u)
--(xstop*u,ystop*u)--(xstart*u,ystop*u)--cycle );









draw firstpic shifted (-21u,0);
draw secondpic shifted (-16u,0);
draw thirdpic shifted (-9u,0);

endfig;
end