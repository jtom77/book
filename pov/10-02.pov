#include "mymacros.inc"

#declare camera_loc = <1,.3,1> * 3;
#declare look_at_loc = <0,0,0>;
#declare surfaceline_thickness = .005;
anpassen(0.3)
#declare pfeillaenge = .25;
#declare pfeilbreite = pfeillaenge/4;

camera {
  orthographic
  location <1.5,1,-0.3>*4.3
  look_at <0,1,0>
}

light_source {
  <100,100,100>
  color rgb <1,1,1> 
  shadowless
}

#declare _scale_ = .8;
#declare diff = 2*_scale_;

#declare Fx = function(x,z) {z*cos(x)}
#declare Fz = function(x,z) {z*sin(x)}
#declare Fy = function(x,z) { 2*Fx(x,z)*Fz(x,z)/(pow(Fx(x,z),2)+pow(Fz(x,z),2)) }

#declare Graph = union{ 
  ParamNetNN( 0,2*pi,0.01,2,160, 160, 20,10 ) 
}

object{
  koordinaten(2.5,2,2.5)
}

object{
  Graph 
  texture{ 
    pigment{ color rgbt<.7,.7,.7,.1> }
    finish{ ambient .9 diffuse .5 }
  }
}

object{
  Netz 
  texture{ 
    pigment{ color rgb<0,0,0> }
  }
}




#declare inner = texture{
  pigment{White}
  finish{ambient .9}
}

#declare outer = texture{
  pigment{Black}
}



background{ color rgb<1,1,1> }




