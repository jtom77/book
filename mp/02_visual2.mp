verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\usepackage{dsfont}
\begin{document}
\footnotesize
etex

input mydefs;

u := cm;

beginfig(1);

pair shift;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pair a[];

a[0] := (u,u);

shift := (1.5u,1.5u);

for i=1 upto 20:
a[i] := a[i-1];
a[i] := a[i-1] rotatedabout( (0,0), 30 );
a[i] := a[i] xscaled 0.9 yscaled 0.85;
endfor

fill (3u,0)--(1.5u,-1.5u)--(-1.5u,-1.5u)--(0,0)--cycle grau;

drawarrow (0,0)--(3u,0);
drawarrow (0,0)--(0,3u);
drawarrow (0,0)--(-0.5*3u,-0.5*3u);

for i=0 upto 20:
a[i] := a[i] shifted shift;
markempty ( (ypart a[i]-0.5*(xpart a[i]), 0.15*i*u-0.5*(xpart a[i]) ) ); 
endfor

for i=0 upto 17:
  draw (0,.15*i*u)--(-0.5mm,.15*i*u) thin;
  if( (i mod 5)=0 ):
    draw (0,.15*i*u)--(-mm,.15*i*u) thin;
    label.lft(decimal(i),(-mm,.15*i*u));
  fi;
  
endfor

label.lft( btex $a_0$ etex, 
(ypart a[0]-0.5*(xpart a[0])-1, -0.5*(xpart a[0])) );
label.lft( btex $\mathds{N}$ etex, (-2,3u-mm) );
label.lft( btex $\mathrm{Re}$ etex, (-0.5*3u-1,-0.5*3u+mm) );
label.top( btex $\mathrm{Im}$ etex, (3u-mm,mm) );
%label.lft( btex $0$ etex, (0,-1) );


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


endfig;
end
