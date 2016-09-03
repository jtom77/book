verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
etex

input mydefs;

numeric pi;
pi := 3.14159;

vardef h( expr x ) = 72/( (0.1*x)**2-2.4*x+144 ) enddef;
vardef f( expr x ) = 120/( 1+h(x) )+10 enddef;
vardef g( expr x ) = -3.0/200*x*x + 3.0/20*x + 95 enddef;


u:=0.07cm;
v := u;

beginfig(1);

pair a[];
pair b[];

pickup pencircle scaled 0.2pt;



numeric M;
M := 100;
dx := 130/M;

for i=0 upto M:
a[i] := ( u*i*dx, v*f(i*dx) );
b[i] := ( u*i*dx, v*g(i*dx) );
endfor;


drawarrow (0,0)--(130u,0);
drawarrow (0,0)--(0,130v);


for i=20 step 20 until 120:
draw (i*u,mm)--(i*u,-mm);
draw (mm,i*v)--(-mm,i*v);
endfor;

draw a0 for i=1 upto M: --a[i] endfor;
draw b0 for i=1 upto M: --b[i] endfor cutafter ( (0,0)--(130u,0) );


label.bot( btex $20$ etex, (20*u,-mm) );
label.bot( btex $40$ etex, (40*u,-mm) );
label.bot( btex $60$ etex, (60*u,-mm) );
label.bot( btex $80$ etex, (80*u,-mm) );
label.bot( btex $100$ etex, (100*u,-mm) );
label.bot( btex $120$ etex, (120*u,-mm) );
label.bot( btex $x$ etex, (130*u,-mm) );

label.lft( btex $20$ etex, (-mm,20*v) );
label.lft( btex $40$ etex, (-mm,40*v) );
label.lft( btex $60$ etex, (-mm,60*v) );
label.lft( btex $80$ etex, (-mm,80*v) );
label.lft( btex $100$ etex, (-mm,100*v) );
label.lft( btex $120$ etex, (-mm,120*v) );
label.lft( btex $y$ etex, (-mm,130*v) );

label.urt( btex $C$ etex, (40u, v*g(40) ) );
label.urt( btex $K$ etex, (100u,v*f(100) ) );


endfig;
end