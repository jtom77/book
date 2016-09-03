verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex


u:=0.6cm;

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

beginfig(1);

pair a[];
pair b[];

numeric M, dx;
M := 100;
dx := (2*3.14)/M;

for i=0 upto M:
a[i] := (  cos(i*dx), y_param( i*dx ) )*u;
b[i] := ( xpart a[i], -ypart a[i] );
endfor

path s[];
pair shift;

shift := (0,0);
s1 := (-u,0)--(0,u)--(u,0)--(0,-u)--cycle;
s1 := s1 shifted shift;
draw s1;
draw_axes( shift );
label.bot( btex $\| z \|_1 = 1$ etex, shift shifted (0,-1.2u) );

shift := (5u,0);
s2 := fullcircle scaled 2u shifted shift;
draw_axes( shift );
draw s2;
label.bot( btex $\| z \|_2 = 1$ etex, shift shifted (0,-1.2u) );

shift := (10u,0);
s3 := a[0] for i=1 upto M: --a[i] endfor;
s4 := b[0] for i=1 upto M: --b[i] endfor;
draw s3 shifted shift;
draw s4 shifted shift;
draw_axes( shift );
label.bot( btex $\| z \|_4 = 1$ etex, shift shifted (0,-1.2u) );

shift := (15u,0);
s5 := (-u,-u)--(u,-u)--(u,u)--(-u,u)--cycle;
s5 := s5 shifted shift;
draw s5;
draw_axes( shift );
label.bot( btex $\| z \|_{\infty} = 1$ etex, shift shifted (0,-1.2u) );

%draw a[0] for i=1 upto M: --a[i] endfor;
%draw b[0] for i=1 upto M: --b[i] endfor;

draw_axes( (0,0) );

endfig;
end