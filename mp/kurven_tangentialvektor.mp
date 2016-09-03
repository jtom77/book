verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;



def pi = 3.14159 enddef;


u:=2.3cm;
v := 1.3*u;

beginfig(1);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


path c;

c := (0,0){dir 60}...(2u,u){dir -10};

draw subpath( 0.1,1 ) of c;

pair t;
t := unitvector( direction (0.4) of c );

pair p;
p := point 0.4 of c;

drawarrow p--p+u*t;

mark( p );

label.bot( btex $\gamma(t)$ etex, p+(3,-1) );
label.top( btex $\dot{\gamma}(t)$ etex, p+u*t );

draw (0,0) withpen pencircle scaled 0.1pt withcolor white;


endfig;
end