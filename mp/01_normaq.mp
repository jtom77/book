verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;


u:=1.2cm;

vardef cos( expr x ) = 
cosd( x*180/3.14 ) 
enddef;

vardef sin( expr x ) =
sind( x*180/3.14 )
enddef;

vardef y_param( expr x ) =
sqrt( sqrt( 1-cos(x)**4 ) )
enddef;

vardef draw_axes( expr a ) =
%drawarrow (0,0) shifted a--(1.3u,0) shifted a;
%drawarrow (0,0) shifted a--(0,1.3u) shifted a;
draw a withpen pencircle scaled 3;
draw a withpen pencircle scaled 2 withcolor white;
%draw (u,0) shifted a withpen pencircle scaled 3;
%draw (u,0) shifted a withpen pencircle scaled 2 withcolor white;
%label.rt( btex $0$ etex, a );
%label.rt( btex $1$ etex, (u,0) shifted a );
enddef;

vardef f( expr x ) = (1-x**3)**(1/3) enddef;

beginfig(1);

path s[];

numeric x;
x := 0.3*sqrt(2);

s1 := (x,-x)*u--(x,x)*u--(-x,x)*u--(-x,-x)*u--cycle;
s2 := (u,-u)--(u,u)--(-u,u)--(-u,-u)--cycle;
s3 := (u,0)--(0,u)--(-u,0)--(0,-u)--cycle;
s4 := (2u,0)--(0,2u)--(-2u,0)--(0,-2u)--cycle;

fill s2 withcolor 0.9 white;
fill fullcircle scaled 1.7u withcolor white;
fill s1 withcolor 0.9 white;
numeric cscale;
cscale := 1.5*x*u;
fill fullcircle scaled cscale withcolor white;

%pickup pencircle scaled 2;
draw s1; 
draw s2;
draw fullcircle scaled 1.7u;
draw fullcircle scaled cscale;

mark( (0,0) );

%draw s3;
%draw s4;

endfig;
end