verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

def pi = 3.14159 enddef;

vardef exp( expr x ) = mexp(256)**x enddef; 
vardef cos( expr x ) = cosd( x*180/pi ) enddef; 
vardef sin( expr x ) = sind( x*180/pi ) enddef;

u:=0.5cm;
v := 1.3*u;

beginfig(1);

pair a[];
pair b[];

M := 200;
xmin :=-0.6;
xmax := 2;
dx := (xmax-xmin)/M;
for i=0 upto M:
t := xmin+i*dx;
P := (3*t)/(1+t**3);
Q := (3*(t**2))/(1+t**3);
a[i] := ( u*P, u*Q );
endfor 

draw a0 for i=1 upto M: ...a[i] endfor...(0,0) withpen pencircle scaled 0.6pt;

xmin :=-16;
xmax := -1.6;
dx := (xmax-xmin)/M;
for i=0 upto M:
t := xmin+i*dx;
P := (3*t)/(1+t**3);
Q := (3*(t**2))/(1+t**3);
a[i] := ( u*P, u*Q );
endfor 

draw (0,0)...a0 for i=1 upto M: ...a[i] endfor withpen pencircle scaled 0.6pt;

mark( (0,0) );

label.bot( btex Kartesisches Blatt etex, (0,-3u) );
label.bot( btex $\left( \frac{3t}{1+t^3}, \frac{3t^2}{1+t^3}\right)$ 
etex, (0,-3u-10) );

mark( (0,0) );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

M := 200;
xmin :=0;
xmax :=2*pi;
dx := (xmax-xmin)/M;
for i=0 upto M:
t := i*dx;
P := sin(t);
Q := cos(t);
a[i] := ( 9u+3.5*1.4u*Q/(1+P**2), u*3.5*1.4*Q*P/(1+P**2) );
endfor 

draw a0 for i=1 upto M: ...a[i] endfor withpen pencircle scaled 0.6pt;

label.bot( btex Lemniskate etex, (9u,-3u) );
label.bot( btex $\left( \frac{a\sqrt{2}\cos t}{1+\sin^2 t},
\frac{a\sqrt{2}\sin t\cos t}{1+\sin^2 t}\right)$  
etex, (9u,-3u-10) );

mark( (9u,0) );


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



M := 200;
xmin :=-1.5;
xmax :=1.5;
dx := (xmax-xmin)/M;
for i=0 upto M:
t := xmin+i*dx;
a[i] := ( 18u+1.6*u*(t**2-1), 1.6*u*(t**3-t) );
endfor 

draw a0 for i=1 upto M: ...a[i] endfor withpen pencircle scaled 0.6pt;

label.bot( btex Neilsche Parabel etex, (18u,-3u) );
label.bot( btex $\left( 1-t^2, 1-t^3\right)$  
etex, (18u,-3u-10) );

mark( (18u,0) );

endfig;
end