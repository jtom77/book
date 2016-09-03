numeric pi; 
pi := 3.1415962;
vardef exp primary x = ((mexp 256)**x) enddef;
vardef sin primary x = (sind(x*180/pi)) enddef;
vardef cos primary x = (cosd(x*180/pi)) enddef;


u := 1cm;

beginfig(1);


numeric r[][];
pair a[][];

xmin := -2; 
xmax := 2;
ymin := -5;
ymax := 5;
Mx := 20;
My := 40;
dx := (xmax-xmin)/Mx;
dy := (ymax-ymin)/My;
numeric e, ree, imm;


for i=0 upto Mx:
e := exp( xmin + i*dx );
for j=0 upto My:
ree := cos( ymin + j*dy );
imm := sin( ymin + j*dy );
r[i][j] := e*ree;
a[i][j] := ( xmin+i*dx-0.5*( ymin+j*dy), 0.5*r[i][j]-0.5*( ymin+j*dy ) )*u;
%draw a[i][j] withpen pencircle scaled 4; 
endfor
endfor

for i=0 upto Mx-1:
for j=0 upto My-2:
fill a[i][j]--a[i+1][j]--a[i+1][j+1]--a[i][j+1]--cycle withcolor white;
draw a[i][j]--a[i+1][j]--a[i+1][j+1]--a[i][j+1]--cycle withpen pencircle scaled 0.5pt;
endfor
endfor

drawarrow (0,0)--(3u,0);
drawarrow (0,0)--(0,3u);
drawarrow (0,0)--(-1.5,-1.5)*u;



endfig;
end