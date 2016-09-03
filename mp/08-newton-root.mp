input mydefs;

beginfig(1);
  
  paper((-1,-2.2)--(4,6));  
  v := .6u;

  achsen;
  

  vardef f(expr x) = (x*x)-1.5 enddef;
  vardef df(expr x) = 2*x enddef;

  draw graph("f(x)",links,rechts) thick;

  
  x0 = .3;
  y0 = f(x0);
  for i=0 upto 4:
    x[i+1] = x[i] - f(x[i])/df(x[i]);
    y[i+1] = f(x[i+1]);
  endfor;

  draw (x0*u,0)--(x0*u,y0*v)--(x1*u,0)
    --(x1*u,y1*v)--(x2*u,0);

  label.top(btex $x_0$ etex, (x0*u,0));
  label.lrt(btex $x_1$ etex, (x1*u,0));
  label.bot(btex $x_2$ etex, (x2*u,0));

  z6 = (sqrt(1.5)*u,0);
  mark z6;
  label.ulft(btex $\xi$ etex, z6);

  labelxy;

  clipit;

endfig;
end
