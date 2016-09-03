verbatimtex
%&latex
\documentclass{article}
\usepackage{amssymb}
\begin{document}
etex

input mydefs;

pickup pencircle scaled 0.2pt;

vardef proj( expr x, y, z )=
(y-0.4*x,z-0.3*x-0.2*y) enddef;


vardef f( expr x ) = 
if x<=60:
x/60 
else:
if x<=180:
1
else:
if x<=240:
1-(x-180)/60
else:
0
fi
fi
fi
enddef; 

vardef g( expr x ) = 
if x<=60: 1 
else:
if x<=120:
1-(x-60)/60
else:
if x<=240:
0
else:
if x<=300:
(x-240)/60
else: 1
fi
fi
fi
fi
enddef; 


vardef h( expr x ) = 
if x<=120: 0
else:
if x<=180:
(x-120)/60
else:
if x<=300:
1
else:
1-(x-300)/60
fi
fi
fi
enddef; 





u:=3.4cm;
v := 0.3*u;

beginfig(1);

pair a, b;

color col;

M := 100;
xmin := 0;
xmax := 360;
dx := (xmax-xmin)/M;

a := (u,0);

numeric r;
for i=0 upto 360:
b := a;
b := b rotatedabout ((0,0),1);
r := 180+angle(xpart a, ypart a);
fill (0,0)--a--b--cycle withcolor (g(r),f(r), h(r));
a := b;
endfor







endfig;
end