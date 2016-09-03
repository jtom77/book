verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
\footnotesize
etex

input mydefs;

vardef f(expr x)= x/(1+abs(x)) enddef;

u:=1.5cm;
v := 0.3*u;

beginfig(1);

pickup pencircle scaled 0.2pt;

path c;

c := (0,0){dir 120}..(-3u,2u){dir 180};

draw subpath(0.3,0.8) of c;
label.lft( btex $M$ etex, (point 0.8 of c) shifted (-1,0) );


m := 0.5;

s := 0.47;
t := 0.53;

pair v, n;

v := u*unitvector( direction m of c );
n := v rotated -90;

pair mid;
mid := point m of c;

pair l;
l := mid+0.6*n; 
path line;
line := (l-10*v)--(l+10*v);

pair g;
pair h;
g := ((point s of c)--((point s of c)+10*n)) intersectionpoint (line);
h := ((point t of c)--((point t of c)+10*n)) intersectionpoint (line);

pair q;
q:=l+0.6*v;

path d;
d := (subpath (s,t) of c)--h--g--cycle;
fill d withcolor 0.9 white;
draw d;


draw q--l dashed evenly;
drawarrow mid--q;

drawarrow mid--mid+n;

label.lft( btex $F(x)$ etex, q+(-1,-2) );
label.rt( btex $\eta(x)$ etex, mid+n+(1,-2) );

label( btex $\mathrm{d}S$ etex rotated (180+angle(v)), mid-0.1*n );
 
draw subpath (s,t) of c withpen pencircle scaled 0.8pt;

pair lab[];

lab1 := (point 0.48 of c)+0.3*n;
lab2 := lab1+(8,0);
draw lab1--lab2;


label.rt( btex $\langle F(x),\eta(x) \rangle \mathrm{d}S$ etex, lab2+(1,0) );


%for i=-5 step 2 until 5:
%drawarrow (-2.7u,0.02u*i){dir 0}..(3u-0.4u*abs(i),0.35*u*i);
%endfor;




endfig;
end