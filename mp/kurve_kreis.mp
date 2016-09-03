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

u:=0.8cm;
v := 1.3*u;

beginfig(1);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


drawarrow fullcircle scaled 2u;
  
path c;

c := fullcircle scaled 2u shifted (2.5u,0);

draw c;

drawarrow subpath(1,0) of c;

endfig;
end