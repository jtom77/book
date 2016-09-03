verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

u:=0.6cm;



def pi = 3.14159 enddef;


v := 0.3*u;

beginfig(1);

path c;

path d[];
path e[];

d1 := (0.2u,0.5u){dir 70}..(4.8u,3.7u){dir 0};
d2 := (0.9u,0.1u){dir 60}..(5.5u,2.8u){dir -10};
d3 := (2u,0.2u){dir 50}..(5.1u,1.8u){dir 10};

e1 := (0.2u,1.8u){dir 20}..(3.0u,0.3u){dir -80};
e2 := (1.2u,3.1u){dir 10}..(4.0u,0.8u){dir -80};
e3 := (2.7u,3.7u){dir 20}..(5u,1.6u){dir -80};

draw d1; draw d2; draw d3;
draw e1; draw e2; draw e3;

path c;

c := (point 0 of d1)..(point 0 of d2)..(point 0 of d3)
..(point 1 of e1)..(point 1 of e2)..(point 1 of e3)
..(point 1 of d3)..(point 1 of d2)..(point 1 of d1)
..(point 0 of e3)..(point 0 of e2)..(point 0 of e1)..cycle;

draw c;


pair tang[];
pair a;


t := xpart( c intersectiontimes e2 );
a := point 3.0 of c;
tang1 := unitvector(direction 3.0 of c);
tang2 := unitvector(direction 1.0 of e1);


l := 1.3*u;

fill (a+l*tang1)
--(a+l*tang1-l*tang2)
--(a-l*tang1-l*tang2)
--(a-l*tang1)--cycle withcolor 0.9 white;

draw (a-l*tang1)--(a+l*tang1);   

pair lab[];

lab1 := a-0.8*l*tang1;
lab2 := lab1 shifted (-u,-0.6u);
draw lab1--lab2 withpen pencircle scaled 0.2pt;

label.lft( btex $T_a \partial M$ etex, lab2-(1,0));

lab1 := a-0.9*l*tang1+0.9*l*tang2;
lab2 := lab1 shifted (-0.3u,-0.6u);
draw lab1--lab2 withpen pencircle scaled 0.2pt;
label.bot( btex $T^+_a \partial M$ etex, lab2-(0,1));

draw (a+l*tang1+l*tang2)
--(a+l*tang1-l*tang2)
--(a-l*tang1-l*tang2)
--(a-l*tang1+l*tang2)--cycle;

drawarrow a--a+0.7*l*tang1;
drawarrow a--a+0.7*l*tang2;

draw c dashed evenly scaled 0.5;
draw e1 dashed evenly scaled 0.5;
draw e2 dashed evenly scaled 0.5;
draw e3 dashed evenly scaled 0.5;
draw d1 dashed evenly scaled 0.5;
draw d2 dashed evenly scaled 0.5;
draw d3 dashed evenly scaled 0.5;

mark( a );

%label( btex $T_aM$ etex, a-0.45*l*tang1+0.65*l*tang2 );
%label.llft( btex $a$ etex, a-(0,2) );

endfig;
end