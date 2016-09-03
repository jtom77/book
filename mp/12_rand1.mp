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

path f;
f := (point 1.5 of c){dir 110}..(point 4.2 of c){dir -80}--
(subpath (4.2,1.5) of c)--cycle;

fill f withcolor 0.9 white;
draw f;

draw c dashed evenly scaled 0.5;
draw e1 dashed evenly scaled 0.5;
draw e2 dashed evenly scaled 0.5;
draw e3 dashed evenly scaled 0.5;
draw d1 dashed evenly scaled 0.5;
draw d2 dashed evenly scaled 0.5;
draw d3 dashed evenly scaled 0.5;

mark( a );

label.top( btex $U$ etex, (point 0.33 of d3) + (0,2) ); 

picture pic;
pic := currentpicture;
currentpicture := nullpicture;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

u := 1.2cm;

f := (0,0.3u){dir -180}..(-0.2u,0.4u)..(0,-0.5u){dir 30}--cycle;

fill f withcolor 0.9 white;

draw (-u,-u)--(u,-u)--(u,u)--(-u,u)--cycle;
draw (0,-u)--(0,u);
draw (-u,0)--(u,0);

draw f;

label.top( btex $V$ etex, (-0.3u, -0.5u) );

draw (-u,-u)--(u,-u)--(u,u)--(-u,u)--cycle;
draw (0,-u)--(0,u);
draw (-u,0)--(u,0);

label.urt( btex $\mathbb{R}^k_-$ etex, (-u,-u) );
label.llft( btex $\mathbb{R}^k$ etex, (u-2,u-2) );

mark( (0,0) );

drawarrow (1.5u,0.5u)--(2.7u,0.5u);
label.top( btex $\alpha$ etex, 1/2[(1.5u,0.5u+1),(2.7u,0.5u+1)]);

draw pic shifted (2.9u,-0.85u);

endfig;
end