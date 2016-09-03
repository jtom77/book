verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

u:=3cm;
v := 0.3*u;

def pi = 3.14159 enddef;

vardef cos( expr x ) = cosd( x*180/pi ) enddef; 
vardef sin( expr x ) = sind( x*180/pi ) enddef;

vardef draw_curve( expr n,m,r,s, scale )=
save a;
save p; save q;
pair a[];
path p;
path q;
p := fullcircle scaled scale;
for i=0 upto length(p):
a[i] := point i of p;
a[i] := a[i] xscaled (n*(2+sin(m*i))) yscaled (r*(2+cos(s*i)));
endfor;
q := a0 for i=1 upto length(p): ..a[i] endfor..cycle;
fill q withcolor 0.9 white;
draw q;
enddef;


vardef schachtel( expr A, C, n )=
save B; save D; save M; save i; save rand;
rand := uniformdeviate(3);
pair B,D;
B := (xpart C, ypart A);
D := (xpart A, ypart C);
draw A--B--C--D--cycle;
draw 1/2[A,B]--1/2[C,D];
draw 1/2[A,D]--1/2[B,C];
if( n > 0 ):
%rand := uniformdeviate( 4 );
if( rand < 1 ):
schachtel( A, 1/2[A,C], n-1 );
else: 
if( rand < 2):
schachtel( 1/2[A,C], C, n-1 );
else: 
schachtel( 1/2[A,D], 1/2[D,C], n-1 );
fi;
fi;
fi;
enddef;




beginfig(1);

labeloffset := 1pt;

draw_curve( 0.7,3,0.5,2, 1.3u );

pair C;
C := (u,0.9u);
schachtel( (-u,-1.1u), C, 6 );



endfig;
end