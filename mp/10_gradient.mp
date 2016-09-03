verbatimtex
%&latex
\documentclass{article}
\begin{document}
\footnotesize
etex

input mydefs;

u:=1cm;
v := 0.2*u;

beginfig(1);

pair a[];

path p;


p := fullcircle scaled 0.8u;

dx := length(p)/10;

for i=0 upto 10:
a[i] := point dx*i of p;
endfor;

for i=1 step 2 until 9:
a[i] := a[i] scaled 0.6;
a[i+1] := a[i+1] shifted (0.1*(sind(15*i),0.1*cosd(5*i))*u);
endfor;

for i=0 upto 10: 
a[i] := a[i] rotatedabout( (0,0), 50*sind(20*i) );
endfor;

path c;
c := a0{up}..a1..a2..a3..a4..a5..a6..a7..a8..a9..cycle{up};

draw c; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

p := fullcircle scaled 2u;

dx := length(p)/10;

for i=0 upto 10:
a[i] := point dx*i of p;
endfor;

for i=1 step 2 until 9:
a[i] := a[i] scaled 0.6;
a[i+1] := a[i+1] shifted (0.5*(sind(3*i),0.3*cosd(5*i))*u);
endfor;

for i=0 upto 10: 
a[i] := a[i] rotatedabout( (0,0), 50*sind(20*i) );
endfor;

path c;
c := a0{up}..a1..a2..a3..a4..a5..a6..a7..a8..a9..cycle{up};

draw c; 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%


p := fullcircle scaled 3.2u;

for i=0 upto 10:
a[i] := point dx*i of p;
endfor;

for i=1 step 2 until 9:
a[i] := a[i] scaled 0.6;
a[i+1] := a[i+1] shifted (0.5*(sind(12*i),0.7*cosd(6*i))*u);
endfor;

for i=0 upto 10: 
a[i] := a[i] rotatedabout( (0,0), 50*sind(20*i) );
endfor;

c := a0{up}..a1..a2..a3..a4..a5..a6..a7..a8..a9..a0{up};

draw subpath (0,1.34) of c;
draw subpath (1.6,10) of c; 

dot( (0,0) );


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


numeric t[];
numeric l[];

t1 := 0.15; 
t2 := 2.9;
t3 := 5.5;
t4 := 7.8;

l1 := 0.7u;
l2 := u;
l3 := 0.7u;
l4 := 0.5u;

pair A, v;

for i=1 upto 4:
A := point t[i] of c;
v := unitvector( direction t[i] of c ) rotated -90;
drawarrow A--(A+l[i]*v);
endfor; 

mark( point t1 of c );
label.lft( btex $a$ etex, (point t1 of c)-(1,0) );


pair lab[];
lab1 := point 1.4 of c;
lab2 := lab1 shifted (0.4u,0.2u);
%%%%%draw lab1--lab2;

label.urt( btex $f(x)=c$ etex, lab1-(5,1) );
label( btex $-\mathrm{grad}\,f(a)$ etex, (2u,0.7u) );



endfig;
end