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
vardef f( expr A, expr B ) = (A*B, mexp(B) ) enddef;

u:=4.6cm;
v := 1.3*u;

beginfig(1);

pair a[];
pair b[];

M := 100;


xmin :=0;
xmax :=2*pi;
dx := (xmax-xmin)/M;
for i=0 upto M:
a[i] := f( ( u*sin(i*dx), 0.4*u*cos(i*dx)) );
endfor 

draw a0 for i=1 upto M: --a[i] endfor withpen pencircle scaled 0.6pt;


endfig;
end