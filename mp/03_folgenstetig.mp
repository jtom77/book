verbatimtex
%&latex
  \documentclass{article}
  \begin{document}
  \footnotesize
  etex

  input mydefs;

path c;

vardef f( expr x ) = x**1.5 enddef;

u:=2.3cm;

beginfig(1);

  c := (0.1u,0.1u){dir 10}...(1.8u,u){dir -20};
  
  drawarrow (0,0)--(1.8u,0);
  drawarrow (0,0)--(0,1.4u);
  
  labx( btex $X$ etex, 1.8u);
  laby( btex $Y$ etex, 1.4u );

  pair pp;
  for i=1 upto 10:
    pp := (1.6-1/sqrt(i),0)*u;
    z[i] = c intersectionpoint (pp--(pp+(0,10u)));
  endfor;
  
  for i=1 upto 10:
    draw (x[i],0)--z[i]--(0,y[i]) verythin ;
    mark (x[i],0);
    mark (0,y[i]);
  endfor;

  labeloffset:=2mm;
  label.bot( btex $a_0$ etex, (x1,0));
  label.bot( btex $a_1$ etex, (x2,0));
  label.bot( btex $\cdots$ etex, (1/2[x2,x10],0));
  label.bot( btex $a$ etex, (x10,0));
  label.lft( btex $f(a)$ etex, (0,y10));
  label.lft( btex $f(a_0)$ etex,  (1,y1));
  label.lft( btex $f(a_1)$ etex,  (2,y2));
  label.lft( btex $\ldots$ etex, (0,.5[y2,y10]));

  label.urt(btex $f$ etex, point (length(c)-.1) of c);
  
  draw c thick;
  
endfig;
end