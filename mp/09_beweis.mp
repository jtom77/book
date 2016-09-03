verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

vardef draw_box( expr mid, w, h, s )=
draw (mid-w,-h)--(mid+w,-h)--(mid+w,h)
--(mid-w,h)--cycle shifted (0,s);
dot( (mid,0) );
enddef;


u:=0.7cm;
v := 0.3*u;

beginfig(1);

labeloffset := 1pt;

draw_box( 2.5u, 2.5u, 1.5u, 0 );

numeric m[];
numeric w[];
numeric h[];
numeric s[];

s1 := 0.1u;
s2 := -0.08u;
s3 := -0.05u;
s4 := 0.05u;
s5 := -0.15u;
s6 := 0;
s7 := 0.07u; 

m1 := 0.5u;
m2 := 1.2u;
m3 := 1.7u;
m4 := 2.5u;
m5 := 3.2u;
m6 := 3.9u;
m7 := 4.5u;

w1 := m1;
w2 := 0.4u;
w3 := 0.4u;
w4 := 0.5u;
w5 := 0.4u;
w6 := 0.5u;
w7 := 5u-m7;

h1 := 0.3u;
h2 := 0.5u;
h3 := 0.25u;
h4 := 0.5u;
h5 := 0.4u;
h6 := 0.3u;
h7 := 0.35u;

numeric width;
width := 10u;

for i=1 upto 7:
if( abs( abs(h[i])-abs(s[i])) < width ):
width := abs(abs(h[i])-abs(s[i])); 
fi
endfor;

path d;
d := (0,-width)--(5u,-width)--(5u,width)--(0,width)--cycle;
%fill d withcolor 0.8 white;

%draw d dashed withdots scaled 0.5;

for i=1 upto 7:
draw_box( m[i], w[i], h[i], s[i] );
endfor; 

label.lft( btex $Y$ etex, (0,1.4u) );
label.bot( btex $X$ etex, (4.9u,-1.5u) );

picture thepicture;
thepicture := currentpicture;

draw (m1,-1.5u)--(m1,-1.5u-mm);
draw (m2,-1.5u)--(m2,-1.5u-mm);
draw (0,0)--(-mm,0);

label.bot( btex $x_1$ etex, (m1,-1.5u-mm) );
label.bot( btex $x_2$ etex, (m2,-1.5u-mm) );
label.lft( btex $y$ etex, (-mm,0) );


picture first;
first := currentpicture;
currentpicture := nullpicture;

fill d withcolor 0.8 white;
draw d withpen pencircle scaled 0.5pt dashed withdots scaled 0.5;
draw thepicture;
label( btex $\lbrace$ etex yscaled 1.2 xscaled 1.2, (-1.5mm,0) );
label.lft( btex $W(y)$ etex, (-2.5mm,s4) );


picture sec;
sec := currentpicture;
currentpicture := nullpicture;

%draw first shifted (-7u,0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


draw_box( 2.5u, 2.5u, 1.5u, 0 );
draw_box( m4, w4, h4, s4 );

path e;

e := (1.8u,0){dir -85}..(2.5u,-0.7u){dir 20}..(3.2u,-0.2u){dir 80}
..(3u,u)..(2.5u,0.6u)..(1.9u,0.7u)..cycle;

e := e scaled 1.1 shifted (-0.3u,0);
draw e;

draw (m4-w4,-h4+s4)--(m4-w4,-1.5u) withpen pencircle scaled 0.5pt dashed withdots scaled 0.5;
draw (m4+w4,-h4+s4)--(m4+w4,-1.5u) withpen pencircle scaled 0.5pt dashed withdots scaled 0.5;
draw (m4-w4,-h4+s4)--(0,-h4+s4) withpen pencircle scaled 0.5pt dashed withdots scaled 0.5;
draw (m4+w4,h4+s4)--(0,h4+s4) withpen pencircle scaled 0.5pt dashed withdots scaled 0.5;

label( btex $\rbrace$ etex rotated -90 xscaled 2.8 yscaled 2, (m4,-1.5u-2mm) );
label( btex $\lbrace$ etex yscaled 2.7 xscaled 2, (-2mm,s4) );
label.bot( btex $V_{\lambda(x,y)}$ etex, (m4,-1.5u-3mm) );
label.lft( btex $W_{\lambda(x,y)}$ etex, (-3mm,s4) );

label.lft( btex $Y$ etex, (0,1.4u) );
label.bot( btex $X$ etex, (4.9u,-1.5u) );

draw first shifted (6.0u,0);
draw sec shifted (12.5u,0);



endfig;
end