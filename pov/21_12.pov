#include "math.inc"
#include "colors.inc"
#include "mymacros.inc"
//#include "23_08.inc"
#include "golds.inc"


#declare surfaceline_thickness = .3*surfaceline_thickness;
#declare s = .015; // Breite der Hoehenlinien

#declare r = .3;
#declare F = function( x,z ){ r*(x*x-z*z)  }
#declare Fx = function( x,z ){ x  }
#declare Fz = function( x,z ){ z  }
#declare Fy = function( x,z ){ r*(pow(Fx(x,z),2)-pow(Fz(x,z),2))  }

#declare s=.06;


#macro t_g ()
  texture{ pigment{ gradient y scale .5*r
  color_map{
  [0.0 color Black]
  [s color Black]
  [s color rgbt<1,1,1,1>]
  [1-s color rgbt<1,1,1,1>]
  [1-s color Black]
  }}}
  texture{ pigment{ gradient y scale 4 translate <0,r,0> 
  color_map{
  [0.0 color Black]
  [s/8 color Black]
  [s/8 color rgbt<1,1,1,1>]
  [1-s/8 color rgbt<1,1,1,1>]
  [1-s/8 color Black]
  }}}
#end


#declare Graph = union{ParamNetNN( -2, 2, -2, 2, 100, 100, 20, 20 ) }
object{ Graph 
  texture{
    pigment{ color rgbt<.8,.8,.8,0> }
    finish{ ambient .2 }
  }
  t_g()
}
object{ Graph 
  texture{
    pigment{ color rgbt<.9,.9,.9,0> }
    finish{ ambient .4 }
  }
  t_g()
  scale <1,.001,1> translate <0,-2.01,0>
}
object{ Netz 
  texture{ pigment{ Black } finish{ ambient .6 diffuse .6 reflection .7}}
  t_g ()
}

#declare R = function( x ){ sqrt( - 20* ln( (12.2-x)/10.0 ) )  }
#declare Thickness=0.01;
#declare MyColor = rgb<0.8,0.8,0.8>;
#declare Step = 0.02;// step value

#declare pfeilbreite=0.03;
#declare pfeillaenge=.12;

#declare pfeilbreite = 1.6*pfeilbreite;
#declare h=.5*r;

#while (h <= 4*r)
  #declare G = union{
    #declare T = -2;
    #while (T<2 )
      #declare A = <sqrt(h/r)*cosh(T),0,sqrt(h/r)*sinh(T)>; 
      #declare T = T+.4;
      #declare B = A + .3*< A.x,0,-A.z >;
      #if (max( abs(A.x), abs(A.z) ) < 2) 
	object{ Pfeil( A, B ) }
	#declare A=<A.z,0,A.x>;
	object{ Pfeil( A, A + .3*< A.x,0,-A.z > ) }
      #end
    #end
  }
  union{
    object{G}
    object{G rotate <0,180,0>  }
    scale <1,.1,1> 
    translate < 0, -2, 0>
    pigment{color Black }
  }
  #declare h=h+.5*r;
#end


object{ 
  koordinaten( 5,3,5 ) 
  translate <-2.5,-2,-2.5> pigment{ Black } 
}

object{ box { <-2,-1,-2>, <2,1,2> } 
  scale 0.001*y translate <0,r,0> 
  texture{ 
    pigment{ color rgbt<.8,.8,.8,.5> } 
    finish{ ambient .2 }
  }
} 

background { White }


camera {
  orthographic
  location <7,3,4> 
  look_at <0,0,0>
}


light_source {
  <0,100,0>
  color rgb <1,1,1> 
shadowless
}


light_source {
  <0,0,100>
  color rgb <1,1,1> 
shadowless
}

light_source {
  <100,0,0>  color rgb <1,1,1> 
shadowless
}
