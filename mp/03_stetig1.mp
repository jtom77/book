verbatimtex
%&latex
  \documentclass{article}
  \begin{document}
  \footnotesize
  etex

  input mydefs;

vardef f( expr x ) = 2.3**x-x**1.5-0.7 enddef;

u:=1.7cm;

beginfig(1);

  M := 100;
  xmax := 1.7; xmin := 0.1;
  dx := (xmax-xmin)/M;
  pair a[];

  for i=0 upto M:
    a[i] := (xmin+i*dx, f(xmin+i*dx))*u;
  endfor;

  l := 0.7;
  m := 1.0;
  n := 1.3;

  path c;
  mid := f(m);
  w := 0.2;

  draw (-mm,(mid+w)*u)--(1.8,mid+w)*u dashed evenly;
  draw (-mm,(mid-w)*u)--(1.8,mid-w)*u dashed evenly;


  w := 0.3;
  draw (u*(m-w),-mm)--(m-w,1.3)*u dashed evenly;
  draw (u*(m+w),-mm)--(m+w,1.3)*u dashed evenly;

  c := (m-w,mid-0.2)*u--(m+w,mid-0.2)*u--(m+w,mid+0.2)*u--(m-w,mid+0.2)*u--cycle;
  fill c withcolor 0.9 white;
  draw c;

%label.bot( btex $\lbrace$ etex rotated 90 xscaled 2.1, ((m-0.5*w)*u,-mm) );
%label.bot( btex $\frac{\varepsilon}{2}$ etex, ((m-0.5*w)*u,-3mm) );

%label.lft( btex $\lbrace$ etex yscaled 1.8, (-mm,u*(mid+0.1)) );
%label.lft( btex $\frac{\delta}{2}$ etex, (-3mm,u*(mid+0.1)) );


  drawarrow (0,0)--(1.8u,0);
  drawarrow (0,0)--(0,1.3u);

  draw a[0] for i=1 upto M: --a[i] endfor withpen pencircle scaled 1pt;

  draw (u,-mm)--(m,f(m))*u;
  draw (-mm,f(m)*u)--(m,f(m))*u;

  mark( (m,f(m))*u );

  label( btex $a$ etex, (m*u,-mm-5) );
  label.bot( btex $a-\delta$ etex, ((m-w)*u,-mm) );
  label.bot( btex $a+\delta$ etex, ((m+w)*u,-mm) );
  label.lft( btex $f(a)-\varepsilon$ etex, (-mm,u*(mid-0.2)) );
  label.lft( btex $f(a)+\varepsilon$ etex, (-mm,u*(mid+0.2)) );
  label.lft( btex $f(a)$ etex, (-mm,u*mid) );
  label.bot( btex $x$ etex, (1.8u-mm,-mm) );
  label.lft( btex $f(x)$ etex, (-mm,1.3u-mm) );



endfig;
end