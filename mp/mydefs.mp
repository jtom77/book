input TEX;

BILDBREITE := 8cm;
__pictureoffset__ := 3mm;

string _ausrichtung;
string _skalierung;
string _definitionsbereich;
string _koordinaten;
string _achsenlabel;
string _funktionsname;
_ausrichtung := "Ausrichtung:";
_skalierung := "Skalierung:";
_definitionsbereich := "Plotbereich:";
_koordinaten := "Koordinaten:";
_funktionsname := "Funktionsname: f";
_achsenlabel := "Achsenlabel: x y";


TEXPRE("%&latex" & char(10) &
  "\documentclass{lehrbuch}\usepackage{amsmath,amssymb}\begin{document}\footnotesize");
TEXPOST("\end{document}");

animation := 0;
if( animation=0 ): filenametemplate "%j.eps"; fi;

debug := 0;

links = rechts = unten = oben = u = v = 1;
markdurchmesser := 3pt;

vardef widthof( expr p ) =
  abs(xpart lrcorner p - xpart llcorner p)
enddef;

vardef paper@# primary A  =
  links := xpart( point 0 of A );
  rechts := xpart( point 1 of A);
  unten := ypart( point 0 of A );
  oben := ypart( point 1 of A );
  _ausrichtung := "Ausrichtung: " & decimal(links) & " " & decimal(unten) & "  " & decimal(rechts) & " " & decimal(oben) ;  
  if str @# = "":
    u := BILDBREITE/(rechts-links);
  else :
    u := BILDBREITE/(rechts-links);
    Bildbreite := (BILDBREITE+widthof(thelabel(str @#,origin)));
    u := u*BILDBREITE/Bildbreite;
  fi;
  v := u;
  RAHMEN := (links*u,unten*v)--(rechts*u,unten*v)
    --(rechts*u,oben*v)--(links*u,oben*v)--cycle;
  write "	" to jobname & ".dat";
%  write "$$$" to jobname & ".dat";
  write aufgabe & "	" & decimal(charcode) to jobname & ".dat";
  write decimal(unten) & "	" & decimal(unten) %
    & "	" & decimal(rechts) & "	" & decimal(oben) to jobname & ".dat";
  if debug >0:
    _info := image(draw _info;
      label.lrt(aufgabe & "     " & jobname & " . " &   decimal(charcode),llcorner _info));
  fi;
enddef;

let Center = center;

def init = 
  drawoptions( withcmykcolor (0,0,0,1) withpen pencircle scaled 0.6pt )
enddef;

def allblue = 
  drawoptions( withcmykcolor (1,0,0,0) withpen pencircle scaled 0.6pt )
enddef;

input mp-tool.mpii;
input mp-spec.mpii;
cmykcolors := true;

ahlength := 3mm;
ahangle := 25;
prologues := 3;
labeloffset := 1.5pt;

defaultfont := "ptmr8r";
defaultscale := 1;

cmykcolor BLAUA;
BLAUA := (.5,.1,.0,.0);

def Grau = withcmykcolor (0,.0,.0,.3) enddef;
def Graua = withcmykcolor (0,.0,.0,.25) enddef;
def Graub = withcmykcolor (0,.0,.0,.15) enddef;
def Blau = withcmykcolor (0,.0,.0,.3) enddef;
def Blaua = withcmykcolor (0,.0,.0,.25) enddef;
def Blaub = withcmykcolor (0,.0,.0,.15) enddef;

%def Blau = withcmykcolor (1,.30,.0,.0) enddef; 
%def Blaua = withcmykcolor (.50,.10,.0,.0) enddef;  
%def Blaub = withcmykcolor (.15,.0,.0,.0) enddef;
%def Blauc = withcmykcolor (.15,.0,.0,.0) enddef; 
def Gruen = withcmykcolor (1,.0,.90,.0) enddef;  
def Gruena = withcmykcolor (.50,.0,.60,.0) enddef;  
def Gruenb = withcmykcolor (.20,.0,.20,.0) enddef;
def Gruenc = withcmykcolor (.20,.0,.20,.0) enddef;  
def Orange = withcmykcolor (.0,.30,1,.0) enddef;  
def Orangea = withcmykcolor (.0,.10,.50,.0) enddef;  
def Orangeb = withcmykcolor (.0,.0,.15,.0) enddef;
def Orangec = withcmykcolor (.0,.0,.15,.0) enddef;  
def Rot = withcmykcolor (.0,1,1,.0) enddef;  
def Rota = withcmykcolor (.0,.60,.40,.0) enddef;  
def Rotb = withcmykcolor (.0,.20,.20,.0) enddef;
def Rotc = withcmykcolor (.0,.20,.20,.0) enddef;  
def Gelb = withcmykcolor (.0,.0,1,.0) enddef;  
def Gelba = withcmykcolor (.0,.0,.50,.0) enddef;  
def Gelbb = withcmykcolor (.0,.0,.20,.0) enddef;  
def Gelbc = withcmykcolor (.0,.0,.20,.0) enddef;  

VERYTHIN := 0.2pt;
THIN := 0.4pt;
MEDIUM := 0.8pt;
THICK := 1.0pt;
VERYTHICK := 1.5pt;

def verythin = withpen pencircle scaled 0.2pt enddef;
def thin = withpen pencircle scaled 0.4pt enddef;
def medium = withpen pencircle scaled 0.8pt enddef;
def thick = withpen pencircle scaled 1.0pt enddef;
def verythick = withpen pencircle scaled 1.5pt enddef;
def very_thin = verythin enddef;
def very_thick = verythick enddef;

def mycolor = withcmykcolor (1,0,0,0) enddef;
def hell = withcmykcolor (0.35,0,0,0) enddef;
def grau = withcmykcolor (0,0,0,0.1) enddef;
def mygrau = withcmykcolor (0,0,0,0.5) enddef;
def dunkelgrau = withcmykcolor (0,0,0,0.2) enddef;
def weiss = withcmykcolor (0,0,0,0) enddef;

def gstyle= withcmykcolor (0,0,0,.5) withpen pencircle scaled 1pt enddef;
def gstylea = withcmykcolor (0,0,0,1) withpen pencircle scaled 1pt enddef;

def pi = 3.14159 enddef;
def radian := 180/pi enddef;
vardef exp( expr x ) = (mexp(256)**x) enddef;
vardef log( expr x ) = (if x=0: 0 else: mlog(x)/256 fi) enddef;
vardef cos( expr x ) = cosd( radian*x ) enddef;
vardef sin( expr x ) = sind( radian*x ) enddef;
vardef tan( expr x ) = sin(x)/cos(x) enddef;
vardef cot( expr x ) = cos(x)/sin(x) enddef;
vardef cosh( expr x ) = (exp(x)+exp(-x))/2 enddef;  
vardef sinh( expr x ) = (exp(x)-exp(-x))/2 enddef;  
vardef arcsind( expr x ) = angle((1+-+x,x)) enddef;
vardef arccosd( expr x ) = angle((x,1+-+x)) enddef;
vardef arccos primary x = if abs(x) <= 1:
    (angle(x, 1+-+x)/180*pi) else: 0 fi enddef;
vardef arcsin primary x = if abs(x) <= 1:
    (angle(1+-+x, x)/180*pi) else: 0 fi enddef;
vardef arctan primary x = arcsin(x/(1++x)) enddef;
vardef arccot primary x = arccos(x/(1++x)) enddef;



def smark primary A = draw A withpen pencircle scaled 1.5pt; enddef;

vardef dist( expr A, B ) = 
  u*sqrt( ( (xpart A-xpart B)/u )**2 + ( (ypart A-ypart B)/u )**2 )
enddef;

def markempty primary A =
  unfill fullcircle scaled 1.2mm shifted A;
  draw fullcircle scaled 1.2mm shifted A 
enddef;

def mark primary A  = draw A withpen pencircle scaled markdurchmesser enddef;
%cdef mark primary A  = markempty(A) enddef;

vardef anglepath( expr A, M, B, d ) =
  save @;
  path @[];
  @1 := M--(M+d*unitvector( A-M )){(A-M) rotated 90}..(M+d*unitvector( B-M )){(B-M) rotated 90}--cycle;
  @2 := M--(M+d*unitvector( B-M )){(B-M) rotated 90}..(M+d*unitvector( A-M )){(A-M) rotated 90}--cycle;
  if( arclength( @1 ) < arclength( @2 ) ):
    @1
  else:
    @2
  fi
enddef;


def drawangle( expr A, M, B, d ) = 
  begingroup;
    save @;
    path @[];
    @1 := (M+d*unitvector( A-M )){(A-M) rotated 90}..(M+d*unitvector( B-M )){(B-M) rotated 90};
    @2 := (M+d*unitvector( B-M )){(B-M) rotated 90}..(M+d*unitvector( A-M )){(A-M) rotated 90};
    if( arclength( @1 ) < arclength( @2 ) ):
      draw @1 thin;
    else:
      draw @2 thin;
    fi;
  endgroup;
enddef;

vardef anglept( expr A,M,B, d ) = 
  save @;
  path @[];
  @1 := (M+d*unitvector( A-M )){(A-M) rotated 90}..(M+d*unitvector( B-M )){(B-M) rotated 90};
  @2 := (M+d*unitvector( B-M )){(B-M) rotated 90}..(M+d*unitvector( A-M )){(A-M) rotated 90};
  if( arclength( @1 ) < arclength( @2 ) ):
%draw @1;
    point 0.5 of @1
  else:
%draw @2;
    point 0.5 of @2
  fi
enddef;

def drawrangle( expr A, M, B, d ) = 
  drawangle( A,M,B,d );
  draw anglept( A,M,B,0.5*d ) withpen pencircle scaled 1.5pt;
enddef;


vardef coordinatesystem( expr XMIN, XMAX, YMIN, YMAX, Beschriftung ) = 
  drawarrow (XMIN,0)--(XMAX,0);
  drawarrow (0,YMIN)--(0,YMAX);
enddef;

TICLENGTH:= .5mm;

def xtics( expr XMIN, XMAX, STP ) = 
  for i=XMIN step STP until XMAX: 
    draw (i,0)--(i,-TICLENGTH);
  endfor;
enddef;

def ytics( expr YMIN, YMAX, STP ) = 
  for i=YMIN step STP until YMAX: 
    draw (0,i)--(-TICLENGTH,i);
  endfor;
enddef;

vardef Graph( expr XMIN, XMAX, PLOTPOINTS )(text T) = 
  numeric DX;
  save DX;
  DX := (XMAX-XMIN)/PLOTPOINTS;
  pair GRAPHPOINT[];
  for i=0 upto PLOTPOINTS:
    GRAPHPOINT[i] := (u*(XMIN+i*DX), v*T(XMIN+i*DX) );
  endfor;
  GRAPHPOINT[0] for i=1 upto PLOTPOINTS: --GRAPHPOINT[i] endfor
enddef;  

path currentgraph;
__PLOT_POINTS := 200; 
vardef graph( expr t, XMIN, XMAX ) =
  _definitionsbereich := "Plotbereich: " & decimal(XMIN) & " " & decimal(XMAX);
  save  _q,_l, _r;
  path  _q,_l, _r;
  _l := (0,unten*v)--(links*u,unten*v)--(links*u,oben*v)--(0,oben*v);
  _r := (0,unten*v)--(rechts*u,unten*v)--(rechts*u,oben*v)--(0,oben*v);
  scantokens("vardef fff(expr x) = " & t & " enddef");
  _q := Graph( XMIN, XMAX, __PLOT_POINTS, fff );
  currentgraph := _q; _q
enddef;  

def glab(expr a) =
  if ypart (direction (a*length(currentgraph)) of currentgraph) < 0:
    label.llft(btex $f$ etex, point (a*length(currentgraph)) of currentgraph );
  else:
    label.ulft(btex $f$ etex, point (a*length(currentgraph)) of currentgraph );
  fi;
enddef;
def glabn(expr a, s) =
  _funktionsname := "Funktionsname: " & "s";
  if ypart (direction (a*length(currentgraph)) of currentgraph) < 0:
    label.llft(s, point (a*length(currentgraph)) of currentgraph );
  else:
    label.ulft(s, point (a*length(currentgraph)) of currentgraph );
  fi;
enddef;


def GLAB = glab(.9); enddef;

vardef paramcurve( expr t, s, XMIN, XMAX ) =
  save DX, GRAPHPOINT,PLOTPOINTS;
  numeric DX;
  PLOTPOINTS := __PLOT_POINTS;
  scantokens("vardef firstgraph(expr x) = " & t & " enddef");
  scantokens("vardef secgraph(expr x) = " & s & " enddef");
  DX := (XMAX-XMIN)/PLOTPOINTS;
  pair GRAPHPOINT[];
  for i=0 upto PLOTPOINTS:
    GRAPHPOINT[i] := (u*firstgraph(XMIN+i*DX), v*secgraph(XMIN+i*DX) );
  endfor;
  GRAPHPOINT[0] for i=1 upto PLOTPOINTS: --GRAPHPOINT[i] endfor
enddef;  

vardef ggraph( expr XMIN, XMAX, PLOTPOINTS ) = 
  numeric DX;
  save DX;
  DX := (XMAX-XMIN)/PLOTPOINTS;
  pair GRAPHPOINT[];
  for i=0 upto PLOTPOINTS:
    GRAPHPOINT[i] := (u*(XMIN+i*DX), v*g(XMIN+i*DX) );
  endfor;
  GRAPHPOINT[0] for i=1 upto PLOTPOINTS: --GRAPHPOINT[i] endfor
enddef;  

vardef hgraph( expr XMIN, XMAX, PLOTPOINTS ) = 
  numeric DX;
  save DX;
  DX := (XMAX-XMIN)/PLOTPOINTS;
  pair GRAPHPOINT[];
  for i=0 upto PLOTPOINTS:
    GRAPHPOINT[i] := (u*(XMIN+i*DX), v*h(XMIN+i*DX) );
  endfor;
  GRAPHPOINT[0] for i=1 upto PLOTPOINTS: --GRAPHPOINT[i] endfor
enddef;  

def netz( expr ueinheit, veinheit )=
  for i=0 step ueinheit until rechts-.5*ueinheit:
    draw (i*u,unten*v)--(i*u,oben*v)
      withpen pencircle scaled 0.15pt withcmykcolor (0,0,0,0.5);
  endfor;
  for i=-ueinheit step -ueinheit until links+.5*ueinheit:
    draw (i*u,unten*v)--(i*u,oben*v)
      withpen pencircle scaled 0.15pt withcmykcolor (0,0,0,0.5);
  endfor;
  for i=0 step veinheit until oben-.5*veinheit:
    draw (links*u,i*v)--(rechts*u,i*v) withpen pencircle scaled
      0.15pt withcmykcolor (0,0,0,0.5);
  endfor;
  for i=-veinheit step -veinheit until unten+.5*veinheit:
    draw (links*u,i*v)--(rechts*u,i*v) withpen pencircle scaled
      0.15pt withcmykcolor (0,0,0,0.5);
  endfor;
enddef;


def Netz( expr startu,startv,ueinheit, veinheit )=
  for i=startu step ueinheit until rechts:
    draw (i*u,unten*v)--(i*u,oben*v) withpen pencircle scaled 0.15pt withcmykcolor (0,0,0,0.5);
  endfor;
  for i=startv step veinheit until oben:
    draw (links*u,i*v)--(rechts*u,i*v) withpen pencircle scaled 0.15pt withcmykcolor (0,0,0,0.5);
  endfor;
enddef;

vardef labelxy@#  =
  if str @# = "lft":
    label.lft(btex $y$ etex, (-mm,oben*v-1.5mm));
  else:
    label.rt(btex $y$ etex, (mm,oben*v-1.5mm));
  fi;
  if str @# = "top":
    label.top(btex $x$ etex, (rechts*u-mm,mm) );
  else:
    label.bot(btex $x$ etex, (rechts*u-mm,-mm) );
  fi;
enddef;

vardef labelxf@#  =
  if str @# = "lft":
    label.lft(btex $f(x)$ etex, (-mm,oben*v-mm));
  else:
    label.rt(btex $f(x)$ etex, (mm,oben*v-mm));
  fi;
  label.bot(btex $x$ etex, (rechts*u-mm,-mm) );
enddef;

def Koordinaten( expr startu, startv, ueinheit, veinheit )=
  drawarrow (links*u,0)--(rechts*u,0);
  drawarrow (0,unten*v)--(0,oben*v);
  for i=-ueinheit step -ueinheit until startu:
    draw (i*u,0)--(i*u,-mm) thin;
    label.bot(_xlab1 & decimal(i) & _xlab2, (i*u,-mm));
  fi;
endfor;
for i=startv step veinheit until (oben-veinheit):
  if( not( i=0 ) ):
    draw (-mm,i*v)--(0,i*v) thin;
    label.lft( decimal(i), (-mm,i*v) );
  fi;
endfor;
enddef;

vardef oval( expr p, l ) =
  save a,b,c,d, A,B,C,D, AA, BB, CC, DD;
  path a,b,c,d,e;
  pair A,B,C,D, AA[], BB[], CC[], DD[];
  A := point 0 of p;
  B := point 1 of p;
  C := point 2 of p;
  D := point 3 of p;
  AA1 := A+l*unitvector( B-A );
  AA2 := B-l*unitvector( B-A );
  BB1 := B+l*unitvector( C-B );
  BB2 := C-l*unitvector( C-B );
  CC1 := C+l*unitvector( D-C );
  CC2 := D-l*unitvector( D-C );
  DD1 := D+l*unitvector( A-D );
  DD2 := A-l*unitvector( A-D );
  e := AA1---AA2..BB1---BB2..CC1---CC2..DD1---DD2..cycle;
  e
enddef;

def Drawangle( expr A, M, B, s ) = 
  draw (M+s*unitvector(A-M)){(A-M) rotated -90}..
    (M+s*unitvector(B-M)){(B-M) rotated -90};
enddef;

vardef Anglept( expr A,M,B,s ) = 
  1/2[M+s*unitvector(A-M),M+s*unitvector(B-M)]
enddef;

def Kreisausschnitt( expr M, A, r ) = 
  begingroup;
    path k;
    k := fullcircle scaled r;
    k := k rotated angle( A-M );
    k := k shifted M;
%draw k;
%mark( point 0 of k );
    draw subpath( 0,0.4 ) of k verythin;
    draw subpath( 0,0.4 ) of reverse(k) verythin;
  endgroup;
enddef;


vardef drawp( expr radius, sc, rot, shift ) = 
  save @, #, $,c;
  path @[];
  @1 := fullcircle scaled radius;
  @2 := @1 scaled sc rotated rot shifted shift;
  pair #[];
  pair $[];
  for i=0 upto 3:
    #[i] := point (2*i) of @1;
    $[i] := point (2*i) of @2;
  endfor;
  path c;
  c := #0..$0..#1..$1..#2..$2..#3..$3..cycle;
  c
enddef;

def breite = 
  show( (xpart(urcorner currentpicture)-xpart(ulcorner currentpicture))/(11.8cm) ); 
enddef;

def Breite( expr soll ) = 
  begingroup;
    save ist;
    numeric ist;
    ist := (xpart(urcorner currentpicture)-xpart(ulcorner currentpicture));
    show( soll*(11.8cm)/ist ); 
  endgroup;
enddef;

def hoehe = 
  show( (ypart(urcorner currentpicture)-ypart(lrcorner currentpicture))/mm ); 
enddef;

def normal = withpen pencircle scaled 0.8pt withcmykcolor( 0, 0, 0, 1 ) enddef; 


def drawmeasure( expr A, B ) = 
  begingroup;
    ahlength := 1.5mm;
    drawdblarrow A--B thin;
    ahlength := 3mm;
    draw (A-5*unitvector( (A-B) rotated 90 ))--(A+5*unitvector( (A-B) rotated 90 )) thin;
    draw (B-5*unitvector( (A-B) rotated 90 ))--(B+5*unitvector( (A-B) rotated 90 )) thin;
  endgroup;
enddef;

path RAHMEN;

def draw_rahmen =
  RAHMEN := (links*u,unten*v)--(rechts*u,unten*v)
    --(rechts*u,oben*v)--(links*u,oben*v)--cycle;
  draw RAHMEN;
enddef;

def clipit =
  RAHMEN := (links*u,unten*v)--(rechts*u,unten*v)
    --(rechts*u,oben*v)--(links*u,oben*v)--cycle;
  clip currentpicture to RAHMEN;
enddef;

def zentrieren =
  save Breite, Rand;
  Breite := xpart(lrcorner bbox currentpicture) - xpart(llcorner bbox currentpicture); 
  Rand := .5*(8cm-Breite);
  draw (llcorner bbox currentpicture) shifted (-Rand,5) withcolor white withpen nullpen;
  draw (lrcorner bbox currentpicture) shifted ( Rand,5) withcolor white withpen nullpen;
enddef;

def latexvec expr p =
  begingroup;
    save @; path @;
    @ := (-ahlength*sind(ahangle),-ahlength){dir 20}..origin{dir 80} &
      origin{dir -80}..(ahlength*sind(ahangle),-ahlength){dir -20};
    @ := @ rotated -90;
    draw @ rotated angle((point length p of p)-(point 0 of p))
      shifted point length p of p;
    draw p
  endgroup;
enddef;

def drawvec( expr A, B) = 
  begingroup;
    save p;
    path p;
    p := A--( B-2*unitvector( B-A ) );
    draw p;
    interim linejoin := mitered;
    interim linecap := butt;
    fill arrowhead p weiss;
    draw arrowhead p;
  endgroup;
enddef;

def drawvector expr q =
  drawvec( point 0 of q, point 1 of q)
enddef;


def zigzag( expr A, B ) = 
  begingroup;
    save C, D, E, F, r;
    pair C,D,E,F;
    numeric r;
    C := 1.5/5[A,B];
    D := 2/5[A,B];
    E := 3/5[A,B];
    F := 3.5/5[A,B];
    r := 0.25*abs( (A-B) );
    D := D shifted (r*unitvector( (A-B) rotated 90 ));
    E := E shifted (r*unitvector( (A-B) rotated -90 ));
    draw A--C--D--E--F--B;
  endgroup;
enddef;



def schnittkreise( expr A, B, offs ) = 
  RADIUS := u*sqrt( ( (xpart A-xpart B)/u )**2 + ( (ypart A-ypart B)/u )**2 ) + offs; 
  path KREIS[];
  KREIS1 := fullcircle scaled RADIUS shifted A;
  KREIS2 := fullcircle scaled RADIUS shifted B;
  pair SCHNITT[];
  SCHNITT1 := KREIS1 intersectionpoint KREIS2;
  SCHNITT2 := (subpath( length(KREIS1), 0) of KREIS1) intersectionpoint KREIS2;
  draw SCHNITT1--SCHNITT2;
%draw KREIS1;
%draw KREIS2;
  numeric SCHNITTPARAMETER[];
  SCHNITTPARAMETER1 := xpart( KREIS1 intersectiontimes (SCHNITT1--( SCHNITT1+0.5*(SCHNITT2-SCHNITT1) ) ) );
  SCHNITTPARAMETER2 := xpart( KREIS1 intersectiontimes (SCHNITT2--( SCHNITT2+0.5*(SCHNITT1-SCHNITT2) ) ) );
  path FERTIG;
  FERTIG := subpath( SCHNITTPARAMETER1 -0.3, SCHNITTPARAMETER2 + 0.3 ) of KREIS1;
  draw FERTIG thin;
  draw (FERTIG reflectedabout(SCHNITT1,SCHNITT2)) thin;
enddef;


vardef coordinatesystem( expr XMIN, XMAX, YMIN, YMAX, Beschriftung ) = 
  drawarrow (XMIN,0)--(XMAX,0);
  drawarrow (0,YMIN)--(0,YMAX);
enddef;


numeric XNOT[];
numeric YNOT[];
XNOT1:=0;
XNOT2:=0;
XNOT3:=0;
YNOT1:=0;
YNOT2:=0;
YNOT3:=0;
NONUMBERS:=1;
LASTNUMBERY := infinity;
LASTNUMBERX := infinity;
string __s__;


string _xlab[];
string _ylab[];
_ylab1 := "";
_ylab2 := "";
_xlab1 := "";
_xlab2 := "";

vardef koordinaten( expr ueinheit, veinheit )=
  save l;
  if debug > 1:
    _koordinaten := "Koordinaten: " & decimal(ueinheit) & " " & decimal(veinheit);
    _info := image(draw _info;
      label.lrt(_koordinaten, llcorner _info - (0,5));
      );
  fi;
  drawarrow (links*u,0)--(rechts*u,0);
  drawarrow (0,unten*v)--(0,oben*v);
  for i=-ueinheit step -ueinheit until (links+ahlength/u):
    draw (i*u,0)--(i*u,-mm) thin;
    if( ueinheit=floor(ueinheit) ):
      __s__ := char(12) & decimal(abs i);
    else:
      l := length(decimal(floor(abs ueinheit)))+1;
      __s__ := char(12) & decimal(round (abs i)) & "." & substring(l,length(decimal(abs ueinheit))+floor(abs(i/10))) of decimal(abs i+0.0001);
    fi;
    label.bot( __s__, (i*u,-mm) );
  endfor;
  for i=ueinheit step ueinheit until (rechts-ahlength/u):
    draw (i*u,0)--(i*u,-mm) thin;
    if( ueinheit=floor(ueinheit) ):
      __s__ := decimal(i);
    else:
      l := length(decimal(floor(abs ueinheit)))+1;
      __s__ := decimal(floor i) & "." & substring(l,length(decimal(ueinheit))+floor(abs(i/10))) of decimal(abs i+0.0001);
    fi;
    label.bot( __s__, (i*u,-mm) );
  endfor;
  for i= if veinheit*v<5mm: -2*veinheit else: -veinheit fi step -veinheit until (unten+ahlength/v):
    draw (0,i*v)--(-mm,i*v) thin;
    if( veinheit=floor(veinheit) ):
      __s__ := char(12) & decimal(abs i);
    else:
      l := length(decimal(floor(abs veinheit)))+1;
      __s__ := char(12) & decimal(floor (abs i)) & "." & substring(l,length(decimal(veinheit))+floor(abs(i/10))) of decimal(abs i +0.0001);
    fi;
    label.lft( __s__, (-mm,i*v) );
  endfor;
  for i=veinheit step veinheit until (oben-ahlength/v):
    draw (0,i*v)--(-mm,i*v) thin;
    if( veinheit=floor(veinheit) ):
      __s__ := decimal(i);
    else:
      l := length(decimal(floor(abs veinheit)))+1;
      __s__ := decimal(floor i) & "." & substring(l,length(decimal(veinheit))+floor(abs(i/10))) of decimal(abs i+0.0001);
    fi;
    label.lft( __s__, (-mm,i*v) );
  endfor;
  if( unten=0 ):
    __s__:="0";
    draw (0,0)--(0,-mm) thin;
  fi;
enddef;


vardef matlab_koordinaten( expr ueinheit, veinheit )=
  save l;

  netz(ueinheit,veinheit);
  draw (links*u,unten*v)--(rechts*u,unten*v)--(rechts*u,oben*v)--(links*u,oben*v)--cycle;

  for i=-ueinheit step -ueinheit until links: %until (links+ahlength/u):
    draw (i*u,unten*v)--(i*u,unten*v+mm) thin;
    if( ueinheit=floor(ueinheit) ):
      __s__ := char(12) & decimal(abs i);
    else:
      l := length(decimal(floor(abs ueinheit)))+1;
      __s__ := char(12) & decimal(round (abs i)) & "." & substring(l,length(decimal(abs ueinheit))+floor(abs(i/10))) of decimal(abs i+0.0001);
    fi;
    label.bot( __s__, (i*u,unten*v-mm) );
  endfor;

  for i=0 step ueinheit until rechts: 
    draw (i*u,unten*v)--(i*u,unten*v+mm) thin;
    if( ueinheit=floor(ueinheit) ):
      __s__ := decimal(i);
    else:
      l := length(decimal(floor(abs ueinheit)))+1;
      __s__ := decimal(round i) & "." & substring(l,length(decimal(ueinheit))+floor(abs(i/10))) of decimal(abs i+0.0001);
    fi;
    label.bot( __s__, (i*u,unten*v-mm) );
  endfor;

  for i=0 step -veinheit until unten:
    draw (links*u,i*v)--(links*u+mm,i*v) thin;
    if( veinheit=floor(veinheit) ):
      __s__ := char(12) & decimal(abs i);
    else:
      l := length(decimal(floor(abs veinheit)))+1;
      __s__ := char(12) & decimal(floor (abs i)) & "." & substring(l,length(decimal(veinheit))+floor(abs(i/10))) of decimal(abs i +0.0001);
    fi;
    label.lft( __s__, (links*u-mm,i*v) );
  endfor;
  
  for i=0 step veinheit until oben:
    draw (links*u,i*v)--(links*u+mm,i*v) thin;
    if( veinheit=floor(veinheit) ):
      __s__ := decimal(i);
    else:
      l := length(decimal(floor(abs veinheit)))+1;
      __s__ := decimal(floor i) & "." & substring(l,length(decimal(veinheit))+floor(abs(i/10))) of decimal(abs i+0.0001);
    fi;
    label.lft( __s__, (links*u-mm,i*v) );
  endfor;
  if( unten=0 ):
    __s__:="0";
    draw (0,unten*v)--(0,unten*v+mm) thin;
  fi;
enddef;




def kooordinaten( expr xstart, xstop, ueinheit, ystart, ystop, veinheit )=
  drawarrow (links*u,0)--(rechts*u,0);
  drawarrow (0,unten*v)--(0,oben*v);
  for i= xstart step ueinheit until xstop:
    if( not(i=0) ):
      draw (i*u,0)--(i*u,-mm);
      __s__ := substring(0,3) of decimal(i);
      label.bot(TEX(__s__), (i*u,-mm) );
    fi;
  endfor;
  for i= ystart step veinheit until ystop:
    if( not(i=0) ):
      draw (-mm,i*v)--(0,i*v) thin;
      __s__ := substring(0,3) of decimal(i);
      label.lft( TEX(__s__), (-mm,i*v) );
    fi;
  endfor;
enddef;


vardef showcontrols( expr c ) =
  for i=0 upto length( c ):
    draw precontrol i of c -- postcontrol i of c thin;
    mark postcontrol i of c;
    markempty( precontrol i of c );
    draw (point i of c) withcolor red withpen pencircle scaled 3pt;
  endfor;
enddef;


vardef docontrols( expr c, n, s, r, rot ) =
  pair d;
  pair A[]; pair B[];
  path w;
  if( n=length(c) ):
    d := (point n of c) - (precontrol n of c);
  else:
    d := (postcontrol n of c) - ( point n of c );
  fi;

  d := d rotated rot;
    
  for i=0 upto length(c): 
    B[i] := postcontrol i of c;
    A[i] := precontrol i of c;
  endfor;
  B[n] := (point n of c) + r*d;
  A[n] := (point n of c) - s*d;

  w := point 0 of c 
    for i=0 upto (length(c)-1) :
    ..controls B[i] and A[i+1] .. point (i+1) of c
  endfor;
  w
enddef;


path tcircle;
tcircle := (1,0){up} .. (0,1){left}..(-1,0){down}..(0,-1){right}..cycle;

path XAXIS, YAXIS;
XAXIS := (-infinity,0)--(infinity,0);
YAXIS := (0,-infinity)--(0,infinity);


def border =
  begingroup;
    save A,B,_p;
    pair A,B;
    picture _p;
    A := llcorner currentpicture ;
    B := ulcorner currentpicture ;

    factor := 8cm/(xpart(lrcorner currentpicture)
	- xpart(llcorner currentpicture));

    show( decimal( factor ) & "\n" );
    
    _p := currentpicture;
    currentpicture := nullpicture;

    u := u*factor;
    
    fill A--A+(8cm,0)--B+(8cm,0)--B--cycle withcolor 0.9 white;
    draw A--A+(8cm,0)--B+(8cm,0)--B--cycle ;

    draw _p;
    
  endgroup;
enddef;


def grid (expr xstart, xstop, ystart, ystop, ink ) =
  for i=ystart step ink until ystop:
    draw (u*xstart-3mm,i*v)--(u*xstop+3mm,i*v);
    label.lft( decimal(ceiling(i/ink)), (u*xstart-3mm,i*v) );
  endfor;
  for i=xstart step ink until xstop:
    draw (i*u,v*ystart-3mm)--(i*u,v*ystop+3mm);
    label.bot( decimal(ceiling(i/ink)), (i*u,v*ystart-3mm) );
  endfor;
  
enddef;

vardef hoehe(expr x) = (ypart(ulcorner bbox x))-(ypart(llcorner bbox x))
enddef;

def halign( expr x,y, offs ) =
  x shifted( xpart(llcorner bbox y)-xpart(lrcorner bbox x) - offs,
      ypart(llcorner bbox y)-ypart(llcorner bbox x) );
enddef;

def valign( expr x,y, offs ) =
  x shifted( xpart(llcorner bbox y)-xpart(llcorner bbox x),
      ypart(ulcorner bbox y)-ypart(llcorner bbox x) + offs );
enddef;


def achsen =
  drawarrow (links*u,0)--(rechts*u,0);
  drawarrow (0,unten*v)--(0,oben*v);
enddef;

def achsenlabel( expr b, a ) =
  label.rt(a, (mm,oben*v-mm));
  label.bot(b, (rechts*u-mm,-mm));
enddef;


def randomcolor = withcmykcolor
  (uniformdeviate(1),
      uniformdeviate(1),
      uniformdeviate(1), 0)
enddef;

def randomrgb = withcmykcolor
  (uniformdeviate(1),
      uniformdeviate(1),
      uniformdeviate(1))
enddef;


def dotarrow primary c =
  drawarrow (point 0 of c)--(point 1 of c - .6*markdurchmesser*
      unitvector( point 1 of c - point 0 of c));
enddef;


path vec_head;
vec_head_length := 2mm;
vec_head := ((-1,-.5)..{right}origin{left}..(-1,.5)) scaled vec_head_length;

def drawvec primary c =
  draw c;
  draw (vec_head rotated angle(point 1 of c-point 0 of c)
      shifted (point 1 of c))
enddef;

def dot( expr x ) = mark x; enddef;

def rnd( expr x ) = uniformdeviate( x ) enddef;

def fillcolor = withcolor .9 white enddef;

vardef fillabel@#( expr a, b ) =
  save _p;
  picture _p;
  _p := thelabel.@#( a, b );
  unfill bbox _p;
  draw _p;
enddef;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vardef gq( expr x ) = (u*x,v*f(x)) enddef;

vardef gp( expr x )(text t) =
  (u*x, v*t( x ))
enddef;

vardef gy(expr q,y) =
  q intersectionpoint ( (-infinity,y*v) -- (infinity,y*v) )
enddef;
vardef gx(expr q,x) =
  q intersectionpoint ( (x*u,-infinity) -- (x*u,infinity) )
enddef;




vardef setqpoly( expr name, a,b,c  ) =
%  scantokens("vardef f(expr x) = (" & decimal(a) & ")*(x**2)" & "enddef;");
  scantokens("vardef " & name & "(expr x) = (" & decimal(a) & ")*(x**2) + (" & decimal(b) & ")*x +(" & decimal(c) & ") enddef;");
enddef;

vardef setcpoly( expr name, a,b,c,d  ) =
  scantokens("vardef " & name & "(expr x) = (" & decimal(a) & ")*(x**3) + (" & decimal(b) & ")*(x**2) + (" & decimal(c) & ") + (" decimal(d)  ") enddef;");
enddef;

def xlabel( expr A ) = label.ulft(A,(rechts*u,mm)); enddef;
def ylabel( expr A ) = label.lrt(A,(mm,oben*v)); enddef;

string aufgabe;
aufgabe := "";


def savebbox =
  interim bboxmargin := 0;
  save _bbox; path _bbox; _bbox = bbox currentpicture;
enddef;
def restorebbox =
  setbounds currentpicture to _bbox;
enddef;


vardef graphname(expr x) =
  if debug > 0:
    defaultfont := "ptmr8r";
    save _p,_crbb;
    save A;
    pair A;
    picture _p;
 %    savebbox;
    if debug = 2:
	% _p := thelabel.llft(x,urcorner currentpicture);
	% fill bbox _p withcolor .9white;
	% draw bbox _p;
	% draw _p;
      _p := thelabel.lrt(aufgabe,ulcorner currentpicture);
      fill bbox _p;
      draw bbox _p withcolor .5white;
      draw _p withcolor white;
    else:
      A := urcorner bbox currentpicture shifted (3mm,0);
      _p := thelabel.lrt(aufgabe,A); draw _p;
      _p := thelabel.lrt(x,A-(0,12pt)); draw _p;
      _p := thelabel.lrt(_ausrichtung, A-(0,2*12pt) ); draw _p;
      _p := thelabel.lrt(_koordinaten, A - (0,3*12pt)); draw _p;
      _p := thelabel.lrt(_funktionsname, A - (0,4*12pt)); draw _p;
      _p := thelabel.lrt(_achsenlabel, A - (0,5*12pt)); draw _p;
      _p := thelabel.lrt(_definitionsbereich, A - (0,6*12pt)); draw _p;
      _skalierung := "Skalierung: " & decimal(v/u);
      _p := thelabel.lrt(_skalierung, A- (0,7*12pt)); draw _p;
    fi;
%	restorebbox;
%	draw bbox currentpicture;
  fi;
  defaultfont := "ptmr8r";
enddef;


vardef fillint( expr t, XMIN, XMAX ) =
  save _q;
  path _q;
  scantokens("vardef fff(expr x) = " & t & " enddef");
  _q := Graph( XMIN, XMAX, __PLOT_POINTS, fff );
  fill (XMIN*u,0)-- _q -- (XMAX*u,0)--cycle Graua;
%draw _q;
enddef;

vardef quadsolve( expr a, b, c ) =
  (-b/(2a)-sqrt( (b*b)/(4*a*a) - c/a ) , -b/(2a)+sqrt( (b*b)/(4*a*a) - c/a ))
enddef;

vardef tang(expr x) =
  save _len, d;
  _len := .35*BILDBREITE;
  pair d;
  d := _len*unitvector ( gp(x-0.001,f) - gp(x+0.001,f) );
  draw gp(x,f)+d -- gp(x,f)-d thin;
  mark gp(x,f);
enddef;

vardef connect(expr x)=
  mark gp(x,f);
  mark gp(x,g);
  draw gp(x,f)--gp(x,g) thin;
enddef;


def axx := (rechts*u-mm,-mm) enddef;
def axy := (mm,oben*v-mm) enddef;
def axyl := (-mm,oben*v-mm) enddef;

string __halign;
string __valign;
__halign := "top";
__valign := "left";

secondarydef p rightof q =
  if(__halign="top"):
    p shifted ((urcorner q - ulcorner p) + (__pictureoffset__,0))
  else:
    if(__halign="bottom"):
      p shifted ((lrcorner q - llcorner p) + (__pictureoffset__,0))
    else:
      p shifted (((point 1.5 of bbox q)-(point 3.5 of bbox p)) + (__pictureoffset__,0))
    fi
  fi	
enddef;

secondarydef p leftof q =
  p shifted ((ulcorner q - urcorner p) + (-__pictureoffset__,0))
enddef;

secondarydef p belowof q =
  p shifted ((llcorner q - ulcorner p) + (0,-__pictureoffset__))
enddef;

secondarydef p topof q =
  p shifted ((ulcorner q - llcorner p) + (0,__pictureoffset__))
enddef;

vardef savepic =
  save _p;
  picture _p;
  _p := currentpicture;
  currentpicture := nullpicture;
  _p
enddef;


boolean __bboxfilled__;
__bboxfilled__ := false;

vardef xtic@#(expr x, s) =
  save p;
  picture p;
  if str @# = "top":
    draw (x*u,0)--(x*u,mm) thin;
    p := thelabel.top(s, (x*u,mm));
  else:
    draw (x*u,0)--(x*u,-mm) thin;
    p := thelabel.bot(s, (x*u,-mm));
  fi

  if __bboxfilled__:
    unfill bbox p;
  fi;
  draw p;
enddef;


vardef ytic@#(expr x, s) =
  if str @# = "rt":
    draw (0,x*v)--(mm,x*v) thin;
    label.rt(s, (mm,x*v));
  else:
    draw (0,x*v)--(-mm,x*v) thin;
    label.lft(s, (-mm,x*v));
  fi;
enddef;


vardef labx(expr lab, pos) =
  label.bot(lab, (pos - mm, -mm));
enddef;

vardef laby(expr lab, pos) =
  label.llft(lab, (-mm, pos));
enddef;
