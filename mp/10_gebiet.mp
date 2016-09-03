verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

u:=0.7cm;
v := 0.3*u;

beginfig(1);

pair a[];

path p;

p := (2u,0){dir 100}...(0,2u){left}...(-2u,0){left}...(0.6u,-2u)...cycle;

fill p withcolor 0.9 white;
draw p;

draw (-1.2u,-1.7u)--(-u,-u)--(u,0)--(0.5u,u);
dot( ( -1.2u,-1.7u ) );
dot( (0.5u,u) );

label.bot( btex $x$ etex, (-1.2u,-1.7u) );
label.top( btex $y$ etex, (0.5u,u) );


path c, d, e;
c := (u,0){dir 160}...(-u,0){down}...cycle;
d := (u,0){dir 60}...(-u,0){dir -160}...cycle;
e := (u,0){dir 120}...(-u,0){down}...cycle;

fill c scaled 0.3 shifted (-1.6u,-0.5u) withcolor white;
fill d scaled 0.6 shifted (-0.3u,0.4u) withcolor white;
fill e scaled 0.5 shifted (0,-1.2u) withcolor white;
draw c scaled 0.3 shifted (-1.6u,-0.5u);
draw d scaled 0.6 shifted (-0.3u,0.4u);
draw e scaled 0.5 shifted (0,-1.2u);


endfig;
end