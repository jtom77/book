#verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

vardef f( expr x ) = 2.3**x-x**1.5-0.7 enddef;

u:=1.7cm;
v:=0.5*u;

beginfig(1);

path c, d, e, f, g;
c := (0.4u,0)..(0.2u,0.5u)..(0,0.4u)..(-0.2u,0.4u)..(-0.5u,0)..
(-0.3u,-0.2u)..(0,-0.6u)..(0.3u,-0.3u)..cycle;


d := (0.6u,0)..(0.5u,0.3u)..(0,0.6u)..(-0.4u,0.2u)..(-0.6u,0)..
(-0.3u,-0.3u)..(-0.2u,-0.6u)..(0.1u,-0.2u)..cycle;

e := ( point 7.2 of d )..(0.3v,0.3v)..(0,0.6v)..(-0.5v,0.1v)..(-0.6v,0)..
(-0.2v,-0.3v)..(0,-0.6v)..( point 6.7 of d );
e := e shifted (2u,0);

d := d shifted (2u,0);


fill buildcycle (e,d) withcolor 0.8 white;
draw e;
draw d;

f := fullcircle scaled 0.75u shifted (2u,0);

draw subpath ( 0,6 ) of f cutafter d;
f := f yscaled -1;
draw subpath ( 0,1 ) of f cutafter d;

g := fullcircle scaled 0.5u;
g := g shifted (0.2u,-1);

pair inter[];

inter1 := g intersectiontimes c;
inter2 := (subpath( 4,8 ) of g) intersectiontimes c;

fill (subpath( xpart inter1, xpart inter2 + 4 ) of g)
--(subpath (ypart inter2,8) of c)
--(subpath (0,ypart inter1) of c)--cycle withcolor 0.8 white;

draw (subpath( xpart inter1, xpart inter2 + 4 ) of g);

 
draw c;


mark( (0.2u,0) );
mark( (2u,0) );

label.bot( btex $a$ etex, (0.2u,-1) );
labeloffset := 1pt;
label.top( btex $f\!(\!a\!)$ etex, (2u,1) ); 

pair lab;
lab := (2u,0) shifted (-0.5u,0.3u);
draw (2u,0) shifted (-14,7)--lab;
label.lft( btex $U_\varepsilon( f(a) )$ etex, lab );

lab :=  (2u,0) shifted (-0.5u,-0.3u);
draw (2u,0) shifted (-6,-3)--lab;
label.top( btex $f(U_\delta(a))$ etex, (1.3u,-0.5u) );

lab := (0,0) shifted (-0.5u,0.3u);
draw (0.2u,0) shifted (-6,3)--lab;
label.ulft( btex $U_\delta(a)$ etex, lab );

label( btex $X$ etex, (0,-22) );
label( btex $Y$ etex, (1.9u-1,-25) );

label.top( btex $f$ etex, (u,0.6u+mm) );

drawarrow (0,0.3u){dir 30}..{dir -30}(2.2u,0.4u);


endfig;
end