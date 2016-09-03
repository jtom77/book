verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

u:=1cm;

vardef mark( expr a ) = 
draw a withpen pencircle scaled 3;
%draw a withpen pencircle scaled 2 withcolor white;
enddef;

beginfig(1);

path c;
c := fullcircle scaled 2u;
pair a, aa; 
a := (3u,0); 
aa := (u/3,0);
pair upper, lower;
path l;
l := aa--(xpart aa, ypart aa+10u);
upper := l intersectionpoint c;
l := aa--(xpart aa, ypart aa-10u);
lower := l intersectionpoint c;

upper := upper rotatedabout ( (0,0), 30 );
lower := lower rotatedabout ( (0,0), 30 );
a := a rotatedabout ( (0,0), 30 );
aa := aa rotatedabout ( (0,0), 30 );

draw c;
draw (0,0)--upper--a--cycle;
draw upper--aa;
draw (0,0)--a;

mark( (0,0) );
mark( a );
mark( aa );
mark( upper );
%mark( lower );

label.lft( btex $0$ etex, (0,0) );
label.bot( btex $\frac{1}{\overline{z}}$ etex, aa );
label.top( btex $p$ etex, upper );
label.bot( btex $z$ etex, a );

endfig;
end