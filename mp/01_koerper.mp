input mydefs;

verbatimtex
%&latex
\documentclass{article}
\begin{document}
%\footnotesize
etex

u:=0.65cm;

beginfig(1);

pair a[];

a0 := (0,0)*u; 
a1 := (1,0)*u;
a2 := (2,0)*u;
a3 := (3,0)*u;

a4 := (0,1)*u; 
a5 := (1,1)*u;
a6 := (2,1)*u;
a7 := (3,1)*u;

a8 := (0,2)*u; 
a9 := (1,2)*u;
a10 := (2,2)*u;
a11 := (3,2)*u;

a12 := (0,3)*u; 
a13 := (1,3)*u;
a14 := (2,3)*u;
a15 := (3,3)*u;

draw a0--a3--a15--a12--cycle;
draw a1--a13 withpen pensquare xscaled 2;
draw a8--a11 withpen pensquare yscaled 2;
draw a4--a7;
draw a2--a14;

for i=0 upto 15: a[i] := a[i] shifted (0.5u,0.5u); endfor

label( btex $\overline{1}$ etex, a0 );
label( btex $\overline{1}$ etex, a1 );
label( btex $\overline{0}$ etex, a2 );

label( btex $\overline{0}$ etex, a4 );
label( btex $\overline{0}$ etex, a5 );
label( btex $\overline{1}$ etex, a6 );

label( btex $\mathbf{+}$ etex, a8 );
label( btex $\overline{0}$ etex, a9 );
label( btex $\overline{1}$ etex, a10 );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=0 upto 15: a[i] := a[i] shifted (3.3u,-0.5u); endfor

draw a0--a3--a15--a12--cycle;
draw a1--a13 withpen pensquare xscaled 2;
draw a8--a11 withpen pensquare yscaled 2;
draw a4--a7;
draw a2--a14;

for i=0 upto 15: a[i] := a[i] shifted (0.5u,0.5u); endfor

label( btex $\overline{1}$ etex, a0 );
label( btex $\overline{0}$ etex, a1 );
label( btex $\overline{1}$ etex, a2 );

label( btex $\overline{0}$ etex, a4 );
label( btex $\overline{0}$ etex, a5 );
label( btex $\overline{0}$ etex, a6 );

label( btex $\mathbf{\cdot}$ etex, a8 );
label( btex $\overline{0}$ etex, a9 );
label( btex $\overline{1}$ etex, a10 );


endfig;
end
