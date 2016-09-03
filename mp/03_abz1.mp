verbatimtex
%&latex
  \documentclass{article}
  \begin{document}
  \footnotesize
  etex


  input mydefs;
  ahlength := 1.5*mm;
linejoin:=mitered;


vardef arr( expr A, B ) =
  drawarrow 1/3[A,B]--2/3[A,B] thin;
enddef;

vardef ddarr( expr x ) = 
  arr( x, x shifted(-u,-0.7*u) );
enddef;

vardef duarr( expr x ) =
  arr( x, x shifted (u,0.7*u) );
enddef;

vardef harr( expr x ) =
  arr( x shifted(10,0), x shifted (u-10,0) );
enddef;

vardef varr( expr x ) =
  arr( x, x shifted (0,-0.7u) );
enddef;

u:=1.3cm;
beginfig(1);

  pair a[][];

  for i=0 upto 5:
    for j=0 upto 5:
      a[i][j] := (i,-0.7*j)*u;
    endfor;
  endfor;

  harr( a[0][0] );
  ddarr( a[1][0] );
  varr( a[0][1] );
  duarr( a[0][2] );
  duarr( a[1][1] );
  harr(  a[2][0] );
  ddarr( a[3][0] );
  ddarr( a[2][1] );
  ddarr( a[1][2] );
  varr(  a[0][3] );
  duarr( a[0][4] );
  duarr( a[1][3] );
  duarr( a[2][2] );
  duarr( a[3][1] );

  label( btex $(x_1,y_1)$ etex, a[0][0] );
  label( btex $(x_2,y_1)$ etex, a[1][0] );
  label( btex $(x_3,y_1)$ etex, a[2][0] );
  label( btex $(x_4,y_1)$ etex, a[3][0] );
  label( btex $(x_5,y_1)$ etex, a[4][0] );

  label( btex $(x_1,y_2)$ etex, a[0][1] );
  label( btex $(x_2,y_2)$ etex, a[1][1] );
  label( btex $(x_3,y_2)$ etex, a[2][1] );
  label( btex $(x_4,y_2)$ etex, a[3][1] );

  label( btex $(x_1,y_3)$ etex, a[0][2] );
  label( btex $(x_2,y_3)$ etex, a[1][2] );
  label( btex $(x_3,y_3)$ etex, a[2][2] );

  label( btex $(x_1,y_4)$ etex, a[0][3] );
  label( btex $(x_2,y_4)$ etex, a[1][3] );

  label( btex $(x_1,y_5)$ etex, a[0][4] );

  label( btex $\cdots$ etex, a[1][4] );
  label( btex $\cdots$ etex, a[2][3] );
  label( btex $\cdots$ etex, a[3][2] );
  label( btex $\cdots$ etex, a[4][1] );
  label( btex $\cdots$ etex, a[0][4] shifted (0,-0.7u ) );




endfig;
end