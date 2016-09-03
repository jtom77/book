verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex


u:=1.4cm;

vardef cos( expr x ) = 
cosd( x*180/3.14 ) 
enddef;

vardef sin( expr x ) =
sind( x*180/3.14 )
enddef;

vardef y_param( expr x ) =
(1-x**3)**(1/3)
enddef;


beginfig(1)



numeric h, j;
h := 1/(2**(1/4));
j := 1/sqrt(2);

path c;

c := (u,0){0,1}..{-1,1}(h*u,h*u)..{-1,0}(0,u)..{-1,-1}(-h*u,h*u)
..{0,-1}(-u,0)..{1,-1}(-h*u,-h*u)..{1,0}(0,-u)..{1,1}(h*u,-h*u)..cycle; 

fill unitsquare scaled 2u shifted (-u,-u) withcolor white;
fill c withcolor 0.9 white;
fill fullcircle scaled 2u withcolor white;
fill (u,0)--(0,u)--(-u,0)--(0,-u)--cycle withcolor 0.9 white;

draw c;
draw unitsquare scaled 2u shifted (-u,-u);
draw fullcircle scaled 2u;
draw (u,0)--(0,u)--(-u,0)--(0,-u)--cycle;

labeloffset := 1pt;
label.ulft( btex $2$ etex, (j*u,-j*u) );
label.ulft( btex $1$ etex, (0.5u,-0.5u) );
label.ulft( btex $\infty$ etex, (u,-u) );
label.ulft( btex $4$ etex, (h*u,-h*u) );

endfig;
end