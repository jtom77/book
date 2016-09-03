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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


M := 200;
pair b[];
b0 := (0,-3.5u);
for i=1 upto M:
b[i] := b[i-1] scaled 0.98;
b[i] := b[i] rotatedabout( (0,0), 20 );
endfor;

draw b0 for i=1 upto M: ..b[i] endfor;

mark( (0,0) );


label( btex Spirale etex, (0,-4u) );
label( btex $r(t)e^{it}$ 
etex, (0,-4u-10) );


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


M := 100;
xmin :=0;
xmax := 2*pi;
dx := (xmax-xmin)/M;
for i=0 upto M:
P := 2*sin( i*dx );
Q := 2*sin( 2*i*dx );
R := 2*cos( i*dx );
a[i] := ( 9u+u*P*Q, u*R*Q );
endfor 

draw a0 for i=1 upto M: ...a[i] endfor;


label( btex Kleeblatt etex, (9u,-4u) );
label( btex $(\sin t\sin 2t, \cos t \sin 2t)$ 
etex, (9u,-4u-10) );



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


M := 600;


xmin :=0;
xmax :=20*pi.;
dx := (xmax-xmin)/M;
for i=0 upto M:
t := xmin+i*dx;
P := exp( cos(t) );
Q := -2*cos(4*t);
R := sin( t/12 );
S := R**5;
Rho := P+Q+S;
a[i] := ( -u*Rho*sin(i*dx)+18u, u*Rho*cos(i*dx)-0.4u );
endfor; 

draw a0 for i=1 upto M: ...a[i] endfor withpen pencircle scaled 0.6pt;


label( btex Schmetterlingskurve etex, (18u,-4u) );
label( btex $r=\exp(\cos\vartheta)-2\cos 4\vartheta +
\sin\frac{\vartheta}{12} $ 
etex, (18u,-4u-10) );




endfig;
end