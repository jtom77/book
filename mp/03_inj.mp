verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
%\fontfamily{cmss}
etex

boxwidth := 12.5cm;
boxheight := 4cm;

u := 0.4cm;
v := 0.7u;
w :=.3cm;
offs := 0.3cm;
tics := 0.2cm;

beginfig(1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ahlength := 0.2cm;
ahangle := 25;

pair shift;
shift := (12u,0);
pair start[]; 
pair stop[];

for i=0 upto 4: 
start[i] := ( u*uniformdeviate(0.3), v*( uniformdeviate(0.6)+i ) );
stop[i] := ( 2u+u*uniformdeviate(0.3), v*( uniformdeviate(0.6)+i ) );
start[i] := start[i] shifted shift;
stop[i] := stop[i] shifted shift;
fill fullcircle scaled tics shifted start[i] withcolor white;
draw fullcircle scaled tics shifted start[i];
fill fullcircle scaled tics shifted stop[i] withcolor 0.8 white;
draw fullcircle scaled tics shifted stop[i];
endfor

drawarrow start0--stop4;
drawarrow start1--stop1;
drawarrow start2--stop0;
drawarrow start3--stop2;
drawarrow start4--stop3;


label.bot( btex bijektiv etex, (u,-7) shifted shift ); 


 
%label.rt( btex \fontfamily{cmss}{injektiv,} etex, (0,6v ) );
%label.rt( btex surjektiv etex, (0,6v-offs ) );


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

shift := (0,0);

for i=0 upto 4: 
start[i] := ( u*uniformdeviate(0.3), v*( uniformdeviate(0.6)+0.8*i ) );
start[i] := start[i] shifted shift;
fill fullcircle scaled tics shifted start[i] withcolor white;
draw fullcircle scaled tics shifted start[i];
endfor

for i=0 upto 6: 
stop[i] := (2u+ u*uniformdeviate(0.3), v*( uniformdeviate(0.6)+0.8*i ) );
stop[i] := stop[i] shifted (0,-0.5u);
stop[i] := stop[i] shifted shift;
fill fullcircle scaled tics shifted stop[i] withcolor 0.8 white;
draw fullcircle scaled tics shifted stop[i];
endfor

drawarrow start0--stop1;
drawarrow start1--stop2;
drawarrow start2--stop3;
drawarrow start3--stop4;
drawarrow start4--stop6;

 
%label.rt( btex injektiv, etex, (0,6v ) shifted shift );
%label.rt( btex nicht surjektiv etex, (0,6v-offs ) shifted shift);

label.bot( btex injektiv, etex, (u,-7) shifted shift );
label.bot( btex nicht surjektiv etex, (u,-17) shifted shift ); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

shift := (6u,0);

for i=0 upto 4: 
start[i] := ( u*uniformdeviate(0.3), v*( uniformdeviate(0.6)+i ) );
start[i] := start[i] shifted shift;
fill fullcircle scaled tics shifted start[i] withcolor white;
draw fullcircle scaled tics shifted start[i];
endfor

for i=0 upto 2: 
stop[i] := (2u+ u*uniformdeviate(0.3), v*( uniformdeviate(0.6)+1.2*i ) );
stop[i] := stop[i] shifted (0,u);
stop[i] := stop[i] shifted shift;
fill fullcircle scaled tics shifted stop[i] withcolor 0.8 white;
draw fullcircle scaled tics shifted stop[i];
endfor

drawarrow start0--stop1;
drawarrow start1--stop0;
drawarrow start2--stop1;
drawarrow start3--stop2;
drawarrow start4--stop2;

 
%label.rt( btex nicht injektiv, etex, (0,6v ) shifted shift);
%label.rt( btex surjektiv etex, (0,6v-offs ) shifted shift );


label.bot( btex surjektiv, etex, (u,-6) shifted shift );
label.bot( btex nicht injektiv etex, (u,-17) shifted shift ); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

shift := (18u,0);

for i=0 upto 4: 
start[i] := ( u*uniformdeviate(0.3), v*( uniformdeviate(0.6)+i ) );
start[i] := start[i] shifted shift;
fill fullcircle scaled tics shifted start[i] withcolor white;
draw fullcircle scaled tics shifted start[i];
endfor

for i=0 upto 4: 
stop[i] := (2u+ u*uniformdeviate(0.3), v*( uniformdeviate(0.6)+i ) );
stop[i] := stop[i] shifted shift;
fill fullcircle scaled tics shifted stop[i] withcolor 0.8 white;
draw fullcircle scaled tics shifted stop[i];
endfor

drawarrow start0--stop1;
drawarrow start1--stop4;
drawarrow start2--stop1;
drawarrow start3--stop3;
drawarrow start4--stop3;

label.bot( btex nicht injektiv, etex, (u,-7) shifted shift);
label.bot( btex nicht surjektiv etex, (u,-17) shifted shift); 


%label.rt( btex nicht injektiv, etex, (0,6v ) shifted shift);
%label.rt( btex nicht surjektiv etex, (0,6v-offs ) shifted shift);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


endfig;
end