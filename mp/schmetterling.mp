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

u:=1.6cm;
v := 1.3*u;

beginfig(1);

pair a[];
pair b[];

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
a[i] := ( -u*Rho*sin(i*dx), u*Rho*cos(i*dx) );
endfor 

draw a0 for i=1 upto M: ...a[i] endfor withpen pencircle scaled 0.6pt;


endfig;
end