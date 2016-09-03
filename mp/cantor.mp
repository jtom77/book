verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

boxwidth := 12.5cm;
boxheight := 4cm;

u := 0.7cm;
v := u;
w :=.3cm;
offs := 0.3cm;
tics := 0.2cm;

beginfig(1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pair a[][];

for i=1 upto 5: 
for j=1 upto 5:
a[i][j] := (i*u,j*v);
endfor;
endfor

drawarrow a[1][1] shifted (offs,0)--a[2][1] shifted (-offs,0);
drawarrow a[3][1] shifted (offs,0)--a[4][1] shifted (-offs,0);
drawarrow a[2][1] shifted down--a[1][2] shifted up;
drawarrow a[4][1] shifted down--a[3][2] shifted up;
drawarrow a[2][3] shifted down--a[1][4] shifted up;
drawarrow a[4][3] shifted down--a[3][4] shifted up;
drawarrow a[2][1] shifted down--a[1][2] shifted up;

endfig;
end
