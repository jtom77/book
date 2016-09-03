verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

vardef f(expr x) = 1/(0.1+(x+1)**2) enddef;
vardef g(expr x) = 0.5*(x**1.8)+0.1 enddef;
vardef h(expr x) = 1.6*(x**2)-0.1 enddef;

u:=2.6cm;
v := 0.3*u;

beginfig(1);

pickup pencircle scaled 0.2pt;

path c;
path d;

draw (0,0)--(u,0)--(u,u)--(0,u)--cycle withpen pencircle scaled 0.6pt;
d := (0,0)--(u,u); 
label.bot( btex $a$ etex, (1,0) );
label.bot( btex $b$ etex, (u,0) );
label.lft( btex $a$ etex, (0,1) );
label.lft( btex $b$ etex, (0,u) );


pair A,B,C;
numeric x;

pair a[];
M := 100;
xmin := 0; xmax := 1; dx := (xmax-xmin)/M;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=0 upto M:
a[i] := (xmin+i*dx, f(xmin+i*dx) )*u;
endfor;

c := a0 for i=1 upto M: --a[i] endfor;

draw c withpen pencircle scaled 1pt;
draw d;

x := 0.1;

for i=0 upto 10:
A := (x,x)*u;
B := (x,f(x))*u;
C := (f(x),f(x))*u;
draw A--B--C;
if( i<2 ):
drawarrow A--0.7[A,B];
drawarrow B--0.7[B,C];
fi;
x := f(x);
endfor;

label.bot( btex Kontraktion mit $f'<0$ etex, (0.5u,-9) ); 

picture first;
first := currentpicture;
currentpicture := nullpicture;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

draw (0,0)--(u,0)--(u,u)--(0,u)--cycle withpen pencircle scaled 0.6pt;
label.bot( btex $a$ etex, (1,0) );
label.bot( btex $b$ etex, (u,0) );
label.lft( btex $a$ etex, (0,1) );
label.lft( btex $b$ etex, (0,u) );

draw d;

for i=0 upto M:
a[i] := (xmin+i*dx, g(xmin+i*dx) )*u;
endfor;

c := a0 for i=1 upto M: --a[i] endfor;

draw c withpen pencircle scaled 1pt;
draw d;

x := 0.95;

for i=0 upto 10:
A := (x,x)*u;
B := (x,g(x))*u;
C := (g(x),g(x))*u;
draw A--B--C;
if( i<2 ):
drawarrow A--0.7[A,B];
drawarrow B--0.7[B,C];
fi;
x := g(x);
endfor;

label.bot( btex Kontraktion mit $f'>0$ etex, (0.5u,-9) ); 

picture sec;
sec := currentpicture;
currentpicture := nullpicture;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

draw (0,0)--(u,0)--(u,u)--(0,u)--cycle withpen pencircle scaled 0.6pt;
label.bot( btex $a$ etex, (1,0) );
label.bot( btex $b$ etex, (u,0) );
label.lft( btex $a$ etex, (0,1) );
label.lft( btex $b$ etex, (0,u) );
draw d;

for i=0 upto M:
a[i] := (xmin+i*dx, h(xmin+i*dx) )*u;
endfor;

c := a0 for i=1 upto M: --a[i] endfor;

draw c cutbefore ((0,0)--(u,0)) cutafter 
((0,u)--(u,u)) withpen pencircle scaled 1pt;
draw d;

x := 0.5;

for i=0 upto 1:
A := (x,x)*u;
B := (x,h(x))*u;
C := (h(x),h(x))*u;
draw A--B--C;
if( i<2 ):
drawarrow A--0.7[A,B];
drawarrow B--0.7[B,C];
fi;
x := h(x);
endfor;

label.bot( btex \textit{keine} Kontraktion etex, (0.5u,-9) ); 

draw first shifted (-3u,0);
draw sec shifted (-1.5u,0);


endfig;
end