input mydefs;

verbatimtex
%&latex
\documentclass{article}
\begin{document}
%\footnotesize
etex

u:=0.6cm;

vardef schraeg_rechts( expr a ) = 
a shifted (0,-0.9u) rotatedabout( a, 30 )
enddef;

vardef schraeg_links( expr a ) =
a shifted (0,-0.9u) rotatedabout( a, -30 ) 
enddef;

beginfig(1);

pair c[][];

c[0][0] := (0,0);
c[1][0] := schraeg_links( c[0][0] );
c[1][1] := schraeg_rechts( c[0][0] );

c[2][0] := schraeg_links( c[1][0] );
c[2][1] := schraeg_rechts( c[1][0] );
c[2][2] := schraeg_rechts( c[1][1] );

c[3][0] := schraeg_links( c[2][0] );
c[3][1] := schraeg_rechts( c[2][0] );
c[3][2] := schraeg_rechts( c[2][1] );
c[3][3] := schraeg_rechts( c[2][2] );

c[4][0] := schraeg_links( c[3][0] );
c[4][1] := schraeg_rechts( c[3][0] );
c[4][2] := schraeg_rechts( c[3][1] );
c[4][3] := schraeg_rechts( c[3][2] );
c[4][4] := schraeg_rechts( c[3][3] );

c[5][0] := schraeg_links( c[4][0] );
c[5][1] := schraeg_rechts( c[4][0] );
c[5][2] := schraeg_rechts( c[4][1] );
c[5][3] := schraeg_rechts( c[4][2] );
c[5][4] := schraeg_rechts( c[4][3] );
c[5][5] := schraeg_rechts( c[4][4] );

c[6][0] := schraeg_links(  c[5][0] );
c[6][1] := schraeg_rechts( c[5][0] );
c[6][2] := schraeg_rechts( c[5][1] );
c[6][3] := schraeg_rechts( c[5][2] );
c[6][4] := schraeg_rechts( c[5][3] );
c[6][5] := schraeg_rechts( c[5][4] );
c[6][6] := schraeg_rechts( c[5][5] );


label( btex $1$ etex, c[0][0] );
label( btex $1$ etex, c[1][0] );
label( btex $1$ etex, c[1][1] );

label( btex $1$ etex, c[2][0] );
label( btex $2$ etex, c[2][1] );
label( btex $1$ etex, c[2][2] );

label( btex $1$ etex, c[3][0] );
label( btex $3$ etex, c[3][1] );
label( btex $3$ etex, c[3][2] );
label( btex $1$ etex, c[3][3] );

label( btex $1$ etex, c[4][0] );
label( btex $4$ etex, c[4][1] );
label( btex $6$ etex, c[4][2] );
label( btex $4$ etex, c[4][3] );
label( btex $1$ etex, c[4][4] );

label( btex $1$ etex, c[5][0] );
label( btex $5$ etex, c[5][1] );
label( btex $10$ etex, c[5][2] );
label( btex $10$ etex, c[5][3] );
label( btex $5$ etex, c[5][4] );
label( btex $1$ etex, c[5][5] );

label( btex $1$ etex, c[6][0] );
label( btex $6$ etex, c[6][1] );
label( btex $15$ etex, c[6][2] );
label( btex $20$ etex, c[6][3] );
label( btex $15$ etex, c[6][4] );
label( btex $6$ etex, c[6][5] );
label( btex $1$ etex, c[6][6] );

label( btex $n=0$ etex, (4.5u, ypart c[0][0]));
label( btex $n=1$ etex, (4.5u, ypart c[1][0]));
label( btex $n=2$ etex, (4.5u, ypart c[2][0]));
label( btex $n=3$ etex, (4.5u, ypart c[3][0]));
label( btex $n=4$ etex, (4.5u, ypart c[4][0]));
label( btex $n=5$ etex, (4.5u, ypart c[5][0]));
label( btex $n=6$ etex, (4.5u, ypart c[6][0]));

draw schraeg_links( c[6][0] ) shifted (0,0.2u)
--schraeg_rechts( c[6][6] ) shifted (0,0.2u)
dashed withdots withpen pencircle scaled 1;

draw (0,u) withpen pencircle scaled 0.1 withcolor white;

endfig;
end